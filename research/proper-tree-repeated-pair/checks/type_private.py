"""Exact checks for the 258-vertex witness and same-weight boundary cases."""
from collections import Counter
from itertools import combinations


def layer(W, edges, k):
    result = Counter()
    for F in combinations(edges, k):
        label = list(range(len(W)))
        for u, v in F:
            a, b = label[u], label[v]
            assert a != b  # All edge subsets are acyclic.
            label = [a if x == b else x for x in label]
        sums = Counter()
        for x, w in zip(label, W):
            sums[x] += w
        result[tuple(sorted(sums.values()))] += 1
    return result


def verify_separation(W):
    multisets = {x for k in range(1, 5) for x in combinations(sorted(W), k)}
    assert len({sum(x) for x in multisets}) == len(multisets)
    return len(multisets)


def query(W, layers, blocks):
    k = sum(len(b) - 1 for b in blocks)
    used = Counter(w for b in blocks for w in b)
    if used - Counter(W):
        return 0
    P = tuple(sorted([sum(b) for b in blocks] + list((Counter(W) - used).elements())))
    return layers[k][P]


def verify_recovered_edges(W, edges, anchors):
    # Recover everything from counts except that actual incidences serve as
    # comparison values and designate one representative per repeated vertex.
    counts = [layer(W, edges, k) for k in range(4)]
    actual = {frozenset(e) for e in edges}
    query_stats = {}
    checks = 0
    for i, j in combinations(anchors, 2):
        a, b = W[i], W[j]
        u, v = anchors[i], anchors[j]
        if u == v:
            assert frozenset((i, j)) not in actual
            continue
        assert (sum(W[y] == a for x, y in edges if x == u)
                + sum(W[x] == a for x, y in edges if y == u)) == 1
        assert (sum(W[y] == b for x, y in edges if x == v)
                + sum(W[x] == b for x, y in edges if y == v)) == 1
        E = query(W, counts, ((a, b),))
        d_i = E - query(W, counts, ((W[u], a), (a, b)))
        d_j = E - query(W, counts, ((W[v], b), (a, b)))
        M = query(W, counts, ((W[u], a), (a, b), (b, W[v])))
        assert M - E + d_i + d_j == (frozenset((i, j)) in actual)
        query_stats[i, j] = E, d_i, d_j, M
        checks += 1
    return counts, query_stats, checks


W = (2, 2, 2, 2, 5, 5, 5, 5, 19, 33, 61, 117)
C = tuple((i + 8, j) for i in range(4) for j in (i, i + 4)) + ((8, 9),)
A, B = C + ((0, 6), (1, 7)), C + ((0, 7), (1, 6))
anchors = {i: 8 + i % 4 for i in range(8)}
assert sum(W) == 258 and verify_separation(W) == 103
assert all(layer(W, T, 11) == {(258,): 1} for T in (A, B))
assert all(sum(1 for e in C if u in e and min(e) < 8) == 2 for u in range(8, 12))
LA, a, na = verify_recovered_edges(W, A, anchors)
LB, b, nb = verify_recovered_edges(W, B, anchors)
assert LA[:3] == LB[:3]
assert a[0, 6] == (2, 1, 1, 1) and b[0, 6] == (2, 1, 1, 0)
P = (2, 2, 5, 5, 7, 21, 33, 66, 117)
assert (LA[3][P], LB[3][P]) == (1, 0)
print(f'PASS: 258 total weight, 103 distinct short sums; {na + nb} pair formulas across the two cores.')
print('Layers 0–2 are equal; third layer', P, 'has counts 1 and 0; (E,d_i,d_j,M)', a[0, 6], b[0, 6])

W = (2, 2, 2, 2, 11, 31, 89, 257)
E = ((0, 1), (1, 2), (2, 3), (0, 4), (1, 5), (2, 6), (3, 7))
verify_separation(W)
_, s, n = verify_recovered_edges(W, E, {i: i + 4 for i in range(4)})
assert s[1, 2] == (3, 2, 2, 0)
assert s[0, 3] == (3, 1, 1, 1)
W = (2, 2, 11, 31)
E = ((0, 1), (0, 2), (1, 3))
verify_separation(W)
_, s, n2 = verify_recovered_edges(W, E, {0: 2, 1: 3})
assert s[0, 1] == (1, 1, 1, 0)
print(f'PASS: {n + n2} same-weight pair checks; includes impossible templates and M=1 for a nonedge.')

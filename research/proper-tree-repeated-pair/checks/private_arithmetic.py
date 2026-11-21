"""Exact verification of the strict 138-vertex private-anchor example."""
from collections import Counter, defaultdict
from itertools import combinations

W = (2, 2, 3, 3, 4, 14, 15, 23, 24, 48)
COMMON = ((0, 4), (1, 5), (2, 6), (3, 7), (4, 8), (0, 9), (1, 9))
TREES = (COMMON + ((0, 2), (1, 3)), COMMON + ((0, 3), (1, 2)))
N = len(W)


def component_partition(edges):
    neighbors = [set() for _ in W]
    for i, j in edges:
        neighbors[i].add(j)
        neighbors[j].add(i)
    unseen = set(range(N))
    result = []
    while unseen:
        stack = [unseen.pop()]
        block = []
        while stack:
            x = stack.pop()
            block.append(x)
            more = neighbors[x] & unseen
            unseen.difference_update(more)
            stack.extend(more)
        result.append(block)
    return result


def profile(blocks):
    return tuple(sorted(tuple(sorted(W[i] for i in b)) for b in blocks))


def summed(p):
    return tuple(sorted(map(sum, p)))


def layers(edges):
    return [Counter(summed(profile(component_partition(F)))
                    for F in combinations(edges, k)) for k in range(4)]


def partitions(n):
    # Restricted-growth words, giving each labelled set partition exactly once.
    def grow(labels, maximum):
        if len(labels) == n:
            blocks = [[] for _ in range(maximum + 1)]
            for i, label in enumerate(labels):
                blocks[label].append(i)
            yield blocks
            return
        for label in range(maximum + 2):
            yield from grow(labels + (label,), max(label, maximum))
    yield from grow((0,), 0)


assert sum(W) == 138 and W[4] == W[0] + W[1]
assert all(len(E) == N - 1 and len(component_partition(E)) == 1 for E in TREES)
unique = {i for i, w in enumerate(W) if W.count(w) == 1}
repeated = set(range(N)) - unique

def repeat_neighbors(v, edges):
    return {j if i == v else i for i, j in edges if v in (i, j)} & repeated

for edges in TREES:
    assert repeat_neighbors(9, edges) == {0, 1}
    private = {i: next(iter(repeat_neighbors(i, edges)))
               for i in unique if len(repeat_neighbors(i, edges)) == 1}
    assert private == {4: 0, 5: 1, 6: 2, 7: 3}

isolations = defaultdict(set)
partition_counts = Counter()
for blocks in partitions(N):
    k = N - len(blocks)
    if k in (2, 3):
        p = profile(blocks)
        isolations[k, summed(p)].add(p)
        partition_counts[k] += 1
assert partition_counts == {2: 750, 3: 5880}

def target(S):
    return profile([S] + [[i] for i in range(N) if i not in S])

# Check a convenient superset of the queries actually used in the proof.
known_unique_edges = {frozenset((i, j)) for i, j in COMMON if {i, j} <= unique}
triples = {target((u, v, r)) for u, r in private.items() for v in unique - {u}
           if frozenset((u, v)) not in known_unique_edges}
quadruples = {target((u, v, r, s)) for (u, r), (v, s) in combinations(private.items(), 2)}
assert len(triples) == 17 and len(quadruples) == 6
for k, targets in [(2, triples), (3, quadruples)]:
    for p in targets:
        assert isolations[k, summed(p)] == {p}

A, B = map(layers, TREES)
assert A[:3] == B[:3]
key = (2, 3, 14, 23, 24, 24, 48)
assert (A[3][key], B[3][key]) == (1, 0)
for u, r in sorted(private.items()):
    x = summed(target((u, 9, r)))
    expected = int(r in {0, 1})
    assert (A[2][x], B[2][x]) == (expected, expected)
print('PASS: 138 vertices; 750/5880 partitions; 17/6 isolated profiles; shared anchor 9 has incidences 1,1,0,0.')
print('Layers 0–2 agree; layer 3 has counts 1 and 0 at', key)

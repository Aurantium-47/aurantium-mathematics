from collections import Counter
from itertools import combinations

W = (8, 10, 11, 9, 12, 9, 16, 2, 16)
E = ((0, 3), (1, 3), (3, 4), (4, 5), (4, 6), (5, 2), (6, 7), (4, 8))
V = tuple(range(len(W)))


def components(edges, vertices=V):
    groups = [{v} for v in vertices]
    for x, y in edges:
        a = next(g for g in groups if x in g)
        b = next(g for g in groups if y in g)
        if a is not b:
            groups.remove(b)
            a.update(b)
    return groups


def colors(vertices):
    return tuple(sorted(W[v] for v in vertices))


def target(c):
    remaining = list(W)
    for w in c:
        remaining.remove(w)
    return tuple(sorted([sum(c) - 1] + remaining))


def main():
    Wc, M = Counter(W), max(W)
    assert sum(W) == 93 and len(components(E)) == 1 and len(E) == len(V) - 1
    assert min(W[x] + W[y] for x, y in E) == M + 1 == 17
    assert sum(sorted(W)[:2]) == 10
    multi = {x for x in V if Wc[W[x]] > 1}
    unique = set(V) - multi
    assert all(x not in multi or y not in multi for x, y in E)
    assert {W[x] for x in multi if sum(x in e for e in E) > 1} == {9, 16}
    neighbors = {v: {y if x == v else x for x, y in E if v in (x, y)} for v in V}
    diameter = 0
    for v in V:
        seen = front = {v}
        steps = 0
        while len(seen) < len(V):
            front = set().union(*(neighbors[x] for x in front)) - seen
            assert front
            seen |= front
            steps += 1
        diameter = max(diameter, steps)
    assert diameter == 4
    e = Counter(colors(edge) for edge in E)
    epsilon = (-1) ** (sum(W) - len(W) - 1)
    exact = Counter()
    two_disjoint = Counter()
    for n in range(len(E) + 1):
        for forest in combinations(E, n):
            parts = components(forest)
            sums = [sum(W[x] for x in p) for p in parts]
            for j, part in enumerate(parts):
                idx = sums.copy()
                idx[j] -= 1
                if 1 in idx:
                    continue
                value = epsilon * (-1) ** n * (sums[j] - len(part))
                key = tuple(sorted(idx))
                exact[key] += value
                if n == 2 and max(map(len, parts)) == 2:
                    two_disjoint[key] += value
    triples = list(combinations(V, 3))
    direct = Counter(
        colors(t) for t in triples if sum(x in t and y in t for x, y in E) == 2
    )
    palette = {colors(t) for t in triples}
    recovered = {}
    boundary = equations = 0
    for c in sorted(palette, key=lambda c: (sum(c), c)):
        s = sum(c)
        repeats = [w for w in c if Wc[w] > 1]
        ccount = Counter(c)
        outside = Wc - ccount
        if s - 1 <= M or len(repeats) == 3:
            recovered[c] = 0
        elif len(repeats) == 2:
            u = next(w for w in c if Wc[w] == 1)
            x, y = (e[tuple(sorted((a, u)))] for a in repeats)
            recovered[c] = x * y if repeats[0] != repeats[1] else x * (x - 1) // 2
        else:
            equations += 1
            cut = 0
            if outside[M]:
                budget = ccount + Counter([M])
                for r in e:
                    rc = Counter(r)
                    if sum(r) != M + 1 or rc - budget:
                        continue
                    d = tuple(sorted((budget - rc).elements()))
                    assert len(d) == 2 and sum(d) == s - 1
                    if e[d] and not (budget - Wc):
                        assert not (set(d) & set(r))
                        cut += (M - 1) * e[r] * e[d]
            assert cut == epsilon * two_disjoint[target(c)]
            boundary += cut > 0
            single = 0
            for b in outside:
                if not ccount[b + 1]:
                    continue
                c1 = (ccount - Counter([b + 1])) + Counter([b])
                c1 = tuple(sorted(c1.elements()))
                if c1 in recovered:
                    single += b * (Wc - Counter(c1))[b + 1] * recovered[c1]
            recovered[c], rem = divmod(epsilon * exact[target(c)] - cut - single, s - 3)
            assert not rem
        assert recovered[c] == direct[c], c
    assert len(recovered) == 47 and boundary == 2
    for a in {W[x] for x in multi}:
        aux = {
            frozenset((u, v))
            for u, v in combinations(sorted(unique), 2)
            if v not in neighbors[u] and recovered[tuple(sorted((W[u], W[v], a)))]
        }
        cliques = [
            frozenset(c)
            for size in range(2, len(unique) + 1)
            for c in combinations(sorted(unique), size)
            if all(frozenset(pair) in aux for pair in combinations(c, 2))
        ]
        maximal = [c for c in cliques if not any(c < d for d in cliques)]
        predicted = Counter(maximal)
        for u in unique:
            remaining = e[tuple(sorted((W[u], a)))] - sum(u in c for c in maximal)
            assert remaining >= 0
            if remaining:
                predicted[frozenset([u])] += remaining
        assert predicted == Counter(frozenset(neighbors[x]) for x in multi if W[x] == a)
    print(f"{len(recovered)} triple counts ({equations} recurrence equations), "
          f"{boundary} nonzero boundary corrections, {2 ** len(E)} forests; "
          "both repeated-color neighborhood multisets reconstructed")


if __name__ == "__main__":
    main()

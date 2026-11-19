from collections import Counter
from itertools import combinations

W = (8, 9, 10, 11, 11, 12, 13, 14)
E = ((0, 3), (1, 3), (3, 4), (4, 5), (4, 6), (5, 2), (6, 7))
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
    assert sum(W) == 88 and max(W) <= 2 * min(W) - 2
    assert Counter(W)[11] == 2 and max(W) < 2 * min(W)
    assert len(components(E)) == 1 and len(E) == len(V) - 1
    assert all(sum(v in edge for edge in E) > 1 for v in (3, 4))
    nbr = {v: {y if x == v else x for x, y in E if v in (x, y)} for v in V}
    diameter = 0
    for v in V:
        seen = front = {v}
        depth = 0
        while len(seen) < len(V):
            front = set().union(*(nbr[x] for x in front)) - seen
            assert front
            seen |= front
            depth += 1
        diameter = max(diameter, depth)
    assert diameter == 4
    assert 8 + 11 == 9 + 10
    assert 8 + 9 + 12 == 8 + 10 + 11
    epsilon = (-1) ** (sum(W) - len(W) - 1)
    exact = Counter()
    for size in range(len(E) + 1):
        for forest in combinations(E, size):
            parts = components(forest)
            sums = [sum(W[x] for x in p) for p in parts]
            for j, p in enumerate(parts):
                indices = sums.copy()
                indices[j] -= 1
                if 1 not in indices:
                    exact[tuple(sorted(indices))] += (
                        epsilon * (-1) ** size * (sums[j] - len(p))
                    )
    checks = contaminated = zeros = 0
    for h, expected in [(2, 22), (3, 41)]:
        subsets = list(combinations(V, h))
        palette = {colors(s) for s in subsets}
        assert len(palette) == len({target(c) for c in palette}) == expected
        counts = Counter(
            colors(s)
            for s in subsets
            if sum(x in s and y in s for x, y in E) == h - 1
        )
        recovered = {}
        common_sign = epsilon * (-1) ** (h - 1)
        for c in sorted(palette, key=lambda c: (sum(c), c)):
            outside = Counter(W) - Counter(c)
            correction = 0
            for b in outside:
                if b + 1 not in c:
                    continue
                cc = list(c)
                cc.remove(b + 1)
                cc = tuple(sorted(cc + [b]))
                if cc not in palette:
                    continue
                assert sum(cc) == sum(c) - 1
                mult = (Counter(W) - Counter(cc))[b + 1]
                correction += b * mult * recovered[cc]
            value = exact[target(c)] * common_sign
            assert value == (sum(c) - h) * counts[c] + correction
            recovered[c], remainder = divmod(value - correction, sum(c) - h)
            assert remainder == 0 and recovered[c] == counts[c]
            zeros += value == 0
            contaminated += correction != 0
            checks += 1
    assert checks == 63 and contaminated == 22
    print(f"{checks} exact equations and recovered counts, {contaminated} contaminated, "
          f"{zeros} zero coefficients, {2 ** len(E)} forests")


if __name__ == "__main__":
    main()

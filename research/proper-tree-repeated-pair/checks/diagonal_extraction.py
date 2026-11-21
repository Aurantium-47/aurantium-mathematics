"""Exact fixtures for diagonal two-edge wedge extraction."""
from collections import Counter
from itertools import combinations, combinations_with_replacement
from math import comb

import two_edge_rank as core


W = (3, 4, 5, 3, 2, 4, 6, 5)
E = ((0, 1), (1, 2), (2, 3), (0, 4), (4, 5), (2, 6), (6, 7))


def parts(weights, *groups):
    left = weights.copy()
    for g in groups:
        left.subtract(g)
    if any(n < 0 for n in left.values()):
        return None
    return tuple(sorted([*left.elements(), *(sum(g) for g in groups)]))


def unmarked(weights, *groups):
    key = parts(weights, *groups)
    return Counter() if key is None else Counter({key: 1})


def direct_unmarked(weights_by_vertex, edges):
    out = Counter()
    for pair in combinations(edges, 2):
        labels = list(range(len(weights_by_vertex)))
        for i, j in pair:
            old, new = labels[j], labels[i]
            labels = [new if v == old else v for v in labels]
        sums = Counter()
        for i, label in enumerate(labels):
            sums[label] += weights_by_vertex[i]
        out[tuple(sorted(sums.values()))] += 1
    return out


def verify(vertex_weights, edges, marked):
    w = Counter(vertex_weights)
    edge = core.edge_type
    counts = Counter(edge(vertex_weights[i], vertex_weights[j]) for i, j in edges)
    template = core.template if marked else unmarked
    known = Counter()
    for l, r in combinations_with_replacement(sorted(counts), 2):
        n = comb(counts[l], 2) if l == r else counts[l] * counts[r]
        core.add_scaled(known, template(w, l, r), n)
    columns, rows, diagonal = {}, [], []
    for a in sorted(w):
        neighbors = [u for u in sorted(w) if u != a and counts[edge(a, u)]]
        assert not counts[a, a]  # These two fixtures do not use same-weight edges.
        for b, c in combinations_with_replacement(neighbors, 2):
            l, r = edge(a, b), edge(a, c)
            if w[a] == 1:
                n = comb(counts[l], 2) if l == r else counts[l] * counts[r]
                if n:
                    core.add_scaled(known, template(w, (a, b, c)), n)
                    core.add_scaled(known, template(w, l, r), -n)
                continue
            if b == c or (w[b] == w[c] == 1 and counts[edge(b, c)]):
                continue
            col = template(w, (a, b, c))
            core.add_scaled(col, template(w, l, r), -1)
            columns[a, b, c] = col
            row = list(parts(w, l, r))
            if marked:
                row[row.index(a)] -= 1
            rows.append(tuple(sorted(row)))
            diagonal.append(-(a - 1) * (w[a] - 2) if marked else -1)
    assert len(columns) == 9 and len(set(rows)) == 9
    assert diagonal == ([-2] * 3 + [-3] * 3 + [-4] * 3 if marked else [-1] * 9)
    if marked:
        core.W, core.EDGES = vertex_weights, edges
        layer = core.direct_layer()
    else:
        layer = direct_unmarked(vertex_weights, edges)
        assert len(layer) == 15
    for i, row in enumerate(rows):
        assert [c[row] for c in columns.values()] == [diagonal[i] if j == i else 0 for j in range(9)]
    solution = {}
    for row, (a, b, c), d in zip(rows, columns, diagonal):
        x, rem = divmod(layer[row] - known[row], d)
        assert rem == 0 and x in (0, 1)
        expected = 0
        for i, color in enumerate(vertex_weights):
            labels = {vertex_weights[v if i == u else u] for u, v in edges if i in (u, v)}
            expected += color == a and {b, c} <= labels
        assert x == expected
        solution[a, b, c] = x
    assert [solution[3, 4, 5], solution[4, 3, 5], solution[5, 3, 4]] == [0, 1, 1]
    for key, x in solution.items():
        core.add_scaled(known, columns[key], x)
    assert all(known[key] == layer[key] for key in known.keys() | layer.keys())
    print(f"{sum(vertex_weights)} vertices; {len(layer)} terms; diagonal {diagonal}; nine counts match")


if __name__ == "__main__":
    verify(W, E, False)
    verify(W + (3, 4, 5), E + ((4, 8), (4, 9), (6, 10)), True)

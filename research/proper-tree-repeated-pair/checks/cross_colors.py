"""Check the distinct repeated-weight fixture by exact arithmetic."""
from collections import Counter
from itertools import combinations

import two_edge_rank as core


W = (3, 4, 5, 2, 3, 6, 4, 7, 5)
EDGES = ((0, 1), (0, 2), (0, 3), (3, 4), (1, 5), (5, 6), (2, 7), (7, 8))
ROWS = (
    (2, 2, 4, 4, 5, 6, 15),
    (2, 2, 4, 5, 5, 7, 13),
    (2, 2, 4, 5, 6, 7, 12),
    (2, 4, 4, 5, 6, 7, 10),
    (2, 4, 5, 5, 6, 7, 9),
)


def verify():
    w = Counter(W)
    edge = core.edge_type
    counts = Counter(edge(W[i], W[j]) for i, j in EDGES)
    repeated = {a for a, multiplicity in w.items() if multiplicity > 1}
    unique = set(w) - repeated
    cross = {(a, b) for a, b in counts if a != b and {a, b} <= repeated}
    assert cross == {(3, 4), (3, 5)}
    assert all(not counts[a, a] for a in repeated)
    for a, b in cross:
        assert counts[a, b] == 1
        assert all(not (counts[edge(a, u)] and counts[edge(b, u)]) for u in unique)
    assert all(
        not all(edge(u, v) in cross for u, v in combinations(triple, 2))
        for triple in combinations(repeated, 3)
    )

    known, _ = core.model(w, counts)
    columns = {}
    for a in sorted(repeated):
        neighbors = sorted(b for b in w if b != a and counts[edge(a, b)])
        for u, v in combinations(neighbors, 2):
            if {u, v} <= unique and counts[edge(u, v)]:
                continue
            column = core.template(w, (a, u, v))
            core.add_scaled(column, core.template(w, edge(a, u), edge(a, v)), -1)
            columns[a, u, v] = column
    assert tuple(columns) == ((3, 2, 4), (3, 2, 5), (3, 4, 5), (4, 3, 6), (5, 3, 7))

    core.W, core.EDGES = W, EDGES
    layer = core.direct_layer()
    matrix = [[column[row] for column in columns.values()] for row in ROWS]
    det, solution = core.solve_and_det(matrix, [layer[row] - known[row] for row in ROWS])
    assert det == 32 and solution == [1, 1, 1, 1, 1]
    for value, column in zip(solution, columns.values()):
        core.add_scaled(known, column, value)
    assert all(layer[key] == known[key] for key in layer.keys() | known.keys())
    assert len(layer) == 66 and sum(W) == 39

    expected_neighborhoods = {3: [{2, 4, 5}, {2}], 4: [{3, 6}, {6}], 5: [{3, 7}, {7}]}
    for a, sets in expected_neighborhoods.items():
        vertices = [i for i, weight in enumerate(W) if a == weight]
        labels = [{W[j if i == u else u] for u, j in EDGES if i in (u, j)} for i in vertices]
        assert labels == sets
        assert {tuple(sorted(pair)) for s in sets for pair in combinations(s, 2)} == {
            (u, v) for (b, u, v), value in zip(columns, solution) if b == a and value
        }
    print("39 vertices; determinant 32; all 5 overlaps and 66 coefficients match")


if __name__ == "__main__":
    verify()

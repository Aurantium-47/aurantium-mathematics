"""Check the two-adjacent-pair fixture using exact integer coefficients."""
from collections import Counter

import two_edge_rank as base_check


W = (5, 2, 3, 5, 4, 6, 7, 7, 8)
EDGES = ((0, 3), (1, 3), (3, 4), (4, 5), (4, 6), (5, 2), (6, 7), (4, 8))
ROW = (3, 5, 6, 7, 7, 8, 10)


def verify():
    w = Counter(W)
    t = base_check.edge_type
    e = Counter(t(W[i], W[j]) for i, j in EDGES)
    repeated = {a for a, multiplicity in w.items() if multiplicity > 1}
    unique = set(w) - repeated
    assert {pair for pair in e if set(pair) <= repeated} == {(5, 5), (7, 7)}
    assert all(w[a] == 2 and e[a, a] == 1 for a in repeated)
    baseline, columns = base_check.model(w, e)
    for a in repeated:
        for u in unique:
            n = e[a, a] * e[t(a, u)]
            if n:
                triple = base_check.template(w, (a, a, u))
                assert not base_check.template(w, (a, a), (a, u))
                base_check.add_scaled(baseline, triple, n)
    assert tuple(columns) == ((5, 2, 4),)
    (col,) = columns.values()
    base_check.W, base_check.EDGES = W, EDGES
    layer = base_check.direct_layer()
    assert col[ROW] == 8
    value, remainder = divmod(layer[ROW] - baseline[ROW], col[ROW])
    assert (value, remainder) == (1, 0)
    base_check.add_scaled(baseline, col, value)
    assert all(baseline[k] == layer[k] for k in baseline.keys() | layer.keys())
    assert len(layer) == 114 and sum(W) == 47
    neighborhoods = {
        a: [set() for _ in range(w[a])] for a in repeated
    }
    for i, a in enumerate(W):
        if a in repeated:
            rank = W[:i].count(a)
            neighborhoods[a][rank].update(
                W[j if i == u else u]
                for u, j in EDGES
                if i in (u, j) and W[j if i == u else u] in unique
            )
    assert neighborhoods == {5: [set(), {2, 4}], 7: [{4}, set()]}
    print("47 vertices; two adjacent repeated pairs; overlap = 1; 114 coefficients match")


if __name__ == "__main__":
    verify()

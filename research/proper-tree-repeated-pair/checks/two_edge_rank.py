"""Exact two-edge rank certificate; uses only the Python standard library."""
from collections import Counter
from fractions import Fraction
from itertools import combinations, combinations_with_replacement
from math import comb


W = (2, 3, 4, 5, 6, 5, 7, 8, 7)
EDGES = ((0, 3), (1, 3), (3, 4), (4, 5), (4, 6), (5, 2), (6, 7), (4, 8))
ROWS = (
    (2, 2, 4, 5, 5, 13, 15),
    (2, 2, 5, 7, 7, 8, 15),
    (2, 3, 5, 7, 7, 8, 14),
    (2, 4, 5, 7, 7, 8, 13),
    (2, 4, 6, 7, 7, 8, 12),
    (2, 5, 6, 7, 7, 8, 11),
    (3, 5, 6, 7, 7, 8, 10),
)


def edge_type(a, b):
    return tuple(sorted((a, b)))


def add_scaled(out, polynomial, scale):
    for monomial, coefficient in polynomial.items():
        out[monomial] += scale * coefficient


def template(weight_multiset, *groups):
    left = weight_multiset.copy()
    for group in groups:
        left.subtract(group)
    if min(left.values(), default=0) < 0:
        return Counter()
    components = [(len(group), sum(group)) for group in groups]
    components += [(1, w) for w in left.elements()]
    result = Counter()
    for i, (count, weight) in enumerate(components):
        if weight > 2 and weight > count:
            indices = [s - (j == i) for j, (_, s) in enumerate(components)]
            result[tuple(sorted(indices))] += weight - count
    return result


def model(weights, edge_counts):
    base = Counter()
    repeated = {w for w in weights if weights[w] > 1}
    unique = sorted(set(weights) - repeated)
    for left, right in combinations_with_replacement(sorted(edge_counts), 2):
        multiplicity = (comb(edge_counts[left], 2) if left == right
                        else edge_counts[left] * edge_counts[right])
        add_scaled(base, template(weights, left, right), multiplicity)
    for center in unique:
        for u, v in combinations_with_replacement(sorted(weights), 2):
            a, b = edge_type(center, u), edge_type(center, v)
            multiplicity = (comb(edge_counts[a], 2) if a == b
                            else edge_counts[a] * edge_counts[b])
            if multiplicity:
                add_scaled(base, template(weights, (center, u, v)), multiplicity)
                add_scaled(base, template(weights, a, b), -multiplicity)
    columns = {}
    for center in sorted(repeated):
        for u, v in combinations(unique, 2):
            a, b = edge_type(center, u), edge_type(center, v)
            if edge_counts[a] and edge_counts[b] and not edge_counts[edge_type(u, v)]:
                column = template(weights, (center, u, v))
                add_scaled(column, template(weights, a, b), -1)
                columns[center, u, v] = column
    return base, columns


def direct_layer():
    """Enumerate labeled skeleton edge pairs via component flood fill."""
    layer = Counter()
    for a, b in combinations(EDGES, 2):
        labels = list(range(len(W)))
        for u, v in (a, b):
            old, new = labels[v], labels[u]
            labels = [new if x == old else x for x in labels]
        for mark in set(labels):
            indices = Counter()
            coefficient = 0
            for i, label in enumerate(labels):
                indices[label] += W[i]
                if label == mark:
                    coefficient += W[i] - 1
            indices[mark] -= 1
            if 1 not in indices.values():
                layer[tuple(sorted(indices.values()))] += coefficient
    return layer


def solve_and_det(matrix, rhs):
    a = [[Fraction(x) for x in row] + [Fraction(b)] for row, b in zip(matrix, rhs)]
    det = Fraction(1)
    n = len(a)
    for j in range(n):
        pivot = next(i for i in range(j, n) if a[i][j])
        if pivot != j:
            a[pivot], a[j] = a[j], a[pivot]
            det = -det
        scale = a[j][j]
        det *= scale
        a[j] = [x / scale for x in a[j]]
        for i in range(n):
            if i != j:
                factor = a[i][j]
                a[i] = [x - factor * y for x, y in zip(a[i], a[j])]
    return det, [row[-1] for row in a]


def verify():
    weights = Counter(W)
    counts = Counter(edge_type(W[u], W[v]) for u, v in EDGES)
    base, columns = model(weights, counts)
    expected_columns = ((5, 2, 3), (5, 2, 4), (5, 2, 6), (5, 3, 4),
                        (5, 3, 6), (5, 4, 6), (7, 6, 8))
    assert tuple(columns) == expected_columns
    layer = direct_layer()
    matrix = [[c[row] for c in columns.values()] for row in ROWS]
    det, solution = solve_and_det(matrix, [layer[row] - base[row] for row in ROWS])
    assert det == -576
    adj = {i: set() for i in range(len(W))}
    for u, v in EDGES:
        adj[u].add(v)
        adj[v].add(u)
    expected = [
        int(any(W[i] == a and {u, v} <= {W[j] for j in adj[i]} for i in adj))
        for a, u, v in columns
    ]
    assert solution == expected
    for coefficient, column in zip(solution, columns.values()):
        add_scaled(base, column, coefficient)
    assert all(base[k] == layer[k] for k in base.keys() | layer.keys())
    print(f"minor determinant: {det}; columns: {len(columns)}; solution: {expected}")
    print(f"all {len(layer)} nonzero layer coefficients match direct enumeration")


if __name__ == "__main__":
    verify()

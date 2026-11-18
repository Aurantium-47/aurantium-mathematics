"""Exact regression checks for the known inverse-peak boundary (stdlib only)."""
from itertools import permutations, product
from math import comb


def peaks(p):
    return sum(p[i - 1] < p[i] > p[i + 1] for i in range(1, len(p) - 1))


def inverse(p):
    q = [0] * len(p)
    for i, v in enumerate(p):
        q[v - 1] = i + 1
    return q


def check(condition, message):
    if not condition:
        raise RuntimeError(message)


def from_word(w):
    lo = hi = sum(w) + 1
    p = [lo]
    for bit in w:
        if bit:
            lo -= 1
            p.append(lo)
        else:
            hi += 1
            p.append(hi)
    return p


def main():
    permutation_count = 0
    for n in range(1, 9):
        m = (n - 1) // 2
        matrix = [[0] * (m + 1) for _ in range(m + 1)]
        for p in permutations(range(1, n + 1)):
            matrix[peaks(p)][peaks(inverse(p))] += 1
            permutation_count += 1
        check(matrix == list(map(list, zip(*matrix))), (n, 'symmetry'))
        for k in range(m + 1):
            check(matrix[k][0] == comb(n, 2 * k + 1), (n, k, 'column'))
            check(matrix[0][k] == comb(n, 2 * k + 1), (n, k, 'row'))
    word_count = 0
    for n in range(1, 13):
        for w in product((0, 1), repeat=n - 1):
            p = from_word(w)
            check(sorted(p) == list(range(1, n + 1)), (n, w, 'permutation'))
            check(tuple(int(a > b) for a, b in zip(p, p[1:])) == w, (n, w, 'word'))
            check(peaks(inverse(p)) == 0, (n, w, 'inverse peaks'))
            word_count += 1
    print(f'PASS: {permutation_count} permutations (n=1..8); {word_count} descent words (n=1..12).')
    print('Finite regression only; the all-n boundary proof is in README.md.')


if __name__ == '__main__':
    main()

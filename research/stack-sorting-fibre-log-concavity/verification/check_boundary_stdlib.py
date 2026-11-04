"""Independent rational/Sturm replay of the optional route-boundary examples.

This checks failures of proposed stronger mechanisms, not a counterexample
to the fibre real-rootedness conjecture. No third-party dependencies.
"""
from fractions import Fraction as F
from math import comb, factorial
import json


def trim(p):
    p = list(map(F, p))
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p


def add(p, q):
    return trim([(p[i] if i < len(p) else 0) + (q[i] if i < len(q) else 0)
                 for i in range(max(len(p), len(q)))])


def mul(p, q):
    out = [F(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            out[i + j] += a * b
    return trim(out)


def scale(p, c):
    return trim([c * a for a in p])


def derivative(p):
    return trim([i * p[i] for i in range(1, len(p))] or [0])


def remainder(p, q):
    p = trim(p)
    q = trim(q)
    assert q != [0]
    while p != [0] and len(p) >= len(q):
        shift = len(p) - len(q)
        a = p[-1] / q[-1]
        for j, b in enumerate(q):
            p[shift + j] -= a * b
        p = trim(p)
    return p


def sturm(p):
    seq = [trim(p), derivative(p)]
    while seq[-1] != [0]:
        r = scale(remainder(seq[-2], seq[-1]), -1)
        if r == [0]:
            break
        # Positive rescaling controls rational growth without changing signs.
        seq.append(scale(r, F(1, 1) / abs(r[-1])))
    return seq


def variations(signs):
    nonzero = [s for s in signs if s]
    return sum(a != b for a, b in zip(nonzero, nonzero[1:]))


def sign(x):
    return (x > 0) - (x < 0)


def nar(n):
    return [0] + [F(comb(n, k) * comb(n, k - 1), n) for k in range(1, n + 1)]


def H(n):
    return [F(comb(n, 2*j) * comb(2*j, j), j + 1) for j in range(n // 2 + 1)]


# Reconstruct both z2=0,z3=1 support restrictions before their discriminants.
shifted = [F(0)]*4
divided = [F(0)]*4
for a in range(1, 4):
    c = 3-a
    shifted[a] = F(1, factorial(a)*factorial(c))
    divided[a] = F(1, factorial(a+1)*factorial(c+1))
assert shifted == [0, F(1,2), F(1,2), F(1,6)]
assert divided == [0, F(1,12), F(1,12), F(1,24)]
assert 3**2 - 4*3 == -3
assert 2**2 - 4*2 == -4
fertility = [F(0)]
for a in range(4):
    for b in range(4-a):
        c = 3-a-b
        if a+b >= 1:
            fertility = add(fertility, mul(mul(nar(a+1), nar(b+1)), nar(c+1)))
factored = scale(mul(mul([0, 0, 0, 1], [1, 1]), mul([3, 1], [1, 3])), 3)
assert fertility == factored
gamma = add(scale(H(16), 10000), scale(mul(H(8), H(8)), 1000000))
for k in range(1, 16):
    if k != 8:
        gamma = add(gamma, mul(H(k), H(16-k)))
assert len(gamma) - 1 == 8
seq = sturm(gamma)
assert len(seq[-1]) == 1  # gcd(gamma, gamma') is constant
minus = variations([sign(p[-1]) * (-1)**(len(p)-1) for p in seq])
plus = variations([sign(p[-1]) for p in seq])
zero = variations([sign(p[0]) for p in seq])
assert minus-plus == 6
assert minus-zero == 6
print(json.dumps({
    'support_restriction_discriminants': [-3, -4],
    'fertility_factorization_exact': True,
    'cauchy_obstruction_degree': len(gamma)-1,
    'cauchy_obstruction_coefficients': [int(c) for c in gamma],
    'gcd_degree': len(seq[-1])-1,
    'sturm_variations_minus_infinity_zero_plus_infinity': [minus, zero, plus],
    'real_roots': minus-plus,
    'negative_roots': minus-zero,
    'nonreal_roots': 8-(minus-plus),
    'all_passed': True
}, indent=2))

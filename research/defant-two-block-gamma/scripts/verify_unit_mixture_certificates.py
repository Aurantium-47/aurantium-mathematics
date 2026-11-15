"""Python standard-library exact certificates. Run directly; writes JSON to stdout."""
from fractions import Fraction as F
from math import comb, factorial
from hashlib import sha256
import json


def require(ok, detail):
    if not ok:
        raise ArithmeticError(detail)


def block(n):
    return [comb(n, 2*j)*comb(2*j, j)//(j+1) for j in range(n//2+1)]


def convolution(a, b, K):
    return [sum(a[i]*b[k-i] for i in range(max(0, k-len(b)+1), min(k, len(a)-1)+1)) for k in range(K+1)]


def finite_certificate():
    bs = [block(n) for n in range(161)]
    out = []
    for m in range(5, 161):
        K = m//2
        rs = [convolution(bs[u], bs[m-u], K) for u in range(K+1)]
        c = rs[-1]
        count = zeros = 0
        for k in range(1, K):
            for u, r in enumerate(rs):
                require(r[k-1] > 0 and r[k] > 0 and c[k-1] > 0, ('positive denominators', m, k, u))
                D = k*(K-k)*(2*c[k]*c[k-1]*r[k]-c[k]**2*r[k-1])-(k+1)*(K-k+1)*c[k-1]**2*r[k+1]
                require(D > 0, ('strict tangent', m, k, u, D))
                count += 1
                zeros += int(r[k+1] == 0)
        out.append({'m': m, 'strict_tangent_certificates': count, 'zero_next_coefficients': zeros})
    # m=4 is deliberately excluded: the balanced single row has equality.
    c = convolution(block(2), block(2), 2)
    require(c[1]**2-4*c[0]*c[2] == 0, 'm=4 exclusion')
    return out


# Exact bivariate polynomial arithmetic, keys are powers of (s,v).
def clean(p):
    return {e: F(c) for e, c in p.items() if c}


def const(c):
    return clean({(0, 0): c})


def add(a, b):
    p = a.copy()
    for e, c in b.items():
        p[e] = p.get(e, 0)+c
    return clean(p)


def scale(a, c):
    return clean({e: c*x for e, x in a.items()})


def mul(a, b):
    p = {}
    for (i, j), x in a.items():
        for (I, J), y in b.items():
            e = (i+I, j+J)
            p[e] = p.get(e, 0)+x*y
    return clean(p)


def g(n, j):
    p = const(1)
    for i in range(2*j):
        p = mul(p, add(n, const(-i)))
    return scale(p, F(1, factorial(j)*factorial(j+1)))


def row(m, u, k):
    v = add(m, scale(u, -1))
    p = {}
    for j in range(k+1):
        p = add(p, mul(g(u, j), g(v, k-j)))
    return p


def symbolic_k3():
    out = []
    for parity in (0, 1):
        for chart in range(5):
            # u=0,1,2,3 with r=4+v; or u=4+s, r=4+s+v.
            r = {(0, 0): F(4), (0, 1): F(1)}
            u = const(chart)
            if chart == 4:
                r[(1, 0)] = F(1)
                u = {(0, 0): F(4), (1, 0): F(1)}
            m = add(scale(r, 2), const(parity))
            c2, c3 = row(m, r, 2), row(m, r, 3)
            a, b, c = (row(m, u, k) for k in (2, 3, 4))
            first = add(scale(mul(mul(c2, c3), b), 2), scale(mul(mul(c3, c3), a), -1))
            D = add(scale(mul(add(r, const(-3)), first), 3), scale(mul(add(r, const(-2)), mul(mul(c2, c2), c)), -4))
            require(all(x >= 0 for x in D.values()), ('negative coefficient', parity, chart))
            require(D.get((0, 0), 0) > 0, ('nonpositive constant', parity, chart))
            serial = [[i, j, str(x)] for (i, j), x in sorted(D.items())]
            digest = sha256(json.dumps(serial, separators=(',', ':')).encode()).hexdigest()
            out.append({'parity': parity, 'chart': chart, 'positive_coefficients': len(D), 'constant': str(D[(0, 0)]), 'coefficient_sha256': digest})
    return out


if __name__ == '__main__':
    result = {'finite': finite_certificate(), 'symbolic_k3': symbolic_k3()}
    result['total_finite_certificates'] = sum(x['strict_tangent_certificates'] for x in result['finite'])
    result['total_symbolic_positive_coefficients'] = sum(x['positive_coefficients'] for x in result['symbolic_k3'])
    print(json.dumps(result, indent=2))

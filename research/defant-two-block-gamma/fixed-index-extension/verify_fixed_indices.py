"""Exact all-size fixed-index certificates; Python standard library only.
Default: verify indices 4 through 16. --dump writes coefficients for audit_exact.py.
"""
from fractions import Fraction as F
from math import factorial
from hashlib import sha256
import json,sys

def require(ok,detail):
 if not ok: raise ArithmeticError(detail)

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


def symbolic(k, dump_coefficients=False):
 out=[]
 for parity in (0,1):
  for chart in range(k+2):
   r={(0,0):F(k+1),(0,1):F(1)};u=const(chart)
   if chart==k+1:r[(1,0)]=F(1);u={(0,0):F(k+1),(1,0):F(1)}
   m=add(scale(r,2),const(parity))
   ca,cb=row(m,r,k-1),row(m,r,k)
   a,b,c=(row(m,u,j) for j in (k-1,k,k+1))
   first=add(scale(mul(mul(ca,cb),b),2),scale(mul(mul(cb,cb),a),-1))
   D=add(scale(mul(add(r,const(-k)),first),k),scale(mul(add(r,const(1-k)),mul(mul(ca,ca),c)),-(k+1)))
   require(all(x>0 for x in D.values()),('negative',k,parity,chart))
   require(D.get((0,0),0)>0,('constant',k,parity,chart))
   serial=[[i,j,str(x)] for (i,j),x in sorted(D.items())]
   out.append({'parity':parity,'chart':chart,'count':len(D),'constant':str(D[(0,0)]),'sha256':sha256(json.dumps(serial,separators=(',',':')).encode()).hexdigest()})
   if dump_coefficients:
    with open(f'coeff-k{k}-p{parity}-c{chart}.json','w') as f:json.dump(serial,f)
 return out

if __name__ == '__main__':
 out={str(k):symbolic(k,'--dump' in sys.argv) for k in range(4,17)}
 print(json.dumps(out,indent=2))

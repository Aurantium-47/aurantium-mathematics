"""Independent integer interpolation identity audit; does not import producer code."""
import json,sys,time
from fractions import Fraction
from math import comb,lcm
from functools import lru_cache
from pathlib import Path

@lru_cache(None)
def g(n,j):
 return comb(n,2*j)*comb(2*j,j)//(j+1) if 0<=2*j<=n else 0
@lru_cache(None)
def row(m,u,j):
 return sum(g(u,i)*g(m-u,j-i) for i in range(j+1))
def direct(k,p,s,v,c):
 r=k+1+v+(s if c==k+1 else 0)
 u=k+1+s if c==k+1 else c
 m=2*r+p
 a,b=row(m,r,k-1),row(m,r,k)
 return k*(r-k)*(2*a*b*row(m,u,k)-b*b*row(m,u,k-1))-(k+1)*(r-k+1)*a*a*row(m,u,k+1)
def horner(a,x):
 out=0
 for c in reversed(a):out=out*x+c
 return out
def require(condition, detail):
 if not condition: raise ArithmeticError(detail)
out=[]
for k in map(int,sys.argv[1:]):
 start=time.time(); d=6*k-1;nodes=0;coeffcount=0
 for p in (0,1):
  for c in range(k+2):
   path=Path(f'coeff-k{k}-p{p}-c{c}.json')
   data=json.loads(path.read_text())
   coefficients={(i,j):Fraction(x) for i,j,x in data}
   require(len(coefficients)==len(data), ("duplicate coefficients",k,p,c))
   require(all(i>=0 and j>=0 and i+j<=d and x>0 for (i,j),x in coefficients.items()), ("degree or positivity",k,p,c))
   require(coefficients.get((0,0),0)>0, ("constant",k,p,c))
   if c!=k+1: require(all(i==0 for i,j in coefficients), ("univariate",k,p,c))
   coeffcount+=len(coefficients)
   denom=lcm(*(x.denominator for x in coefficients.values()))
   by_v=[[0]*(d-j+1) for j in range(d+1)]
   for (i,j),x in coefficients.items():by_v[j][i]=int(x*denom)
   ss=range(d+1) if c==k+1 else range(1)
   for s in ss:
    vc=[horner(a,s) for a in by_v]
    for v in range(d-s+1):
     require(horner(vc,v)==denom*direct(k,p,s,v,c), ("identity",k,p,c,s,v))
     nodes+=1
 print(k,nodes,coeffcount,time.time()-start,flush=True)
 out.append({'k':k,'exact_identity_nodes':nodes,'positive_coefficients':coeffcount,'total_degree_bound':d})
 Path('audit_exact_results.json').write_text(json.dumps(out,indent=2))

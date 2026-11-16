"""Exact TP4 local certificates; no numerical Eulerian root approximation."""
import ast,json,math
from pathlib import Path
import sympy as S
CERT={
(4,(1,2,3,4)):((2,1,1,0),(1,1,1,1)),
(4,(2,3,4,5)):((3,3,2,0),(3,3,1,1)),
(5,(1,2,3,4)):((2,1,1,0,0),(1,1,1,1,0)),
(5,(1,2,3,5)):((3,1,1,0,0),(1,1,1,1,1)),
(5,(1,3,4,5)):((3,2,2,0,0),(3,1,1,1,1)),
(5,(2,3,4,5)):((3,2,2,1,0),(3,2,1,1,1)),
}
def require(v,msg):
 if not v:raise RuntimeError(msg)
def orbit_size(ex):
 d={}
 for e in ex:d[e]=d.get(e,0)+1
 return math.factorial(len(ex))//math.prod(math.factorial(n) for n in d.values())
records=[]
for u in range(7):
 r=S.symbols('r:'+str(u)) if u else (S.Symbol('dummy'),)
 for line in Path('local_u%d.txt'%u).read_text().splitlines():
  pos=line.index(')')+1; cols=ast.literal_eval(line[:pos]); p=S.Poly(S.sympify(line[pos:],locals={str(x):x for x in r}),*r)
  if p.is_zero:continue
  orbits={}
  for ex,co in p.terms():
   key=tuple(sorted(ex,reverse=True))
   if key not in orbits:orbits[key]=[int(co),0]
   require(orbits[key][0]==co,'asymmetric coefficients');orbits[key][1]+=1
  for ex,(co,n) in orbits.items():require(n==orbit_size(ex),'missing symmetry monomial')
  neg=[ex for ex,(co,n) in orbits.items() if co<0]
  rec={'u':u,'columns':cols,'monomials':len(p.terms()),'method':'nonnegative coefficients'}
  if neg:
   a,b=CERT[(u,cols)];require(neg==[b],'unexpected negative orbit')
   require(sum(a)==sum(b),'degree');require(all(sum(a[:i])>=sum(b[:i]) for i in range(1,u+1)),'majorization')
   A=orbits[a][0]*orbits[a][1];B=-orbits[b][0]*orbits[b][1]
   require(A>=B>0,'insufficient positive mass')
   rec.update(method='Muirhead',dominant=a,dominated=b,positive_mass=A,negative_mass=B)
  records.append(rec)
require(len(records)==126,'count')
require(sum(r['method']=='Muirhead' for r in records)==6,'six exceptional cases')
Path('certificates.json').write_text(json.dumps(records,indent=2)+'\n')
print('PASS: 126 nonzero local polynomials; 120 coefficientwise positive, 6 exact Muirhead certificates.')

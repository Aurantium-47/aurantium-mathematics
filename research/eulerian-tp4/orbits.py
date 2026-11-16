import ast,sympy as S
from pathlib import Path
for u in [4,5]:
 r=S.symbols('r:'+str(u))
 for line in Path('local_u%d.txt'%u).read_text().splitlines():
  pos=line.index(')')+1; cols=ast.literal_eval(line[:pos]);p=S.Poly(S.sympify(line[pos:],locals={str(x):x for x in r}),*r)
  if not any(c<0 for c in p.coeffs()):continue
  d={}
  for ex,co in p.terms():
   key=tuple(sorted(ex,reverse=True))
   if key not in d:d[key]=[co,0]
   assert d[key][0]==co
   d[key][1]+=1
  degs={sum(ex) for ex,(co,n) in d.items() if co<0}
  print(u,cols)
  for ex,(co,n) in sorted(d.items(),reverse=True):
   if sum(ex) in degs:print(ex,co,n,'normalized',co*n)

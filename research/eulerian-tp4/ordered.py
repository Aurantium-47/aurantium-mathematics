import ast,sympy as S
from pathlib import Path
for u in [4,5]:
 r=S.symbols('r:'+str(u));t=S.symbols('t:'+str(u))
 for line in Path('local_u%d.txt'%u).read_text().splitlines():
  pos=line.index(')')+1; cols=ast.literal_eval(line[:pos]);p=S.Poly(S.sympify(line[pos:],locals={str(x):x for x in r}),*r)
  if not any(c<0 for c in p.coeffs()):continue
  q=S.Poly(p.as_expr().subs({r[i]:sum(t[:i+1]) for i in range(u)},simultaneous=True).expand(),*t)
  print(u,cols,'negative',sum(1 for c in q.coeffs() if c<0),'terms',len(q.terms()),flush=True)

import sympy as S
x=S.symbols('x')
rows=[{0:S.Integer(1)}]
for s in range(3):
 d={}
 for j,p in rows[-1].items():
  d[j]=d.get(j,0)+(1+(s+j+1)*x)*p+x*(1-x)*S.diff(p,x)
  d[j+1]=d.get(j+1,0)+(j+1)*x*p
 rows.append({j:S.expand(p) for j,p in d.items()})
print(rows)

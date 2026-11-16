# Independent audit: direct Leibniz determinants, not producer wedge algorithm.
if not __debug__:
 raise RuntimeError("Run without -O: assertions are required for this audit")
import sympy as s
from sympy.polys.rings import ring
from sympy.polys.domains import ZZ
from itertools import combinations,product,permutations
import ast,json
from pathlib import Path
x=s.symbols('x'); ps=[{0:s.Integer(1)}]
for h in range(3):
 d={}
 for j,p in ps[-1].items():
  d[j]=d.get(j,0)+(1+(h+j+1)*x)*p+x*(1-x)*s.diff(p,x)
  d[j+1]=d.get(j+1,0)+(j+1)*x*p
 ps.append({j:s.expand(p) for j,p in d.items()})
P=[{j:[int(p.coeff(x,k)) for k in range(h+1)]for j,p in d.items()}for h,d in enumerate(ps)]
perms=[(p,(-1)**sum(p[i]>p[j]for i in range(4)for j in range(i+1,4)))for p in permutations(range(4))]
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,ai in enumerate(a):
  for j,bj in enumerate(b):c[i+j]+=ai*bj
 return c
out=[]
for u in range(7):
 R,*r=ring(','.join('r%d'%i for i in range(u))or'dummy',ZZ)
 sub=[frozenset(c)for k in range(u+1)for c in combinations(range(u),k)];U=frozenset(range(u))
 poly={}
 for I in sub:
  a=[R.one]
  for i in I:a=mul(a,[R.one,r[i]])
  poly[I]=a
 sets=[[I for I in sub if len(I)<=j]for j in (1,2,3)]
 values={L:R.zero for L in combinations(range(7),4)}
 for Is in product(*sets):
  if set.union(*(set(I)for I in Is))!=U:continue
  rows=[poly[U]]+[mul(P[h][len(I)],poly[U-I])for h,I in enumerate(Is,1)]
  rows=[a+[R.zero]*(7-len(a))for a in rows]
  weight=R.one
  for i in U:weight*=(1+r[i])**(sum(i in I for I in Is)-1)
  for L in values:
   det=R.zero
   for perm,sign in perms:
    term=R(sign)
    for h in range(4):
     term*=rows[h][L[perm[h]]]
     if not term:break
    det+=term
   values[L]+=weight*det
 saved={}
 for line in Path('local_u%d.txt'%u).read_text().splitlines():
  cut=line.index(')')+1;saved[ast.literal_eval(line[:cut])]=R.from_expr(s.sympify(line[cut:]))
 assert all(v==saved.get(L,R.zero)for L,v in values.items())
 # Symmetry under adjacent transpositions implies full symmetry.
 symbols=s.symbols('r:'+str(u))
 negs=[]
 for L,v in values.items():
  for i in range(u-1):
   assert all(v.get(exp[:i]+(exp[i+1],exp[i])+exp[i+2:],0)==c for exp,c in v.items())
  if any(c<0 for c in v.values()):
   t=s.symbols('t:'+str(u))
   q=s.Poly(v.as_expr().subs({symbols[i]:sum(t[:i+1])for i in range(u)},simultaneous=True).expand(),*t)
   assert all(c>=0 for c in q.coeffs())
   negs.append({'columns':L,'ordered_terms':len(q.terms())})
 out.append({'u':u,'all_35_match':True,'symmetric':True,'nonzero':sum(bool(v)for v in values.values()),'ordered_certificates':negs})
 print(out[-1],flush=True)
Path('independent_results.json').write_text(json.dumps(out,indent=2)+'\n')
# Verify hand-checkable Muirhead certificates independent of orbit summary.
certs=[(4,(1,2,3,4),(2,1,1,0),8208,(1,1,1,1),984),(4,(2,3,4,5),(3,3,2,0),72,(3,3,1,1),72),(5,(1,2,3,4),(2,1,1,0,0),17640,(1,1,1,1,0),1440),(5,(1,2,3,5),(3,1,1,0,0),720,(1,1,1,1,1),720),(5,(1,3,4,5),(3,2,2,0,0),360,(3,1,1,1,1),240),(5,(2,3,4,5),(3,2,2,1,0),1800,(3,2,1,1,1),600)]
for u,L,a,A,b,B in certs:
 assert sum(a)==sum(b) and all(sum(a[:k])>=sum(b[:k])for k in range(1,u+1)) and A>=B
 r=s.symbols('r:'+str(u))
 lines=Path('local_u%d.txt'%u).read_text().splitlines()
 text=next(line[line.index(')')+1:]for line in lines if ast.literal_eval(line[:line.index(')')+1])==L)
 p=s.Poly(s.sympify(text),*r)
 aa=set(permutations(a));bb=set(permutations(b));rem=p.as_dict()
 assert all(rem.get(e)==s.Rational(A,len(aa))for e in aa)
 assert all(rem.get(e)==-s.Rational(B,len(bb))for e in bb)
 for e in aa:rem[e]-=s.Rational(A,len(aa))
 for e in bb:rem[e]+=s.Rational(B,len(bb))
 assert all(c>=0 for c in rem.values())
 print('Muirhead OK',u,L,flush=True)

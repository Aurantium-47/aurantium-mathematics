from math import comb
from pathlib import Path
import json
import sympy as s
ROOT=Path(__file__).parent

def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a):c[i]+=v
 for i,v in enumerate(b):c[i]+=v
 return c

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,v in enumerate(a):
  for j,w in enumerate(b):c[i+j]+=v*w
 return c

def nar(n):return [comb(n,j)*comb(n,j-1)//n for j in range(1,n+1)]

def group(n,base,M):
 weights=[nar(base+i) for i in range(M+1)]
 a=[[1]]+[[0] for _ in range(M)]
 for _ in range(n):
  b=[[0] for _ in range(M+1)]
  for i in range(M+1):
   for j in range(M+1-i):b[i+j]=add(b[i+j],mul(a[i],weights[j]))
  a=b
 return a
A=group(34,1,9);B=group(7,4,9)
p=[0]
for i in range(4,10):p=add(p,mul(A[i],B[9-i]))
x,z=s.symbols('x z')
P=s.Poly.from_list(list(reversed(p)),x).as_expr()
F=120395891*z**12-2559916854*z**11+22674999303*z**10-108092050131*z**9+299109879326*z**8-484616523267*z**7+446781321424*z**6-225403055871*z**5+59144737218*z**4-7457159829*z**3+393450176*z*z-6817524*z+24864
Q=s.cancel(x**12*F.subs(z,-(1+x)**2/x))
quot,rem=s.div(P,Q,x)
assert rem==0
print('PASS direct original Narayana increment DP')
print('Outside factor:',s.factor(quot))
print('Normalized polynomial degree:',s.degree(P,x))
print('Lattice count:',sum(comb(34+i-1,i)*comb(7+9-i-1,9-i) for i in range(4,10)))
print('F positive roots:',s.Poly(F,z).count_roots(0,s.oo))
print('F all real roots:',s.Poly(F,z).count_roots(-s.oo,s.oo))
assert s.Poly(F,z).count_roots(0,s.oo)==10
assert s.Poly(F,z).count_roots(-s.oo,s.oo)==10
assert s.gcd(F,s.diff(F,z))==1
print('PASS F is squarefree with ten positive real roots and two nonreal roots')
seq=s.sturm(F,z)
print('Sturm signs0:',[s.sign(q.subs(z,0)) for q in seq])
print('Sturm signs+inf:',[s.sign(s.LC(s.Poly(q,z))) for q in seq])
print('Sturm signs-inf:',[s.sign(s.LC(s.Poly(q,z)))*(-1)**s.degree(q,z) for q in seq])
with open(ROOT/'sturm.txt','w') as f:
 for i,q in enumerate(seq):
  pp=s.Poly(q,z);den=s.ilcm(1,*[s.denom(c) for c in pp.all_coeffs()]);_,prim=s.Poly(q*den,z).primitive();f.write(f'S{i} positive-scaled primitive: {prim.as_expr()}\n')

def join(t,v):return [a+len(v) for a in t]+v+[len(t)+len(v)+1]
t=[1]
for _ in range(33):t=join(t,[1])
t.extend([len(t)+i for i in range(1,5)])
for _ in range(7):t=join(t,[1,2,3,4])
t.extend([len(t)+i for i in range(1,6)])
assert len(t)==111 and sorted(t)==list(range(1,112))
assert sum(t[i]>t[i+1] for i in range(110))==40
(ROOT/'permutation.json').write_text(json.dumps(t))
(ROOT/'normalized_polynomial.json').write_text(json.dumps(p))
print('PASS permutation111, descents40, coordinate sum71')

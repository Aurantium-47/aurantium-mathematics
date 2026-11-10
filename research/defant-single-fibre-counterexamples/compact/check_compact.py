"""Exact independent gamma-basis check; Python standard library only."""
from math import comb, factorial
from fractions import Fraction
from pathlib import Path
import json

def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a): c[i]+=v
 for i,v in enumerate(b): c[i]+=v
 return c

def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,u in enumerate(a):
  for j,v in enumerate(b): c[i+j]+=u*v
 return c

def power(a,k):
 c=[1]
 for _ in range(k): c=mul(c,a)
 return c

def M(r): return [comb(r,2*k)*comb(2*k,k)//(k+1) for k in range(r//2+1)]
def left(d,i):
 # Lagrange inversion: d/(d+i) [u^i](1+u+y*u^2)^(d+i).
 return [d*factorial(d+i-1)//(factorial(k)*factorial(i-2*k)*factorial(d+k)) for k in range(i//2+1)]
def right(l,b,q):
 ans=[[1]]+[[0] for _ in range(q)]
 for _ in range(l):
  ans=[sum_polys([mul(ans[j-h],M(b+h-1)) for h in range(j+1)]) for j in range(q+1)]
 return ans

def sum_polys(polys):
 ans=[0]
 for p in polys: ans=add(ans,p)
 return ans

def ev(p,x):
 ans=0
 for a in reversed(p): ans=ans*x+a
 return ans

def der(p): return [i*p[i] for i in range(1,len(p))]

root=Path(__file__).resolve().parents[1]/'source'
for n,d,l,a,q,r in [(111,34,7,4,5,Fraction(39,10)),(112,30,9,3,5,Fraction(407,100))]:
 b=4;m=a+q;S=l*(b-1)+m
 R=right(l,b,q)
 G=sum_polys([mul(left(d,i),R[m-i]) for i in range(a,m+1)])
 norm=sum_polys([[0]*k+[c*v for v in power([1,1],S-2*k)] for k,c in enumerate(G)])
 data=json.loads((root/f'polynomial{n}.json').read_text())
 assert norm==data['normalized_narayana_ascending']
 f=data['F_descending'][::-1]
 degree=len(f)-1
 factor=mul(power([1,3],2 if n==111 else 4),[(-1)**i*v for i,v in enumerate(data['F_descending'])])
 assert G==[(17 if n==111 else 9)*v for v in factor]
 vals=[ev(f,r),ev(der(f),r),ev(der(der(f)),r)]
 A,B,C=vals
 assert B*B-A*C<0
 if n==111: assert A<-600000000 and 0<B<10000000000 and C<-300000000000
 else: assert A<-2000000 and -100000000<B<0 and C<-40000000000
 print(f'n={n}: gamma formula matches every original coefficient; exact rational Laguerre violation at {r}.')
 print('G ascending:',G)
 print('F, Fprime, Fsecond:',*map(str,vals),sep='\n')

from math import comb
from pathlib import Path
import json

def add(a,b):
 o=[0]*max(len(a),len(b))
 for i,c in enumerate(a):o[i]+=c
 for i,c in enumerate(b):o[i]+=c
 return o

def mul(a,b):
 o=[0]*(len(a)+len(b)-1)
 for i,c in enumerate(a):
  for j,v in enumerate(b):o[i+j]+=c*v
 return o

def C(n):return [comb(n,j)*comb(n,j-1)//n for j in range(1,n+1)]
def block(d,b,m):
 out=[[1]]+[[0] for _ in range(m)]
 for _ in range(d):
  nxt=[]
  for k in range(m+1):
   acc=[0]
   for j in range(k+1):acc=add(acc,mul(out[k-j],C(b+j)))
   nxt.append(acc)
  out=nxt
 return out
def powpoly(p,n):
 out=[1]
 for _ in range(n):out=mul(out,p)
 return out

def discriminant(f):
 n=len(f)-1;g=[(n-i)*f[i] for i in range(n)]
 M=[[0]*i+f+[0]*(n-2-i) for i in range(n-1)]
 M += [[0]*i+g+[0]*(n-1-i) for i in range(n)]
 size=2*n-1;old=1;sgn=1
 for k in range(size-1):
  if not M[k][k]:
   j=next(j for j in range(k+1,size) if M[j][k]);M[k],M[j]=M[j],M[k];sgn=-sgn
  p=M[k][k]
  for i in range(k+1,size):
   for j in range(k+1,size):
    v=M[i][j]*p-M[i][k]*M[k][j];assert v%old==0;M[i][j]=v//old
  for i in range(k+1,size):M[i][k]=0
  old=p
 result=sgn*M[-1][-1]*(-1)**(n*(n-1)//2)
 assert result%f[0]==0
 return result//f[0]

for length,D,L,A,Q,scale,hpow,gpow in [(111,34,7,4,5,17,2,2),(112,30,9,3,5,9,5,4)]:
 data=json.loads(Path(__file__).with_name('polynomial%d.json'%length).read_text())
 f=data['F_descending'];deg=len(f)-1;m=A+Q
 left=block(D,1,m);right=block(L,4,Q);total=[0]
 for i in range(A,m+1):total=add(total,mul(left[i],right[m-i]))
 # Q=(-x)^degree F(-(1+x)^2/x), with positive leading expansion.
 qq=[0]
 for i,c in enumerate(f):qq=add(qq,[0]*i+[(-1)**i*c*v for v in powpoly([1,1],2*(deg-i))])
 expected=[scale*v for v in mul(mul(powpoly([1,1],hpow),powpoly([1,5,1],gpow)),qq)]
 assert total==expected==data['normalized_narayana_ascending']
 assert qq==data['Q_ascending']
 disc=discriminant(f);assert disc==data['discriminant'] and disc<0
 count=sum(comb(D+i-1,i)*comb(L+m-i-1,m-i) for i in range(A,m+1))
 assert count==data['lattice_count']
 p=[1]
 def J(a,b):return [v+len(b) for v in a]+b+[len(a)+len(b)+1]
 for _ in range(D-1):p=J(p,[1])
 for _ in range(A):p.append(len(p)+1)
 for _ in range(L):p=J(p,[1,2,3,4])
 for _ in range(Q):p.append(len(p)+1)
 assert len(p)==length and sorted(p)==list(range(1,length+1))
 assert sum(a>b for a,b in zip(p,p[1:]))==D+L-1
 assert p==json.loads(Path(__file__).with_name('permutation%d.json'%length).read_text())
 print('PASS n=%d: original-coordinate DP, polynomial identity, negative integer discriminant, %d lattice points, explicit permutation.'%(length,count))
 print('discriminant',disc)

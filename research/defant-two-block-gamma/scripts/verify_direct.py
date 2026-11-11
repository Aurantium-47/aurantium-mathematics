"""Exact integer polynomial certificates. No sampled p,q values are used."""
from math import factorial
from functools import lru_cache
import json,sys,hashlib
from pathlib import Path
@lru_cache(None)
def block(t,k):
 # g_{P+1,t,k}; numerator polynomial divided by k!(t-2k)!
 if t==0:return (1,),1
 v=[1,1] # P+1
 for j in range(k+1,t): # P+1+j
  w=[0]*(len(v)+1)
  for i,x in enumerate(v):w[i]+=x*(1+j);w[i+1]+=x
  v=w
 return tuple(v),factorial(k)*factorial(t-2*k)
def gamma(a,b,M):
 m=a+b+M; scale=factorial(m); G=[{} for _ in range(m//2+1)]
 for u in range(a,a+M+1):
  v=m-u
  for i in range(u//2+1):
   x,dx=block(u,i)
   for j in range(v//2+1):
    y,dy=block(v,j); assert scale%(dx*dy)==0
    c=scale//(dx*dy); h=G[i+j]
    for r,xr in enumerate(x):
     for s,ys in enumerate(y):h[r,s]=h.get((r,s),0)+c*xr*ys
 return G
def addprod(H,A,B,factor):
 for (i,j),x in A.items():
  for (r,s),y in B.items():H[i+r,j+s]=H.get((i+r,j+s),0)+factor*x*y

def verify(lo,hi):
 rows=[]
 for m in range(lo,hi+1):
  for a in range(1,m):
   for b in range(a,m-a-3):
    M=m-a-b
    if M<4:continue
    G=gamma(a,b,M);K=m//2
    for k in range(1,K):
     H={};addprod(H,G[k],G[k],k*(K-k));addprod(H,G[k-1],G[k+1],-(k+1)*(K-k+1))
     neg=[(ij,v) for ij,v in H.items() if v<0]
     if neg:print('NEGATIVE CERTIFICATE COEFFICIENT',a,b,M,k,neg[:3],flush=True);return rows,False
     rows.append({'a':a,'b':b,'M':M,'k':k,'nonzero_coefficients':sum(v>0 for v in H.values()),'constant':H.get((0,0),0)})
  print('Verified total degree',m,'cumulative inequalities',len(rows),flush=True)
 return rows,True
if __name__=='__main__':
 if not __debug__:raise RuntimeError('Run without -O: exact certificate checks use assertions.')
 lo=int(sys.argv[1]) if len(sys.argv)>1 else 6
 hi=int(sys.argv[2]) if len(sys.argv)>2 else 18
 rows,ok=verify(lo,hi)
 rows.sort(key=lambda r:(r['a']+r['b']+r['M'],r['a'],r['b'],r['k']))
 digest=hashlib.sha256(json.dumps(rows,sort_keys=True,separators=(',',':')).encode()).hexdigest()
 result={'passed':ok,'lo':lo,'hi':hi,'minimum_M':4,'inequalities':len(rows),'rows_sha256':digest}
 if lo==6 and hi==18:
  expected=json.loads((Path(__file__).resolve().parents[1]/'results/coefficients.json').read_text())
  assert digest==expected['previous_scope_rows_sha256']
 print(json.dumps(result,indent=2))
 assert ok

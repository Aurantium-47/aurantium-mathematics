from itertools import combinations,product
from sympy.polys.rings import ring
from sympy.polys.domains import ZZ
import json,time,sys
P=[[[1]],[[1,1],[0,1]],[[1,4,1],[0,3,3],[0,0,2]],[[1,11,11,1],[0,7,22,7],[0,0,12,12],[0,0,0,6]]]
def conv(a,b):
 c=[a[0]*0]*(len(a)+len(b)-1)
 for i,v in enumerate(a):
  for j,w in enumerate(b):c[i+j]+=v*w
 return c

def calc(u):
 R,*r=ring(','.join('r%d'%i for i in range(u)) or 'dummy',ZZ)
 one=R.one; z=R.zero; U=frozenset(range(u))
 g={I:None for k in range(u+1) for I in map(frozenset,combinations(range(u),k))}
 c={}
 for I in g:
  a=[one];b=one
  for i in I:a=conv(a,[one,r[i]]);b*=one+r[i]
  g[I]=a;c[I]=b
 choices=[[I for I in g if len(I)<=s] for s in range(1,4)]
 sums={};count=0
 for sets in product(*choices):
  if frozenset.union(*sets)!=U:continue
  count+=1
  polys=[g[U]]+[conv([R(v) for v in P[s][len(I)]],g[U-I]) for s,I in enumerate(sets,1)]
  weight=one
  for i in U:
   mul=sum(i in I for I in sets)
   weight*=(one+r[i])**(mul-1)
  wedge={():weight}
  for row in polys:
   nex={}
   for cols,v in wedge.items():
    for k,w in enumerate(row):
     if not w or k in cols:continue
     new=tuple(sorted(cols+(k,)))
     sign=(-1)**sum(j>k for j in cols)
     nex[new]=nex.get(new,z)+sign*v*w
   wedge=nex
  for cols,v in wedge.items():sums[cols]=sums.get(cols,z)+v
 neg=[];nonzero=0
 for cols,v in sums.items():
  if v:nonzero+=1
  if any(co<0 for co in v.values()): neg.append((cols,str(v)))
 out={'u':u,'assignments':count,'minors':len(sums),'nonzero':nonzero,'negative_count':len(neg),'negative_examples':neg[:3]}
 print(json.dumps(out),flush=True)
 with open('local_u%d.txt'%u,'w')as f:
  for cols,v in sorted(sums.items()): f.write(str(cols)+' '+str(v)+'\n')
 return out
if __name__=='__main__':
 for u in map(int,sys.argv[1:] or range(7)):
  t=time.time();calc(u);print('time',time.time()-t,flush=True)

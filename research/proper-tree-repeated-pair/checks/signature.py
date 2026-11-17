from itertools import product,combinations
from collections import defaultdict

def edges(seq,n):
 d=[1]*n
 for v in seq:d[v]+=1
 e=[]
 for v in seq:
  u=next(i for i in range(n) if d[i]==1);e.append(tuple(sorted((u,v))));d[u]-=1;d[v]-=1
 e.append(tuple(i for i in range(n) if d[i]==1));return frozenset(e)
def sig(E,n):
 c=lambda x:0 if x<2 else x
 edge=defaultdict(int);triple=defaultdict(int)
 for u,v in E:edge[tuple(sorted((c(u),c(v))))]+=1
 for a,b,c1 in combinations(range(n),3):
  if sum(tuple(sorted(p)) in E for p in [(a,b),(b,c1),(a,c1)])==2:
   triple[tuple(sorted((c(a),c(b),c(c1))))]+=1
 return tuple(sorted(edge.items())),tuple(sorted(triple.items()))
def canonical(E):
 sw=lambda x:1-x if x<2 else x
 return min(tuple(sorted(E)),tuple(sorted(tuple(sorted((sw(u),sw(v)))) for u,v in E)))
for n in range(3,8):
 seen={}
 for seq in product(range(n),repeat=n-2):
  E=edges(seq,n);s=sig(E,n);v=canonical(E)
  assert s not in seen or seen[s]==v
  seen[s]=v
 print(n,n**(n-2),len(seen),flush=True)

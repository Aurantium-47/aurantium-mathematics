"""Check complete-profile isolation for the 668-vertex matched fixture."""
from itertools import combinations, product
from collections import defaultdict,Counter
def blocksets(V,r):
 if r==0: yield ();return
 if len(V)<2: return
 x,*tail=V
 yield from blocksets(tail,r)
 for k in range(1,min(r,len(tail))+1):
  for S in combinations(tail,k):
   for P in blocksets([i for i in tail if i not in S],r-k): yield ((x,*S),*P)
def check(W):
 C=Counter(W); U=W[6:]; R=(2,5)
 def profile(B):
  D=C.copy()
  for b in B: D.subtract(b)
  if min(D.values())<0:return
  return tuple(sorted(tuple(sorted(b)) for b in B+tuple((i,) for i in D.elements())))
 def key(P):return tuple(sorted(map(sum,P)))
 target=[{},{}]
 def add(r,B):
  P=profile(B)
  if P:
   K=key(P)
   if K in target[r-2] and target[r-2][K]!=P: raise ValueError
   target[r-2][K]=P
 try:
  for u,v in combinations(U,2):
   for a in R:add(2,((u,v,a),))
  for (a,b),u in product(((2,2),(2,5),(5,2)),U): add(2,((u,a),(a,b)))
  for (a,b),(u,v) in product(((2,2),(2,5),(5,2)),combinations(U,2)): add(3,((u,a),(v,b),(a,b)))
 except ValueError:return
 for i,r in enumerate((2,3)):
  for Bidx in BB[i]:
   B=tuple(tuple(W[j] for j in b) for b in Bidx)
   P=profile(B); P0=target[i].get(key(P))
   if P0 and P0!=P:return
 return [len(t) for t in target]
BB=[list(blocksets(list(range(12)),r)) for r in (2,3)]
W = (2, 2, 2, 2, 5, 5, 13, 24, 46, 87, 167, 313)
assert 13+46+87+167 == 313 and sum(W) == 668
assert check(W) == [48, 45]
print('PASS: all 48 two-edge and 45 three-edge matched profiles isolated despite 313=13+46+87+167.')

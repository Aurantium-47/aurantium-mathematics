from itertools import combinations
from random import Random
pairs=0; families=0
for m in (3,4):
  rng=Random(550013+m)
  masks=range(1,1<<(1<<m)) if m==3 else [rng.randrange(1,1<<(1<<m)) for _ in range(3000)]
  for fammask in masks:
    fam={i for i in range(1<<m) if fammask>>i&1}
    closure=all(a|b in fam for a in fam for b in fam)
    for t,p in combinations(range(m),2):
      W=((1<<m)-1)^(1<<t)^(1<<p)
      B=[set() for _ in range(4)]
      for a in fam:
        u=((a>>t)&1)*2+((a>>p)&1)
        B[u].add(W&~a)
      bc=all(a&b in B[u|v] for u in range(4) for v in range(4) for a in B[u] for b in B[v])
      assert closure==bc
      for x in range(m):
        if W>>x&1:
          assert sum(bool(a>>x&1) for a in fam)==len(fam)-sum(bool(a>>x&1) for block in B for a in block)
      pairs+=1
    families+=1
for m in range(2,101):
  got=[]
  for h in range(m-1,2*m+2):
    for s in range(m+1,2*m+2):
      if h+s<=2*m+1:
        got.append((h,2*m+1-h,s,4*m+3-(2*m+1)-s))
  assert set(got)=={(m-1,m+2,m+1,m+1),(m,m+1,m+1,m+1),(m-1,m+2,m+2,m)}
print('PASS',families,'families;',pairs,'distinguished pairs; all block closure equivalences and avoidance counts; 99 cardinality classifications')

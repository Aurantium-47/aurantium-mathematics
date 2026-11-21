import itertools,collections
# Independent weighted forest expansion and recover edge/triple coefficients

def prufer(seq,n):
 deg=[1]*n
 for x in seq:deg[x]+=1
 edges=[]
 for x in seq:
  y=next(i for i in range(n) if deg[i]==1)
  edges.append((x,y));deg[x]-=1;deg[y]-=1
 edges.append(tuple(i for i in range(n) if deg[i]==1));return edges

def poly(E,w):
 n=len(w); P=collections.Counter()
 for mask in range(1<<len(E)):
  lab=list(range(n))
  def root(i):
   while lab[i]!=i:i=lab[i]
   return i
  for j,(a,b) in enumerate(E):
   if mask>>j&1:lab[root(a)]=root(b)
  comps=collections.defaultdict(list)
  for i in range(n):comps[root(i)].append(i)
  comps=list(comps.values()); sums=[sum(w[i] for i in c) for c in comps]
  for j,c in enumerate(comps):
   exp=sums.copy();exp[j]-=1
   if exp[j]==1:continue
   P[tuple(sorted(exp))]+=(-1)**mask.bit_count()*(sums[j]-len(c))
 return P
checks=0
for n in range(3,7):
 w=[2,2]+[2*3**j for j in range(1,n-1)]
 for seq in itertools.product(range(n),repeat=n-2):
  E=prufer(seq,n); P=poly(E,w)
  for size in [2,3]:
   expected=collections.Counter()
   for C in itertools.combinations(range(n),size):
    if sum(a in C and b in C for a,b in E)!=size-1:continue
    expected[tuple(sorted(w[i] for i in C))]+=1
   for colors in set(tuple(sorted(w[i] for i in C)) for C in itertools.combinations(range(n),size)):
    rem=w.copy()
    for x in colors:rem.remove(x)
    mon=tuple(sorted(rem+[sum(colors)-1]))
    val=P[mon]*(-1)**(size-1)
    assert val==(sum(colors)-size)*expected[colors],(n,seq,colors,val,expected[colors])
    checks+=1
 print(n,'passed',flush=True)
print('coefficient_checks',checks)

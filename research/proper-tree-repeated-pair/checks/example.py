from itertools import product
from collections import Counter, deque
weights = [2,2,6,18,54,162,486] # c,u1,u2,u3,v1,v2,v3
edges = [(0,1),(0,2),(0,3),(1,4),(2,5),(3,6)]
counts = list(product(range(3), *([range(2)]*5)))
sums = [2*sum(d*3**i for i,d in enumerate(ds)) for ds in counts]
assert Counter(weights) == Counter({2: 2, 6: 1, 18: 1, 54: 1, 162: 1, 486: 1})
assert all(w % 2 == 0 for w in weights)
assert len(set(sums)) == len(sums) == 96
G = [set() for _ in range(sum(weights))]
for u,v in edges: G[u].add(v); G[v].add(u)
nxt=7
for u,w in enumerate(weights):
 for _ in range(w-1):
  G[u].add(nxt); G[nxt].add(u); nxt+=1
assert nxt == sum(weights) == 730
assert sum(len(a)==1 for a in G) == 723
assert [len(G[i]) for i in range(7)] == [4,3,7,19,54,162,486]
assert [sum(i in e for e in edges) for i in range(7)] == [3,2,2,2,1,1,1]
assert sum(len(a) for a in G)//2 == 729
assert all(any(len(G[v])==1 for v in G[u]) for u in range(7))
assert all(len(G[u])>1 for u in range(7))
assert not any(len(a)==2 for a in G)
def farthest(start):
 d={start:0}; queue=deque([start])
 while queue:
  u=queue.popleft()
  for v in G[u]:
   if v not in d: d[v]=d[u]+1; queue.append(v)
 return max(d,key=d.get),max(d.values())
a,_=farthest(0); _,diam=farthest(a)
assert len(G) == 730 and diam==6
# Check the skeleton diameter directly, without relying on the expanded formula.
skeleton = [{v for v in G[u] if v < 7} for u in range(7)]
saved = G
G = skeleton
a,_ = farthest(0); _,skeleton_diameter = farthest(a)
assert skeleton_diameter == 4
G = saved
print('96 distinct submultiset sums; 730 vertices; 729 edges; 723 leaves; proper; diameter 6')
print('degrees:', sorted(Counter(map(len,G)).items()))
print('Skeleton degrees:', [sum(u in e for e in edges) for u in range(7)])

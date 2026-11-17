# Independently written exhaustive structural test; no author code imported.
import itertools
count=0
for m in range(2,5):
 universe=(1<<m)-1
 masks=list(range(1<<m))
 uc=0
 for code in range(1,1<<(1<<m)):
  f={x for x in masks if code>>x&1}
  if any((x|y) not in f for x in f for y in f): continue
  uc+=1
  t,p=0,1
  w=universe ^ 3
  blocks={k:set() for k in range(4)}
  for x in f: blocks[x&3].add(w^(x&w))
  for a,b in itertools.product(range(4),repeat=2):
   for x,y in itertools.product(blocks[a],blocks[b]):
    assert x&y in blocks[a|b]
  rebuilt={(w^x)|k for k,bs in blocks.items() for x in bs}
  assert rebuilt==f
  for j in range(2,m):
   omitted=sum(bool(x&(1<<j)) for bs in blocks.values() for x in bs)
   assert omitted==sum(not(x&(1<<j)) for x in f)
  count+=1
 print('m',m,'all nonempty union-closed families checked',uc)
print('total',count,'PASS')

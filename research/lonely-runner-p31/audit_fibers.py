import random,itertools
from pathlib import Path
random.seed(742)
# Independent functional BnB using integer masks of GOOD times.
def oracle(v,L):
 m=31*L; half=m//2; universe=(1<<half)-1
 good=[]
 for a in v:
  row=[]
  for b in [0,1]:
   x=a+b*half
   row.append(sum(1<<(t-1) for t in range(1,half+1) if m<=16*((x*t)%m)<=15*m))
  good.append(row)
 forced=[0]*16
 for i in range(14,-1,-1):forced[i]=forced[i+1]|(good[i][0]&good[i][1]) # NOT sufficient across speeds -- unused
 ans=[]
 def rec(i,mask,remaining):
  # Any time good for all choices of all remaining coordinates proves every child good.
  guaranteed=remaining
  for j in range(i,15):guaranteed &= good[j][0]&good[j][1]
  if guaranteed:return
  if i==15:ans.append(mask);return
  rec(i+1,mask,remaining&good[i][0]); rec(i+1,mask|(1<<i),remaining&good[i][1])
 rec(0,0,universe)
 return set(ans)
for L in [2,4,8,16]:
 lines=Path(f'runner16_math/fiber{L}.txt').read_text().splitlines()
 v=list(map(int,lines[0].split())); expected=set(map(int,lines[1].split())) if len(lines)>1 else set()
 got=oracle(v,L);assert got==expected
 # All 32768 masks independent GOOD-set intersection, not bad union.
 m=31*L; half=m//2; full=(1<<half)-1
 good=[[sum(1<<(t-1) for t in range(1,half+1) if m<=16*(((a+b*half)*t)%m)<=15*m) for b in [0,1]] for a in v]
 raw=set()
 for mask in range(32768):
  g=full
  for i in range(15):g &=good[i][(mask>>i)&1]
  if not g:raw.add(mask)
 assert got==raw
 print('level',L,'independent good intersections and recursion equal stored fiber',len(got),flush=True)
# Initial residue argument, exhaustive random tuples only as additional sanity check
for _ in range(1000):
 v=[random.randrange(1,31) for i in range(15)]
 witness=any(all(31<=16*((t*x)%31)<=15*31 for x in v) for t in range(1,31))
 distinct=len({min(x,31-x) for x in v})==15
 assert witness != distinct
print('initial residue equivalence random sanity tests passed')

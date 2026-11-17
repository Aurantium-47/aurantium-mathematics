import itertools,json
out={}
for n in range(1,5):
 U=(1<<n)-1; uc=regsep=small=0
 for mask in range(1,1<<(1<<n)):
  F=[a for a in range(1<<n) if mask>>a&1]; S=set(F)
  if any((a|b) not in S for a in F for b in F):continue
  uc+=1
  deg=[sum(a>>i&1 for a in F) for i in range(n)]
  if any(a.bit_count() in (1,2) for a in F):
   small+=1; assert 2*max(deg)>=len(F)
  stars=[tuple(a>>i&1 for a in F) for i in range(n)]
  if len(set(deg))==1 and len(set(stars))==n and max(F)==U:
   regsep+=1
   # singleton ground needs a nonempty avoiding collection; n>=2 is relevant
   if n>=2: assert all(U^(1<<i) in S for i in range(n))
 out[n]={'union_closed':uc,'regular_separated_fullground':regsep,'with_size1_or2':small}
print(json.dumps(out,indent=2))
assert 55-14==41 and 27-13==14 and 13*14==182
assert 14*12 + 12*3 == 204 > 182

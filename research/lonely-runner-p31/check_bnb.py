from pathlib import Path
for l in [2,4,8,16]:
 lines=Path(f'runner16_math/fiber{l}.txt').read_text().splitlines()
 v=list(map(int,lines[0].split())); expected=set(map(int,lines[1].split())) if len(lines)>1 else set()
 M=31*l; got=set()
 for mask in range(32768):
  w=[a+((mask>>i)&1)*(M//2) for i,a in enumerate(v)]
  # Direct independent evaluation, no precomputed bad bit sets or BnB.
  witness=any(all(16*min((t*a)%M, M-(t*a)%M)>=M for a in w) for t in range(1,M//2+1))
  if not witness:got.add(mask)
 assert got==expected,(l,len(got),len(expected))
 print(l,'direct Python agrees on all 32768 assignments;',len(got),'witness-free',flush=True)

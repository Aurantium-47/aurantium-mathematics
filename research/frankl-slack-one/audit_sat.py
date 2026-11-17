"""Independent raw-family oracle; no use of Encoding.check or assumptions."""
import sys,itertools,random,json
from slack_sat import Encoding
from pysat.solvers import Solver

def oracle(w,bs,edges,cap):
    if any(len(b)!=len(set(b)) for b in bs): return False
    if any((a,c) not in edges for a,b in edges for bb,c in edges if b==bb):return False
    if bs[3][0]!=0:return False
    if any(bs[3][j+1] != sum(1<<i for i in range(w) if i==j or (i,j) in edges) for j in range(w)):return False
    if any((r>>j&1) and not (r>>i&1) for b in bs for r in b for i,j in edges):return False
    F=[((1<<w)-1-r)+(k<<w) for k,b in enumerate(bs) for r in b]
    FS=set(F)
    return len(FS)==len(F) and all(a|b in FS for a in F for b in F) and all(sum((a>>x)&1 for a in F)<=cap for x in range(w+2))

def fix(enc,bs,edges):
    ls=[]
    for k,b in enumerate(bs):
        for i,r in enumerate(b):
            for x in range(enc.w):ls.append(enc.rows[k][i][x]*(1 if r&(1<<x) else -1))
    return ls+[v*(1 if p in edges else -1) for p,v in enc.order.items()]

rng=random.Random(17823);total=positive=0
for e in (0,1):
 for cap in (6,8,11):
  enc=Encoding(3,e,[2,2,2,4+e],cap)
  with Solver(name='g4',bootstrap_with=enc.cnf) as solver:
   for q in range(1600):
    edges=set(p for p in ((0,1),(0,2),(1,2)) if rng.randrange(2))
    H=[0]+[sum(1<<i for i in range(3) if i==j or (i,j) in edges) for j in range(3)]
    if e:H.append(rng.randrange(8))
    # Half the samples use H-based rows to exercise many positive models.
    B=[[rng.choice(H) if q%2 else rng.randrange(8) for _ in range(2)] for k in range(3)]+[H]
    expected=oracle(3,B,edges,cap)
    got=solver.solve(assumptions=fix(enc,B,edges))
    assert got==expected,(e,cap,B,edges,got,expected)
    if got:
     decoded,decoded_order=enc.decode(solver.get_model())
     assert decoded==B and set(decoded_order)==edges
     assert oracle(3,decoded,set(decoded_order),cap)
     positive+=1
    total+=1
# Explicit E target: intersection of the R and S row E must land at H's E.
enc=Encoding(3,1,[2,2,2,5],10)
B=[[0,3],[0,3],[0,3],[0,1,2,4,3]]
with Solver(name='g4',bootstrap_with=enc.cnf) as s:
 assert oracle(3,B,set(),10)
 assert s.solve(assumptions=fix(enc,B,set()))
 model=set(s.get_model())
 assert enc.pool.id(('witness',1,1,2,1,4)) in model
print(json.dumps({'independent_assignments':total,'positive':positive,'explicit_E_target':'PASS','status':'PASS'}))

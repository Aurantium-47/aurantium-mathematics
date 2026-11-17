"""Restricted regular subproblem ONLY; does not strengthen the general reduction."""
import sys,json,time
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from slack_sat import Encoding
from pysat.card import CardEnc,EncType
from pysat.solvers import Solver

def add_regular(enc):
 # Existing cap supplies <= cap. These clauses supply >= cap.
 for x in range(enc.w):
  lits=[-row[x] for block in enc.rows for row in block]
  enc.cnf.extend(CardEnc.atleast(lits,bound=enc.cap,vpool=enc.pool,encoding=EncType.seqcounter).clauses)
 if any(enc.sizes[k]+enc.sizes[3]!=enc.cap for k in (1,2)):
  enc.cnf.append([])
 # Redundant consequence of separated regularity: no strict domination.
 enc.cnf.extend([[-v] for v in enc.order.values()])
 # No R/S row anchoring: this modifier preserves all slot assignments.
 return enc

def tests():
 checked=positive=0
 # Independent direct family oracle: enumerate every family on three points.
 # Fix t=bit1,p=bit2; W=bit0. Fixed assignments test all UC candidates
 # fitting base H shape, not merely regular or crown-bearing families.
 for mask in range(1,256):
  fam={a for a in range(8) if mask>>a&1}
  if not all((a|b) in fam for a in fam for b in fam):continue
  bs=[[1^(a&1) for a in sorted(fam) if a>>1==k] for k in range(4)]
  if len(bs[3])!=2 or set(bs[3])!={0,1}:continue
  bs[3]=[0,1]
  degrees=[sum(a>>x&1 for a in fam) for x in range(3)]
  for cap in range(1,len(fam)+1):
   enc=add_regular(Encoding(1,0,list(map(len,bs)),cap))
   expected=len(set(degrees))==1 and degrees[0]==cap
   with Solver(name='g4',bootstrap_with=enc.cnf) as s:
    actual=s.solve(assumptions=enc.assumptions(bs,[]))
   assert actual==expected,(fam,cap,degrees,actual)
   checked+=1;positive+=expected
 print(json.dumps({'direct_family_assignments':checked,'regular_positive_cases':positive,'status':'PASS'}))
 # Crown lemma independent exhaustive finite check for all 3-point regular
 # separated union-closed full-ground families (not restricted to base shape).
 nchecked=0
 for mask in range(1,256):
  fam={a for a in range(8) if mask>>a&1}
  if 7 not in fam or not all((a|b) in fam for a in fam for b in fam):continue
  stars=[frozenset(a for a in fam if a>>x&1) for x in range(3)]
  if len(set(stars))!=3 or len({len(st) for st in stars})!=1:continue
  assert {7,6,5,3}<=fam;nchecked+=1
 print(json.dumps({'crown_lemma_families':nchecked,'status':'PASS'}))

def run():
 for case in ('00','10','01'):
  e,b=map(int,case);enc=add_regular(Encoding(11,e,[14-b,15-e,14+b,12+e],27))
  start=time.time()
  with Solver(name='g4',bootstrap_with=enc.cnf) as s:
   s.conf_budget(20000);r=s.solve_limited(expect_interrupt=True)
   print(json.dumps({'case':case,'scope':'regular-only','vars':enc.cnf.nv,'clauses':len(enc.cnf.clauses),'status':('SAT' if r else 'SOLVER_UNSAT_NOT_CERTIFIED') if r is not None else 'UNKNOWN','seconds':round(time.time()-start,2),'stats':s.accum_stats()}),flush=True)
   if r:
    family=enc.check(*enc.decode(s.get_model()))
    assert all(sum(a>>x&1 for a in family)==27 for x in range(13))
    assert all(((1<<13)-1)^(1<<x) in family for x in range(13))
if __name__=='__main__':
 tests()
 if '--run' in sys.argv:run()

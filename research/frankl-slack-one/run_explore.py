"""Bounded independent exploration, no claims from unverified UNSAT."""
import os,sys,time,json,hashlib,resource
resource.setrlimit(resource.RLIMIT_AS,(1536*1024**2,1536*1024**2))
resource.setrlimit(resource.RLIMIT_CPU,(40,45))
from pysat.formula import CNF
from pysat.solvers import Solver
import pysat
sys.path.insert(0,os.path.dirname(__file__))
from slack_sat import Encoding
branch=sys.argv[1];path=f'slack13_{branch}.cnf';out=f'explore_{branch}'
raw=open(path,'rb').read();h=hashlib.sha256(raw).hexdigest()
print(json.dumps({'branch':branch,'cnf_sha256':h,'python_sat':pysat.__version__,'solver':'Glucose4 (PySAT g4)','limits':{'address_space_MiB':1536,'CPU_soft_s':40,'CPU_hard_s':45,'outer_wall_s':50},'start':time.time()}),flush=True)
f=CNF(from_file=path);del raw
start=time.monotonic()
with Solver(name='g4',bootstrap_with=f,with_proof=True) as s:
 s.conf_budget(20000)
 result=s.solve_limited(expect_interrupt=True)
 print(json.dumps({'result':result,'elapsed_s':time.monotonic()-start,'stats':s.accum_stats()}),flush=True)
 if result is True:
  model=s.get_model();json.dump(model,open(out+'.model.json','w'))
  meta=json.load(open(path+'.map.json'))
  enc=object.__new__(Encoding);enc.w=11;enc.e=int(branch[0]);enc.sizes=meta['sizes'];enc.cap=meta['cap'];enc.rows=meta['rows'];enc.order={(x,j):v for x,j,v in meta['order']}
  family=enc.check(*enc.decode(model));json.dump(family,open(out+'.family.json','w'))
  # Independently check every original CNF clause under the complete model.
  yes=set(model);assert all(any(l in yes for l in c) for c in f.clauses)
  print('SAT: CNF clauses and reconstructed family both checked',flush=True)
 elif result is False:
  proof=s.get_proof();open(out+'.drat','w').write('\n'.join(proof or [])+'\n')
  print('SOLVER UNSAT ONLY: external certificate verification and encoding audit outstanding; not a proved mathematical result',flush=True)
 else: print('UNKNOWN: conflict budget reached; no SAT model or UNSAT conclusion',flush=True)

"""Nontrivial PHP(5,4) UNSAT proof-generation test, independent of research CNFs."""
import itertools,json,hashlib,pysat
from pysat.formula import CNF
from pysat.solvers import Solver
p,h=5,4
v=lambda i,j:i*h+j+1
f=CNF()
for i in range(p):f.append([v(i,j) for j in range(h)])
for j in range(h):
 for i,k in itertools.combinations(range(p),2):f.append([-v(i,j),-v(k,j)])
assert all(len(c)>=2 for c in f.clauses)
f.to_file('php54.cnf')
with Solver(name='g4',bootstrap_with=f,with_proof=True) as s:
 assert s.solve() is False
 proof=s.get_proof();assert proof and any(x.strip()=='0' for x in proof)
 open('php54.drat','w').write('\n'.join(proof)+'\n')
 print(json.dumps({'solver':'Glucose 4.1','python_sat':pysat.__version__,'variables':f.nv,'clauses':len(f.clauses),'min_original_clause_length':min(map(len,f.clauses)),'proof_lines':len(proof),'stats':s.accum_stats()}))
open('php54.empty.drat','w').close()
# A negative control known SAT: remove the fifth pigeon's at-least-one clause.
g=CNF(from_clauses=[c for i,c in enumerate(f.clauses) if i!=p-1])
g.to_file('php54.sat_control.cnf')
with Solver(name='g4',bootstrap_with=g) as s:
 assert s.solve()
 model=set(s.get_model());assert all(any(l in model for l in c) for c in g.clauses)
 print('Negative control CNF is SAT; model directly checked')

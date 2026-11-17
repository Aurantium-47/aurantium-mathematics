"""Independent exact slot encoding. Default only tiny tests; no author code imported."""
import itertools,json,argparse
from pysat.formula import CNF,IDPool
from pysat.card import CardEnc,EncType
from pysat.solvers import Solver

class Encoding:
 def __init__(self,w,e,sizes,cap):
  # block order 00=T,01=R (t),10=S (p),11=H
  assert sizes[3]==w+1+e and e in (0,1)
  self.w,self.e,self.sizes,self.cap=w,e,sizes,cap
  self.pool=IDPool(); self.cnf=CNF(); v=self.pool.id; add=self.cnf.append
  self.rows=[[ [v(('bit',k,i,x)) for x in range(w)] for i in range(sizes[k])] for k in range(4)]
  self.order={(x,j):v(('order',x,j)) for x in range(w) for j in range(x+1,w)}
  for x in range(w):
   for y in range(x+1,w):
    for z in range(y+1,w): add([-self.order[x,y],-self.order[y,z],self.order[x,z]])
  # H[0] empty; H[j+1] principal ideal of j.
  for a in self.rows[3][0]: add([-a])
  for j in range(w):
   for x,a in enumerate(self.rows[3][j+1]):
    if x==j: add([a])
    elif x>j: add([-a])
    else:
     p=self.order[x,j];add([-a,p]);add([a,-p])
  for block in self.rows:
   for row in block:
    for (x,j),p in self.order.items(): add([-p,-row[j],row[x]])
   for i,j in itertools.combinations(range(len(block)),2):
    ds=[]
    for x,(a,b) in enumerate(zip(block[i],block[j])):
     d=v(('diff',block[i][0] if w else 0,i,j,x));ds.append(d)
     for c in ([-d,a,b],[-d,-a,-b],[d,-a,b],[d,a,-b]):add(c)
    add(ds)
  # Every pair has a witness in its OR block, with exact intersection bits.
  indexed=[(k,i,row) for k,block in enumerate(self.rows) for i,row in enumerate(block)]
  for z,(k,i,a) in enumerate(indexed):
   for l,j,b in indexed[z:]:
    ss=[]
    for h,c in enumerate(self.rows[k|l]):
     s=v(('witness',k,i,l,j,h));ss.append(s)
     for aa,bb,cc in zip(a,b,c):
      add([-s,-cc,aa]);add([-s,-cc,bb]);add([-s,-aa,-bb,cc])
    add(ss)
  # At most cap occurrences for each W coordinate (absence bits negated).
  for x in range(w):
   lits=[-r[x] for block in self.rows for r in block]
   if cap<len(lits): self.cnf.extend(CardEnc.atmost(lits,bound=cap,vpool=self.pool,encoding=EncType.seqcounter).clauses)
  # t and p frequencies are constants.
  if sizes[1]+sizes[3]>cap or sizes[2]+sizes[3]>cap: add([])
 def decode(self,model):
  yes=set(model)
  required={a for block in self.rows for row in block for a in row}|set(self.order.values())
  if any((a in yes)==(-a in yes) for a in required): raise ValueError('Incomplete or inconsistent semantic model')
  bs=[[sum(1<<x for x,a in enumerate(r) if a in yes) for r in b] for b in self.rows]
  order=[(x,j) for (x,j),a in self.order.items() if a in yes]
  return bs,order
 def check(self,bs,order):
  wmask=(1<<self.w)-1
  assert list(map(len,bs))==self.sizes
  assert all(len(set(b))==len(b) for b in bs)
  assert bs[3][0]==0
  for j in range(self.w): assert bs[3][j+1]==(1<<j)|sum(1<<x for x,y in order if y==j)
  for x,y in order:
   for yy,z in order:
    if y==yy: assert (x,z) in order
  for b in bs:
   for r in b:
    for x,j in order: assert not(r>>j&1) or r>>x&1
  family={(wmask^r)|(k<<self.w) for k,b in enumerate(bs) for r in b}
  assert len(family)==sum(self.sizes)
  assert all(a|b in family for a in family for b in family)
  assert all(sum(a>>x&1 for a in family)<=self.cap for x in range(self.w+2))
  return sorted(family)
 def assumptions(self,bs,order):
  return [a if r>>x&1 else -a for block,b in zip(self.rows,bs) for row,r in zip(block,b) for x,a in enumerate(row)]+[a if p in order else -a for p,a in self.order.items()]

def tests():
 total=valid=0
 # exhaustive possible singleton R,S,T on two ground coordinates, both E branches
 for e in (0,1):
  enc=Encoding(2,e,[1,1,1,3+e],7)
  with Solver(name='g4',bootstrap_with=enc.cnf) as s:
   for order in ([],[(0,1)]):
    base=[0,1,3 if order else 2]
    for extra in ([None] if not e else range(4)):
     h=base+([] if extra is None else [extra])
     for t,r,p in itertools.product(range(4),repeat=3):
      bs=[[t],[r],[p],h];total+=1
      try: enc.check(bs,order); expected=True;valid+=1
      except AssertionError: expected=False
      assert s.solve(assumptions=enc.assumptions(bs,order))==expected,(e,bs,order)
      if expected: enc.check(*enc.decode(s.get_model()))
 print(json.dumps({'assignments_checked':total,'valid':valid,'E_branches':[0,1],'status':'PASS'}))
 # Exercise two R slots, duplicates, and nontrivial frequency caps.
 more=0
 for e,cap in itertools.product((0,1),range(4,9)):
  enc=Encoding(2,e,[1,2,1,3+e],cap)
  with Solver(name='g4',bootstrap_with=enc.cnf) as s:
   for order in ([],[(0,1)]):
    base=[0,1,3 if order else 2]
    for extra in ([None] if not e else range(4)):
     h=base+([] if extra is None else [extra])
     for t,r0,r1,p in itertools.product(range(4),repeat=4):
      bs=[[t],[r0,r1],[p],h];more+=1
      try: enc.check(bs,order); expected=True
      except AssertionError: expected=False
      assert s.solve(assumptions=enc.assumptions(bs,order))==expected,(e,cap,bs,order)
      if expected: enc.check(*enc.decode(s.get_model()))
 print(json.dumps({'additional_assignments':more,'caps':list(range(4,9)),'duplicate_R_test':True,'status':'PASS'}))

if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--emit',choices=['00','10','01']);a=p.parse_args()
 if a.emit:
  e,b=map(int,a.emit);m=13
  enc=Encoding(m-2,e,[m+1-b,m+2-e,m+1+b,m-1+e],2*m+1)
  path='slack13_'+a.emit+'.cnf';enc.cnf.to_file(path)
  open(path+'.map.json','w').write(json.dumps({'rows':enc.rows,'order':[[x,j,v] for (x,j),v in enc.order.items()],'sizes':enc.sizes,'cap':enc.cap}))
  print(path,enc.cnf.nv,len(enc.cnf.clauses))
 else: tests()

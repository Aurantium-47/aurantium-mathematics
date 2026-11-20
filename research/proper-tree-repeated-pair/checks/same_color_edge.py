from collections import Counter
from itertools import combinations,combinations_with_replacement
from math import comb
from diagonal_extraction import unmarked, direct_unmarked, parts
import two_edge_rank as t
W=(3,3,6,3,4,5,5,2,7)
E=((0,1),(1,2),(2,4),(4,3),(0,5),(5,6),(5,7),(7,8))
V=W+(3,5)
F=((0,1),(1,2),(2,4),(4,3),(0,5),(7,6),(5,7),(7,8),(4,9),(7,10))
def run(V,E,marked):
 w=Counter(V); e=Counter(t.edge_type(V[i],V[j]) for i,j in E)
 edge=t.edge_type; temp=t.template if marked else unmarked
 known=Counter(); ordinary=[]; special=[]
 for l,r in combinations_with_replacement(sorted(e),2):
  t.add_scaled(known,temp(w,l,r),comb(e[l],2) if l==r else e[l]*e[r])
 for a in sorted(w):
  U=[u for u in sorted(w) if e[edge(a,u)]]
  for b,c in combinations_with_replacement(U,2):
   l,r=edge(a,b),edge(a,c)
   def col():
    d=temp(w,(a,b,c));t.add_scaled(d,temp(w,l,r),-1)
    return d
   if w[a]==1 or (b!=c and a in (b,c) and w[a]==2):
    t.add_scaled(known,col(),comb(e[l],2) if l==r else e[l]*e[r]);continue
   if b==c:continue
   row=list(parts(w,l,r))
   if marked: row[row.index(a)]-=1
   (special if a in (b,c) else ordinary).append(((a,b,c),tuple(sorted(row)),col()))
 t.W,t.EDGES=V,E
 y=t.direct_layer() if marked else direct_unmarked(V,E)
 for stage in [special,ordinary]:
  for j,(key,row,col) in enumerate(stage):
   assert all(not other[row] for k,(_,_,other) in enumerate(stage) if k!=j)
   if stage is special: assert all(not other[row] for _,_,other in ordinary)
  for key,row,col in stage:
   n,d=divmod(y[row]-known[row],col[row]); assert n in (0,1) and d==0
   a,b,c=key
   derived=sum(V[i]==a and {b,c}<={V[j if i==p else p] for p,j in E if i in (p,j)} for i in range(len(V)))
   assert n==derived,(key,n,derived)
   print(key,row,n)
   t.add_scaled(known,col,n)
 assert +known==y
 print(sum(V), len(y),len(special)+len(ordinary))
run(W,E,False)
run(V,F,True)

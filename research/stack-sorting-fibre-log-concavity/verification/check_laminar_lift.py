"""Independent exact finite checks for the proposed Lorentzian lift.
No numerical root/eigenvalue approximations are used.
"""
from math import comb, factorial
from functools import lru_cache
from collections import defaultdict
from random import Random
from itertools import product
import json
from pathlib import Path

R={(1,1,0):1,(1,0,1):1,(0,1,1):1,(0,0,2):1} # variables u,v,w

def mul(p,q):
    r=defaultdict(int)
    for a,x in p.items():
        for b,y in q.items():r[tuple(i+j for i,j in zip(a,b))]+=x*y
    return dict(r)

def unimul(p,q):
    r=[0]*(len(p)+len(q)-1)
    for i,x in enumerate(p):
        for j,y in enumerate(q):r[i+j]+=x*y
    return r

@lru_cache(None)
def nar(n):return tuple(comb(n,k+1)*comb(n,k)//n for k in range(n))

# Tree is (node weight, children); leaf weight >=1; internal weight >=0.
def lift(tree):
    c,ch=tree
    if not ch:G=dict(R);m=1;d=0;shifts=c-1
    else:
        G={(0,0,0):1};m=d=0
        for t in ch:
            Gi,mi,di=lift(t);G=mul(G,Gi);m+=mi;d+=di
        shifts=c
    for _ in range(shifts):
        D=2*(m+d)
        G=mul(R,{a:x for a,x in G.items() if a[2]<=D-d-1});d+=1
    assert all(sum(a)==2*(m+d) for a in G)
    return G,m,d

def sets(tree):
    c,ch=tree
    if not ch:return {(c,)},1
    pts={()};m=0
    for t in ch:
        Q,mi=sets(t);pts={a+b for a in pts for b in Q};m+=mi
    for _ in range(c):
        new=set()
        for a in pts:
            for i in range(m):
                b=list(a);b[i]+=1;new.add(tuple(b))
        pts=new
    return pts,m

def brute(pts):
    out=None
    for q in pts:
        p=[1]
        for n in q:p=unimul(p,nar(n))
        if out is None:out=[0]*len(p)
        for i,x in enumerate(p):out[i]+=x
    return out

def exact_lorentzian_quadratics(G):
    D=sum(next(iter(G)))
    if D<2:return 0
    count=0
    coeff={a:c*factorial(a[0])*factorial(a[1])*factorial(a[2]) for a,c in G.items()}
    for a in range(D-1):
      for b in range(D-1-a):
        gamma=(a,b,D-2-a-b)
        M=[[0]*3 for _ in range(3)]
        for i in range(3):
          for j in range(3):
            alpha=list(gamma);alpha[i]+=1;alpha[j]+=1
            M[i][j]=coeff.get(tuple(alpha),0)
        for i in range(3):
          for j in range(i+1,3):assert M[i][i]*M[j][j]-M[i][j]**2<=0,(gamma,M)
        aa,bb,cc=M[0];dd,ee,ff=M[1];gg,hh,ii=M[2]
        det=aa*(ee*ii-ff*hh)-bb*(dd*ii-ff*gg)+cc*(dd*hh-ee*gg)
        assert det>=0,(gamma,M,det)
        count+=1
    return count

def mconvex(S):
    S=set(S)
    for a in S:
      for b in S:
        for i in range(3):
          if a[i]<=b[i]:continue
          found=False
          for j in range(3):
            if a[j]>=b[j]:continue
            aa=list(a);bb=list(b);aa[i]-=1;aa[j]+=1;bb[i]+=1;bb[j]-=1
            if tuple(aa) in S and tuple(bb) in S:found=True;break
          assert found,(a,b,i)

rng=Random(20261104)
def random_tree(m,budget):
    if m==1:return (budget+1,())
    c=rng.randrange(budget+1);left=rng.randrange(1,m);b=rng.randrange(budget-c+1)
    return (c,(random_tree(left,b),random_tree(m-left,budget-c-b)))

examples=[(1,()),(3,()),(2,((1,()),(1,()))),(1,((1,((2,()),(1,()))),(2,())))]
examples += [random_tree(rng.randrange(1,7),rng.randrange(0,8)) for _ in range(200)]
quadratics=0;maxN=0;maxpts=0
for num,t in enumerate(examples):
    G,m,d=lift(t);D=2*(m+d)
    pts,mm=sets(t);assert mm==m
    b=brute(pts)
    reduced=[G.get((d-i,i,D-d),0) for i in range(d+1)]
    assert b==reduced,(t,b,reduced)
    assert all(reduced[i]**2*comb(d,i-1)*comb(d,i+1)>=reduced[i-1]*reduced[i+1]*comb(d,i)**2 for i in range(1,d))
    quadratics+=exact_lorentzian_quadratics(G)
    if num<30:mconvex(G)
    maxN=max(maxN,m+d);maxpts=max(maxpts,len(pts))
print(json.dumps({'trees_checked':len(examples),'exact_quadratic_hessian_checks':quadratics,'M_convex_support_checks':30,'max_total_coordinate_sum':maxN,'max_lattice_points':maxpts,'all_passed':True},indent=2))

# Further independence check: enumerate ALL positive compositions of N and test
# the subtree lower inequalities. Separately compute ordinary finite Theta.
Rux={(0,0):1,(1,0):1,(1,1):1,(2,1):1}

def theta(p):
    return mul(Rux,{(i-1,j):c for (i,j),c in p.items() if i>0})

def ordinary_expression(tree):
    c,ch=tree
    if not ch:p=dict(Rux);shifts=c-1
    else:
        p={(0,0):1};shifts=c
        for t in ch:p=mul(p,ordinary_expression(t))
    for _ in range(shifts):p=theta(p)
    return p

def constraints(tree,start=0):
    c,ch=tree
    if not ch:return start+1,c,[(start,start+1,c)]
    end=start;N=c;ineq=[]
    for t in ch:
        e,n,ii=constraints(t,end);end=e;N+=n;ineq+=ii
    ineq.append((start,end,N))
    return end,N,ineq

def compositions(N,m):
    if m==1:
        if N>=1:yield (N,)
    else:
        for a in range(1,N-m+2):
            for rest in compositions(N-a,m-1):yield (a,)+rest

counts=[]
for t in examples:
    m,N,ineq=constraints(t)
    Q={q for q in compositions(N,m) if all(sum(q[l:r])>=w for l,r,w in ineq)}
    minkowski,mm=sets(t)
    assert Q==minkowski,(t,Q,minkowski)
    F=brute(Q)
    p=ordinary_expression(t)
    target=[p.get((0,j),0) for j in range(N-m+1)]
    assert target==F,(t,target,F)
    counts.append((comb(N-1,m-1),len(Q)))
print(json.dumps({'all_positive_composition_checks':len(examples),
                  'total_positive_compositions_examined':sum(x for x,y in counts),
                  'max_positive_compositions_in_case':max(x for x,y in counts),
                  'finite_ordinary_Theta_comparisons':len(examples),
                  'all_passed':True},indent=2))

sample=(2,((1,((2,()),(1,()))),(1,((1,()),(0,((2,()),(1,())))))))
m,N,ineq=constraints(sample)
Q=sorted(q for q in compositions(N,m) if all(sum(q[l:r])>=w for l,r,w in ineq))
F=brute(Q);p=ordinary_expression(sample);target=[p.get((0,j),0) for j in range(N-m+1)]
assert F==target
expected={'tree':sample,'m':m,'N':N,'all_positive_compositions_examined':comb(N-1,m-1),
          'subtree_constraints_half_open_zero_based':ineq,'valid_q':Q,
          'lattice_point_count':len(Q),'reduced_Narayana_sum_coefficients':F,
          'ordinary_Theta_constant_u_coefficients':target}
fixture=Path(__file__).with_name('direct_composition_example.json')
assert json.loads(fixture.read_text()) == json.loads(json.dumps(expected))
print('Explicit direct-composition example:',len(Q),'lattice points;',F)

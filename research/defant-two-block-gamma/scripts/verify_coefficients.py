"""Independent exact verification. Standard library only; never imports original code.
Block polynomials obtained by Newton interpolation of factorial values, then
integer Kronecker encoding multiplies bivariate polynomials without carries.
"""
from fractions import Fraction as F
from math import factorial as fac, comb
from functools import lru_cache
from pathlib import Path
import json, hashlib
ROOT=Path(__file__).resolve().parents[1]
@lru_cache(None)
def block(t,k):
    # Return coefficients of t! g_(P+1,t,k), via Newton interpolation.
    deg=t-k
    values=[F(fac(t)*p*fac(p+t-1),fac(k)*fac(p+k)*fac(t-2*k)) for p in range(1,deg+2)]
    coefficients=[F(0)]*(deg+1); basis=[F(1)]
    for j in range(deg+1):
        for i,c in enumerate(basis): coefficients[i]+=values[0]*c
        values=[values[i+1]-values[i] for i in range(len(values)-1)]
        out=[F(0)]*(len(basis)+1)
        for i,c in enumerate(basis):out[i]-=F(j,j+1)*c;out[i+1]+=c/F(j+1)
        basis=out
    assert all(c.denominator==1 and c>=0 for c in coefficients)
    # Extra values are identity sanity checks, not positivity sampling.
    for p in [deg+2,deg+3]:
        assert sum(c*(p-1)**i for i,c in enumerate(coefficients))==F(fac(t)*p*fac(p+t-1),fac(k)*fac(p+k)*fac(t-2*k))
    return tuple(map(int,coefficients))
def run():
    rows=[]; counts={}; triples=0; ordered_triples=0
    for m in range(3,25):
        stride=2*m+1; K=m//2
        for M in range(1,m-1):
            for a in range(1,m-M):
                b=m-M-a
                if a>b:continue
                triples+=1;ordered_triples+=1 if a==b else 2
                G=[{} for _ in range(K+1)]
                for u in range(a,m-b+1):
                    v=m-u
                    for i in range(u//2+1):
                        for j in range(v//2+1):
                            h=G[i+j]; factor=comb(m,u)
                            for r,x in enumerate(block(u,i)):
                                for s,y in enumerate(block(v,j)):
                                    e=r+stride*s;h[e]=h.get(e,0)+factor*x*y
                assert all(h.get(0,0)>0 for h in G)
                # Each product coefficient <= product of sums of nonnegative coefficients.
                bound=max(sum(h.values()) for h in G)**2
                bits=bound.bit_length()+1; mask=(1<<bits)-1
                encoded=[sum(c<<(bits*e) for e,c in h.items()) for h in G]
                for k in range(1,K):
                    left=encoded[k]*encoded[k];right=encoded[k-1]*encoded[k+1]
                    count=0;const=None;e=0
                    while left or right:
                        c=k*(K-k)*(left&mask)-(k+1)*(K-k+1)*(right&mask)
                        assert c>=0,(a,b,M,k,e%stride,e//stride,c)
                        if e==0:const=c
                        count+=c>0;left>>=bits;right>>=bits;e+=1
                    assert const is not None and const>0,(a,b,M,k,'constant')
                    rows.append(dict(a=a,b=b,M=M,k=k,nonzero_coefficients=count,constant=const))
        counts[m]=sum(r['a']+r['b']+r['M']==m for r in rows)
        print('Independent coefficient verification through',m,':',len(rows),'inequalities',flush=True)
    key=lambda r:(r['a']+r['b']+r['M'],r['a'],r['b'],r['k'])
    rows.sort(key=key)
    canonical=lambda rs: json.dumps(rs,sort_keys=True,separators=(',',':')).encode()
    previous=[r for r in rows if r['M']>=4 and r['a']+r['b']+r['M']<=18]
    digests=dict(all_rows_sha256=hashlib.sha256(canonical(rows)).hexdigest(),previous_scope_rows_sha256=hashlib.sha256(canonical(previous)).hexdigest())
    ordered_inequalities=sum(1 if r['a']==r['b'] else 2 for r in rows)
    result=dict(passed=True,method='factorial interpolation and carry-free integer convolution',lo=3,hi=24,minimum_M=1,representative_triples=triples,ordered_triples=ordered_triples,representative_inequalities=len(rows),ordered_inequalities=ordered_inequalities,counts=counts,all_constant_terms_positive=all(r['constant']>0 for r in rows),checked_nonzero_coefficients=sum(r['nonzero_coefficients'] for r in rows),**digests)
    dest=ROOT/'results/coefficients.json';dest.parent.mkdir(exist_ok=True);dest.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
if __name__=='__main__':
    if not __debug__: raise RuntimeError('Run without -O: exact certificate checks use assertions.')
    run()

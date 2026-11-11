"""Exact independent checks of derivative and adjacent-k probability recurrence."""
from fractions import Fraction as F
from pathlib import Path
import json
from math import factorial

def g(p,t,k):
    if t<0 or k<0 or 2*k>t:return F(0)
    if t==0:return F(1)
    z=p
    for h in range(k+1,t):z*=p+h
    return z/(factorial(k)*factorial(t-2*k))
def mu(p,q,m,k):
    full=g(p+q,m,k)
    return [sum((g(p,u,i)*g(q,m-u,k-i) for i in range(k+1)),F(0))/full for u in range(m+1)]
def run():
    deriv=0;rec=0
    for p,q in [(F(1),F(1)),(F(2),F(7)),(F(1,3),F(4,5)),(F(17,4),F(5,2))]:
        D=p+q
        for m in range(0,20):
            for k in range(m//2+1):
                law=mu(p,q,m,k)
                assert sum(law)==1
                assert sum(u*x for u,x in enumerate(law))==m*p/D
                if k==0:continue
                assert k*g(p,m,k)==p/(p+1)*(p+m-1)*g(p+1,m-2,k-1)
                deriv+=1
                left=mu(p+1,q,m-2,k-1);right=mu(p,q+1,m-2,k-1)
                zl=(p+1)*(D+m-1)/(D+1);zr=(q+1)*(D+m-1)/(D+1)
                assert sum((p+u+1)*x for u,x in enumerate(left))==zl
                assert sum((q+m-1-u)*x for u,x in enumerate(right))==zr
                for u in range(m+1):
                    lp=(p+u-1)*left[u-2]/zl if 2<=u<=m else F(0)
                    rp=(q+m-1-u)*right[u]/zr if u<=m-2 else F(0)
                    assert law[u]==p/D*lp+q/D*rp
                    rec+=1
    result=dict(passed=True,derivative_checks=deriv,recurrence_mass_checks=rec,scope='Four positive rational parameter pairs, every m=0..19 and k=0..floor(m/2).')
    (Path(__file__).resolve().parents[1]/'results/recursion.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':
    if not __debug__: raise RuntimeError('Run without -O: exact checks use assertions.')
    run()

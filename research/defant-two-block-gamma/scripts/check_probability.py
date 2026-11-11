"""Independent exact regression checks for the probability reduction.
The all-positive-real derivation is in ../PROBABILITY.md; finite checks are not
substituted for that derivation. Standard library only.
"""
from fractions import Fraction as Q
from math import factorial as f, comb
from pathlib import Path
import json

def g_integer(p,t,k):
    if t==0:return Q(int(k==0))
    if k<0 or 2*k>t:return Q(0)
    return Q(p*f(p+t-1),f(k)*f(p+k)*f(t-2*k))
def rising(d,n):
    out=Q(1)
    for h in range(n):out*=d+h
    return out
def A(d,j):
    return Q(1) if j==0 else d*rising(d+j+1,j-1)/f(j)
def g_real(d,t,k):
    if 2*k>t:return Q(0)
    return A(d,k)*rising(d+2*k,t-2*k)/f(t-2*k)
def gamma_integer(a,b,M,p,q):
    m=a+b+M
    return [sum((g_integer(p,u,i)*g_integer(q,m-u,k-i) for u in range(a,m-b+1) for i in range(k+1)),Q(0)) for k in range(m//2+1)]
def main():
    gamma=gamma_integer(5,8,4,1,1)
    total=[g_integer(2,17,k) for k in range(9)]
    assert gamma==list(map(Q,[5,340,7410,67412,278160,523680,426600,126480,8628]))
    assert total==list(map(Q,[18,1632,42840,445536,2042040,4200768,3675672,1166880,87516]))
    H=[x/y for x,y in zip(gamma,total)]
    assert H[:3]==[Q(5,18),Q(5,24),Q(247,1428)]
    delta=H[1]**2-H[0]*H[2]
    assert delta==Q(-955,205632)
    small_gamma=gamma_integer(1,2,4,1,1)
    small_total=[g_integer(2,7,k) for k in range(4)]
    small_H=[x/y for x,y in zip(small_gamma,small_total)]
    assert small_gamma==[5,55,110,37]
    assert small_total==[8,112,280,112]
    assert small_H==[Q(5,8),Q(55,112),Q(11,28),Q(37,112)]
    small_delta=small_H[1]**2-small_H[0]*small_H[2]
    assert small_delta==Q(-55,12544)
    small_remainders=[k*(3-k)*small_gamma[k]**2-(k+1)*(4-k)*small_gamma[k-1]*small_gamma[k+1] for k in (1,2)]
    assert small_remainders==[2750,11990]
    remainder_checks=0
    for m in range(7,21):
        values=gamma_integer(1,2,m-3,1,1)
        for k,value in enumerate(values):
            normalized=value*f(k+2)*f(k)*f(m-2*k)/f(m-1)
            assert normalized==2*k*k+(4-3*m)*k+2*m*m-4*m
            remainder_checks+=1
    remainder=[small_gamma[k]*f(k+2)*f(k)*f(7-2*k)/f(6) for k in range(4)]
    assert remainder==[70,55,44,37]
    assert remainder[2]**2-remainder[1]*remainder[3]==-99
    checks=0
    for p,q in [(Q(1),Q(1)),(Q(2),Q(3)),(Q(1,2),Q(3,7)),(Q(13,5),Q(9,4))]:
        D=p+q
        for m in range(3,15):
            K=m//2
            for k in range(K+1):
                n=m-2*k
                assert sum(A(p,i)*A(q,k-i) for i in range(k+1))==A(D,k)
                joint={}
                for i in range(k+1):
                    alpha=p+2*i;beta=q+2*k-2*i
                    for r in range(n+1):
                        prob=A(p,i)*A(q,k-i)/A(D,k)*comb(n,r)*rising(alpha,r)*rising(beta,n-r)/rising(D+2*k,n)
                        u=2*i+r
                        weight=g_real(p,u,i)*g_real(q,m-u,k-i)
                        assert prob==weight/g_real(D,m,k)
                        joint[u]=joint.get(u,Q(0))+prob
                        checks+=1
                assert sum(joint.values())==1
                for a in range(1,m):
                    for b in range(1,m-a+1):
                        retention=sum((pr for u,pr in joint.items() if a<=u<=m-b),Q(0))
                        direct=sum((g_real(p,u,i)*g_real(q,m-u,k-i) for u in range(a,m-b+1) for i in range(k+1)),Q(0))
                        assert direct==g_real(D,m,k)*retention
                if 1<=k<K:
                    ratio=g_real(D,m,k)**2/(g_real(D,m,k-1)*g_real(D,m,k+1))
                    formula=Q(k+1,k)*(D+k+1)/(D+k)*Q((n+2)*(n+1),n*(n-1))
                    assert ratio==formula
                    theta=Q(n-1,n+1) if n%2==0 else Q(n,n+2)
                    assert Q((k+1)*(K-k+1),k*(K-k))/ratio==theta*(D+k)/(D+k+1)
    result=dict(passed=True,joint_mass_checks=checks,remainder_formula_checks=remainder_checks,common_factor_remainder=list(map(str,remainder)),remainder_log_concavity_difference="-99",counterexample_gamma=list(map(str,gamma)),counterexample_full=list(map(str,total)),counterexample_H=list(map(str,H)),counterexample_difference=str(delta),small_counterexample=dict(gamma=list(map(str,small_gamma)),full=list(map(str,small_total)),H=list(map(str,small_H)),difference=str(small_delta),gamma_ULC_remainders=list(map(str,small_remainders))))
    (Path(__file__).resolve().parents[1]/'results/probability.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
if __name__=='__main__':
    if not __debug__: raise RuntimeError('Run without -O: exact checks use assertions.')
    main()

from fractions import Fraction as F
from math import log,prod,lcm,sqrt
n=15
B=[F(0)]+[F(2*r,(n+1)*(n+1-r))**2 for r in range(1,n)]
c=[B[i]-B[i-1] for i in range(1,n)]
ratios=[c[i+1]/c[i] for i in range(n-2)]
assert min(ratios)>F(4,3)
# q(u)>=1+u, and minimum (1+u)/u^(2/n) attained at 2/(n-2).
# at least one u=1 so H=(sum w)*prod a >= (1/2)*2*a0^(n-1)
loga0=log(n/(n-2))+(2/n)*log((n-2)/2)
logr=log(n)-(n-1)/2*loga0
logA=-.5*sum(log(x.numerator)-log(x.denominator) for x in c)
upper=n*(logA+logr-log(n))
forced=lcm(*range(2,n+2))
print({'min_ratio':str(min(ratios)),'a0':__import__('math').exp(loga0),'r':__import__('math').exp(logr),'logA':logA,'product_log_bound':upper,'forced_divisor':forced,'prime_log_target':upper-log(forced)})
# independent product minimization: every block partition (2^(d-1) vertices)
d=n-1;rho=F(3,4);K=prod(c)
for mask in range(1<<(d-1)):
 ends=[i+1 for i in range(d-1) if (mask>>i)&1]+[d];a=0;v=[]
 for b in ends:
  length=b-a;z=(B[b]-B[a])/sum((rho**j for j in range(length)),F(0));v += [z*rho**j for j in range(length)];a=b
 assert prod(v)>=K
print('8192 block-partition products checked with exact Fraction arithmetic')

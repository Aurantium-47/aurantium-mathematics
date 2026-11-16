"""Certify logarithmic enclosures using exact rational interval arithmetic."""
from fractions import Fraction as F
from math import prod,gcd,lcm
N=90

def log_unit_bounds(x):
    assert F(1)<=x<=F(2)
    z=(x-1)/(x+1);s=F(0)
    for j in range(N):s+=2*z**(2*j+1)/(2*j+1)
    # 2 sum_{j>=N} z^(2j+1)/(2j+1) <= this geometric majorant
    return s,s+2*z**(2*N+1)/((2*N+1)*(1-z*z))

def scale(iv,a):return (a*iv[0],a*iv[1]) if a>=0 else (a*iv[1],a*iv[0])
def add(*ivs):return tuple(sum((p[i] for p in ivs),F(0)) for i in [0,1])
def log_bounds(x):
    x=F(x);assert x>0;e=0
    while x<1:x*=2;e-=1
    while x>2:x/=2;e+=1
    return add(log_unit_bounds(x),scale(log_unit_bounds(F(2)),e))

def enclosure(name,iv,low,high):
    assert F(low)<iv[0]<=iv[1]<F(high)
    print(name+': ('+low+', '+high+') certified')

B=[F(0)]+[F(2*i,16*(16-i))**2 for i in range(1,15)]
c=[B[i]-B[i-1] for i in range(1,15)]
r=[c[i+1]/c[i] for i in range(13)]
assert min(r)==F(3751,2349)>F(4,3)
print('c:',','.join(map(str,c)));print('ratios:',','.join(map(str,r)))
K=prod(c);print('K =',K)
L=add(scale(log_bounds(K),F(-15,2)),scale(log_bounds(F(15,13)),-105),scale(log_bounds(F(13,2)),-14))
old=add(scale(log_bounds(120),210),scale(log_bounds(15),-15))
base=lcm(*range(2,17));assert base==720720 and gcd(base,31)==1
new_no31=add(L,scale(log_bounds(base),-1))
new_with31=add(new_no31,scale(log_bounds(31),-1))
old_with31=add(old,scale(log_bounds(base*31),-1))
enclosure('new product log bound',L,'506.81695423653393557689','506.81695423653393557690')
enclosure('new prime target without p31',new_no31,'493.32894824520861399661','493.32894824520861399662')
enclosure('new prime target WITH separately proven p31',new_with31,'489.89496104072346775068','489.89496104072346775070')
enclosure('old product bound',old,'964.7525129676','964.7525129678')
enclosure('old target WITH separately proven p31',old_with31,'947.8305197718','947.8305197720')

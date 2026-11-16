from fractions import Fraction as Q
from math import prod
# Closed-form differences, independently algebraically simplified.
c=[Q(17*i-i*i-8,2*(16-i)**2*(17-i)**2) for i in range(1,15)]
K=prod(c);assert K==Q(233570089,12695029890685690413859209216000000000000)
assert all(3*c[i+1]>4*c[i] for i in range(13))
def factors(x):
 d=2;r={}
 while d*d<=x:
  while x%d==0:r[d]=r.get(d,0)+1;x//=d
  d+=1
 if x>1:r[x]=r.get(x,0)+1
 return r
coeff={}
def addlog(x,a):
 x=Q(x)
 for n,sign in [(x.numerator,1),(x.denominator,-1)]:
  for p,e in factors(n).items():coeff[p]=coeff.get(p,Q(0))+a*e*sign
addlog(K,Q(-15,2));addlog(Q(15,13),-105);addlog(Q(13,2),-14)
# Direct atanh expansion on prime arguments, no range reduction or original helper.
lo=Q(0);hi=Q(0)
for p,a in coeff.items():
 z=Q(p-1,p+1);z2=z*z;term=z;s=Q(0);N=600
 for j in range(N):s+=2*term/(2*j+1);term*=z2
 upper=s+2*term/((2*N+1)*(1-z2))
 lo+=a*(s if a>=0 else upper);hi+=a*(upper if a>=0 else s)
assert Q('506.81695423653393557689')<lo<=hi<Q('506.81695423653393557690')
print('Independent closed-form c_i and prime-log rational enclosure agree.')
print('prime log coefficients',coeff)

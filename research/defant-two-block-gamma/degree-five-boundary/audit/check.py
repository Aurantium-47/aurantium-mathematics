import sympy as s
q,t,z=s.symbols('q t z', real=True)
def g(d,n,k):
 if n<2*k:return s.Integer(0)
 return s.prod(d+h for h in range(k+1,n))*d/s.factorial(k)/s.factorial(n-2*k)
def G(d,n):return sum(g(d,n,k)*z**k for k in range(n//2+1))
rows=[s.Poly(s.expand(G(s.Integer(1),u)*G(q,5-u)),z) for u in range(1,5)]
pts=[]
for r in rows:
 a,b,c=[r.nth(j) for j in range(3)];pts.append((s.factor(a/b),s.factor(c/b)))
print('rows', [r.as_expr() for r in rows]);print('points',pts)
for i in range(4):
 x,y=pts[i];print('endpoint',i+1,s.factor(s.Rational(1,4)-x*y))
 for j in range(i+1,4):
  X,Y=pts[j]; f=s.factor((X+t*(x-X))*(Y+t*(y-Y)))
  a=s.factor(s.diff(f,t,2)/2);b=s.factor(s.diff(f,t).subs(t,0))
  v=s.factor(-b/(2*a));dv=s.factor(s.Rational(1,4)-f.subs(t,v))
  print(i+1,j+1,'a=',a,'t=',v,'1-t=',s.factor(1-v),'D=',dv)
print('counterexample',s.expand((15*rows[0].as_expr()+1232*rows[3].as_expr()).subs(q,30)))
def require(condition, label):
 if not condition: raise ArithmeticError(label)
expected=[((q+1)/12,1/(q+2)),((q+1)/(q+7),6/(q+7)),((q+1)/(3*q+5),6/(3*q+5)),(s.Rational(1,6),s.Rational(1,3))]
for i,(got,want) in enumerate(zip(pts,expected)):
 for j in range(2):require(s.cancel(got[j]-want[j])==0,('point',i,j))
expected_D={
 (0,1):(q-10)*(2*q+5)/(20*(q-5)*(q+2)),
 (0,2):(2*q+7)*(3*q*q-3*q-14)/(4*(q+2)*(3*q-7)*(3*q+7)),
 (0,3):(-q*q+28*q+56)/(144*(q+2)),
 (1,2):s.Rational(1,4),
 (1,3):3*(q*q-16*q+1)/(4*(q-11)*(5*q-1)),
 (2,3):7*(q*q-4*q-3)/(4*(3*q-13)*(3*q+1))}
for (i,j),want in expected_D.items():
 x,y=pts[i];X,Y=pts[j];f=(X+t*(x-X))*(Y+t*(y-Y));v=s.solve(s.diff(f,t),t)[0]
 require(s.cancel(s.Rational(1,4)-f.subs(t,v)-want)==0,('stationary defect',i,j))
require(s.expand((15*rows[0].as_expr()+1232*rows[3].as_expr()).subs(q,30)-4785*(136+96*z+17*z*z))==0,'counterexample')
require(96**2-4*136*17==-32,'defect')
require(s.simplify((-q*q+28*q+56).subs(q,14+6*s.sqrt(7)))==0,'threshold root')
print('PASS: exact points, six stationary defects, threshold and counterexample')

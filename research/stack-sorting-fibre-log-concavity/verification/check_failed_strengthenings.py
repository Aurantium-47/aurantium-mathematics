"""Exact, reproducible obstructions to two proposed RR proof closures.
These are NOT counterexamples to Defant's conjecture.
Run: python verification/check_failed_strengthenings.py
"""
from math import comb
import sympy as s
x, z1, z2, z3 = s.symbols('x z1 z2 z3')

def N(n):
    return sum(s.Rational(comb(n,k)*comb(n,k-1), n)*x**k for k in range(1,n+1))

def H(n):
    return sum(s.Integer(comb(n,2*j)*comb(2*j,j)//(j+1))*x**j for j in range(n//2+1))

# Exact laminar polytope: singleton weights1, {1,2} weight1, [3] weight2.
# Set q=r+(1,1,1). Then |r|=3 and r1+r2>=1.
normalized_shifted = 0
normalized_q_divided_monomial = 0
fertility = 0
for a in range(4):
    for b in range(4-a):
        c = 3-a-b
        if a+b < 1:
            continue
        monomial=z1**a*z2**b*z3**c
        normalized_shifted += monomial/(s.factorial(a)*s.factorial(b)*s.factorial(c))
        normalized_q_divided_monomial += monomial/(s.factorial(a+1)*s.factorial(b+1)*s.factorial(c+1))
        fertility += N(a+1)*N(b+1)*N(c+1)
assert s.expand(6*normalized_shifted-((z1+z2+z3)**3-z3**3)) == 0
restriction1=s.factor(normalized_shifted.subs({z2:0,z3:1}))
restriction2=s.factor(normalized_q_divided_monomial.subs({z2:0,z3:1}))
assert restriction1 == z1*(z1**2+3*z1+3)/6
assert restriction2 == z1*(z1**2+2*z1+2)/24
assert s.discriminant(z1**2+3*z1+3,z1) == -3
assert s.discriminant(z1**2+2*z1+2,z1) == -4
assert s.expand(fertility-3*x**3*(x+1)*(x+3)*(3*x+1)) == 0
print('Normalized shifted-support restriction:',restriction1)
print('Normalized q-support restriction after removing monomial:',restriction2)
print('Original fertility polynomial remains RR:',s.factor(fertility))

# A_k=alpha_k*N_(k+1) is an infinite consecutive-interlacing sequence,
# since every alpha is positive. A Cauchy coefficient nevertheless is not RR.
# alpha0=1, alpha16=1/2, alpha8=10, other alpha=1/100.
gamma=s.Poly(10000*H(16)+1000000*H(8)**2+
    sum(H(k)*H(16-k) for k in range(1,16) if k!=8),x)
assert gamma.degree() == 8
assert s.gcd(gamma,gamma.diff()).degree() == 0
assert gamma.count_roots(-s.oo,s.oo) == 6
assert gamma.count_roots(-s.oo,0) == 6
print('Cauchy-square obstruction gamma:',gamma.as_expr())
print('Exact Sturm: degree8, six real roots, two nonreal roots; gcd with derivative1.')

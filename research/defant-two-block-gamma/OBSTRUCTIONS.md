# Obstruction to extending the concave-remainder proof

Factoring the coefficients into a reciprocal-factorial base and a remainder Q(k) suggests proving log-concavity of Q. The following exact example shows that this sufficient condition does not hold throughout the family. The [probability reduction](PROBABILITY.md) gives a separate failure of ordinary log-concavity for the retention probabilities in the same example.

Take a=1,b=2,p=q=1, and m=M+3≥7. The u-range is 1,...,m-2. Thus, using G_{1,1}=1,

Γ(y)=G_{2,m}(y)-2G_{1,m}(y)-G_{1,m-1}(y).

Common-denominator multiplication gives

γ_k = (m-1)! Q_m(k)/[(k+2)! k! (m-2k)!],

where

Q_m(x)=2x²+(4-3m)x+2m²-4m.

The formula remains valid at the top degree: if m is even, the coefficient from G_{1,m-1} is zero, matching its factor m-2k=0 in the common-denominator calculation.

The remainder Q_m is strictly convex, since Q_m''=4. More decisively, take m=7, so M=4 and K=3. Then

(Q_7(0),Q_7(1),Q_7(2),Q_7(3))=(70,55,44,37),

Q_7(2)²-Q_7(1)Q_7(3)=1936-2035=-99<0.

Thus a positive log-concave remainder cannot be asserted even for this smallest next-boundary example. This is not a counterexample to gamma-ULC: the reciprocal-factorial base contributes additional curvature and can compensate. It rules out the direct extension of that particular sufficient criterion.

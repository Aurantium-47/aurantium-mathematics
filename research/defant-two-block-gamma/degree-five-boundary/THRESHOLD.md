# Exact weighted-mixture boundary at the first nontrivial odd degree

Fix total size m=5, first dimension p=1 and real q>=1. Let
G_(d,n)(z)=sum_k d prod_{h=k+1}^{n-1}(d+h)/(k!(n-2k)!) z^k
and R_u=G_(1,u)G_(q,5-u), u=1,2,3,4.
Then EVERY nonzero nonnegative real mixture of these four legal rows is
ULC of order 2 if and only if q <= 14+6 sqrt(7).
This concerns arbitrary weights, not the original unweighted interval conjecture.

## Proof
Normalize each row by its positive coefficient of z. Its constant and
quadratic coefficients give the points
A=((q+1)/12,1/(q+2)), B=((q+1)/(q+7),6/(q+7)),
C=((q+1)/(3q+5),6/(3q+5)), D=(1/6,1/3).
Every mixture normalizes to a convex combination of these points and conversely.
ULC(2) is exactly xy<=1/4. The maximum of xy on this convex hull occurs
on its boundary: its gradient (y,x) is nonzero in the positive quadrant.
Each boundary segment joins vertices from the four points, so it suffices
to check all six pair segments (including endpoints).

Endpoint gaps 1/4-xy are respectively
(2q+5)/(12(q+2)), (q-5)^2/(4(q+7)^2),
(3q+1)^2/(4(3q+5)^2), 7/36, all nonnegative.
For a pair E,F parametrize by t E+(1-t)F, 0<=t<=1.
A convex or linear quadratic xy has its maximum at endpoints. At a
concave quadratic an interior stationary point is the only extra check.

AB: concave only for q>5. Its stationary t is
3(q^2-13q-20)/(5(q-5)(q+1)). If t>0 then q>10, and its gap is
(q-10)(2q+5)/(20(q-5)(q+2))>0.

AC: concave only for q>7/3. Its stationary t is
3(3q^2-7q-28)/((3q-7)(3q+7)). If t>0 then
3q^2-3q-14=(3q^2-7q-28)+4q+14>0; its gap is
(2q+7)(3q^2-3q-14)/(4(q+2)(3q-7)(3q+7))>0.

BC: convex for all q>=1.

BD: concave only for q>11. Its stationary t is
(q+7)(2q+5)/((q-11)(5q-1)). If t<1 then
3q^2-75q-24>0, which implies q>25. Its gap is
3(q^2-16q+1)/(4(q-11)(5q-1))>0.

CD: concave only for q>13/3. Its stationary t is
7(3q+5)/((3q-13)(3q+1)). If t<1 then
9q^2-57q-48>0, which implies q>7. Its gap is
7(q^2-4q-3)/(4(3q-13)(3q+1))>0.

AD: for q=1 this segment is a point. For q>1 it is concave,
with stationary t=q/(2(q-1)), which is interior exactly for q>2.
Its gap is (-q^2+28q+56)/(144(q+2)). This is nonnegative
exactly when q<=14+6sqrt(7) in the range q>2.
This proves both directions, including equality at the threshold.

## Small exact witness
For q=30, the coefficient vectors of R_1 and R_4 are
(40920,15840,495) and (30,180,60).
15 R_1+1232 R_4=4785(136+96z+17z^2).
The normalized quadratic has b^2-4ac=96^2-4*136*17=-32.
Thus the dimension-free arbitrary-weight extension fails already at m=5,
with both block sizes positive; no endpoint row of size zero is used.

## Novelty and scope
Existing project materials already contain a sharp diagonal-dimension
first-index threshold and a much larger m=222 counterexample. This
classification is a small unequal-dimension boundary result, not a solution
to the original interval-sum conjecture and not a major separate project.

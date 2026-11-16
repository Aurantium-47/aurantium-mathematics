# Independent audit of the degree-five asymmetric mixture threshold

Status: PASS, 2026-11-16. This is an independent AI-assisted algebra audit, not human peer review.

## Statement checked

For q >= 1, m=5, p=1, and the four interior rows R_u=G_(1,u)G_(q,5-u), 1<=u<=4, every nonzero nonnegative real mixture is ULC(2) if and only if q <= 14+6 sqrt(7).

The g coefficients were reconstructed directly from their product definition in `check.py`; the four normalized points are exactly

1. ((q+1)/12, 1/(q+2));
2. ((q+1)/(q+7), 6/(q+7));
3. ((q+1)/(3q+5), 6/(3q+5));
4. (1/6, 1/3).

Every row's middle coefficient is positive. Thus the middle-normalized coefficients (a/b,c/b) of all mixtures form exactly the convex hull of these points. ULC(2) is xy <= 1/4. In a two-dimensional hull, xy has no interior maximum because its gradient (y,x) is nonzero; in lower-dimensional hulls all points lie on pair segments. It therefore suffices to check every pair segment.

## Pair checks, all real q >= 1

Write each segment using weight t on its first point and 1-t on its second. Convex or affine quadratics have their maximum at an endpoint. All endpoints obey xy<=1/4; endpoint 2 has equality at q=5.

For the concave cases, only a stationary point with 0<=t<=1 requires checking.

- Pair 1,2: concavity requires q>5. Feasibility t>=0 gives q^2-13q-20>=0, so q>13. The stationary defect is (q-10)(2q+5)/(20(q-5)(q+2)), strictly positive.
- Pair 1,3: concavity requires q>7/3. Feasibility t>=0 gives A=3q^2-7q-28>=0. The stationary defect is (2q+7)(3q^2-3q-14)/(4(q+2)(3q-7)(3q+7)); its nontrivial factor equals A+4q+14>0.
- Pair 2,3: always convex, including its affine degeneration at q=1.
- Pair 2,4: concavity requires q>11. Feasibility t<=1 gives A=q^2-25q-8>=0. The stationary defect is 3(q^2-16q+1)/(4(q-11)(5q-1)); its numerator factor equals A+9q+9>0.
- Pair 3,4: concavity requires q>13/3. Feasibility t<=1 gives A=3q^2-19q-16>=0. The stationary defect is 7(q^2-4q-3)/(4(3q-13)(3q+1)); three times the numerator factor equals A+7q+7>0.
- Pair 1,4: at q=1 both points coincide; for 1<q<=2 the stationary point t=q/(2(q-1)) is at or beyond the endpoint. For q>2 it is interior, and the stationary defect is (-q^2+28q+56)/(144(q+2)). This is nonnegative exactly up to q=14+6sqrt(7), and negative above it.

Zero second derivatives at q=5, 7/3, 11, and 13/3 are handled by the affine/endpoints case, so no forbidden division is needed.

## Explicit counterexample

At q=30,

15 R_1 + 1232 R_4 = 650760 + 459360 z + 81345 z^2
                 = 4785 (136 + 96 z + 17 z^2).

The primitive polynomial has defect 96^2 - 4*136*17 = -32. The middle-normalized segment weight is exactly 15/29, the stationary point. This is a weighted sparse mixture, not an unweighted contiguous interval, and does not refute the original interval conjecture.

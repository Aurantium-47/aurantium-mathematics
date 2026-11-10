# A compact exact certificate for the single-fibre witnesses

Exact certificate, 10 November 2026. The construction and its single-fibre correspondence are established in [PROOF.md](PROOF.md).

## 1. Structural coefficient formula

Write C_n(x)=N_n(x)/x, h=1+x, y=x/h², and

M_r(y)=Σ_{k=0}^{floor(r/2)} binom(r,2k) Catalan_k y^k.

The Narayana identity is C_n(x)=h^(n−1) M_(n−1)(y). Its coefficient form follows by expanding h and using the binomial Narayana formula. Also H(t)=Σ_{r≥0}M_r(y)t^r satisfies H=1+tH+yt²H².

For P=(1^d,b^l)+aΔ_[d]+qΔ_[d+l], put m=a+q and S=l(b−1)+m. Its distinct lattice points are precisely base+r, where r≥0, Σr=m, and Σ_(j≤d)r_j≥a. Thus

Σ_{v∈P∩Z^(d+l)} ∏_j N_(v_j)(x) = x^(d+l) h^S G(y),

G(y)=Σ_(i=a)^m L_(d,i)(y) R_(l,b,m−i)(y),

L_(d,i)(y)=Σ_(k=0)^floor(i/2) [d(d+i−1)! / (k!(i−2k)!(d+k)!)] y^k,

R_(l,b,j)(y)=[t^j](Σ_(r=0)^q M_(b+r−1)(y)t^r)^l.

The L formula follows directly from Lagrange inversion applied to tH=t(1+tH+y(tH)²). Only q+1 small polynomials enter R. Unlike a decomposition count, this counts each coordinate increment vector exactly once. The formula works for arbitrary positive d,l,b,a,q.

For the length-111 parameters (d,l,b,a,q)=(34,7,4,4,5), the polynomials used for R, in ascending r=0,...,5, are

1+3y;
1+6y+2y²;
1+10y+10y²;
1+15y+30y²+5y³;
1+21y+70y²+35y³;
1+28y+140y²+140y³+14y⁴.

The resulting G is printed by compact/check_compact.py. It obeys the exact identity

G(y)=17(1+3y)² y¹² F(−1/y),

where

F(z)=120395891z¹²−2559916854z¹¹+22674999303z¹⁰−108092050131z⁹+299109879326z⁸−484616523267z⁷+446781321424z⁶−225403055871z⁵+59144737218z⁴−7457159829z³+393450176z²−6817524z+24864.

This recovers exactly the normalized polynomial 17h²(x²+5x+1)²x¹²F(−h²/x). The explicit permutation construction identifies it with a single fibre: start at (1), perform J(τ,(1)) 33 times, append four maxima, perform J(τ,(1,2,3,4)) seven times, and append five maxima. Here J shifts τ by the length of its second argument, concatenates that argument, then appends the new maximum. The accompanying construction gives the Defant theorem references supporting the product and append operations.

## 2. Three evaluations replace the discriminant

If a real polynomial f has only real roots, then at every real t not a root,

f′(t)²−f(t)f″(t)=f(t)² Σ_ρ multiplicity(ρ)/(t−ρ)² ≥ 0.

For the displayed F, Horner evaluation at t=39/10 gives exactly

F(t)=−663850539870227549949/1000000000000 < −600000000,

F′(t)=107345642219377714731/12500000000, with 0<F′(t)<10000000000,

F″(t)=−842802211071079992197/2500000000 < −300000000000.

Consequently F′(t)²−F(t)F″(t) < 10²⁰−(6×10⁸)(3×10¹¹)=−8×10¹⁹<0. Hence F has a nonreal root.

For any such root z, every solution of (1+x)²+zx=0 is nonzero and nonreal: real nonzero x would force z=−(1+x)²/x to be real. These solutions are roots of x¹²F(−h²/x), hence of the original fibre polynomial. This proves failure of real-rootedness with one elementary inequality; no discriminant, numerical root approximation, or Sturm sequence is needed.

## 3. The independently constructed length-112 witness

The same gamma formula with (d,l,b,a,q)=(30,9,4,3,5) gives

G(y)=−9(1+3y)⁴ y¹¹ F_112(−1/y),

with F_112 explicitly displayed in [PROOF.md](PROOF.md). At t=407/100,

F_112(t)=−280821602547295555471172009/100000000000000000000 < −2000000,

F_112′(t)=−12998988234534515197862333/200000000000000000, with −100000000<F_112′(t)<0,

F_112″(t)=−47039033934223699514455399/1000000000000000 < −40000000000.

Therefore F_112′(t)²−F_112(t)F_112″(t)<10¹⁶−(2×10⁶)(4×10¹⁰)=−7×10¹⁶<0. It too is not real-rooted. This does not rely on appending a maximum preserving nonreal roots.

## 4. Exact checks and scope

compact/check_compact.py uses only Python's standard library. It independently constructs the gamma sum using the closed-form Lagrange coefficients, expands back to x, compares every coefficient with the original-coordinate Narayana sum for both lengths, and verifies the rational evaluations and bounding inequalities. source/verify_stdlib.py was also rerun successfully; it checks the original-coordinate sum, factorization, negative discriminant, lattice count, and permutation for both witnesses.

The Laguerre certificate establishes the existence of nonreal roots. The supplementary Sturm checks count exactly four nonreal roots of each fibre polynomial.

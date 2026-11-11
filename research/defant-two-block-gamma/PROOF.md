# Finite-degree gamma-ULC theorem

## Statement

Let a,b≥1 and M≥1 be integers, m=a+b+M≤24, and K=⌊m/2⌋. For every real p,q≥1, define Γ as in [README.md](README.md). Every Γ_k, 0≤k≤K, is positive. At every interior index 1≤k<K,

k(K−k)Γ_k² − (k+1)(K−k+1)Γ_(k−1)Γ_(k+1) > 0.

Thus Γ belongs to ULC(K). If K=1, there is no interior inequality. The theorem is universal in p,q within this finite total-degree range.

## 1. Polynomial normalization

For positive integer d, cancellation in the factorial expression gives

g_(d,t,k) = d(d+t−1)! / [k!(d+k)!(t−2k)!]
           = d ∏_(h=k+1)^(t−1)(d+h) / [k!(t−2k)!].

The product expression defines the same polynomial in d for real parameters. Its degree is t−k. Set P=p−1 and Q=q−1. Each block has nonnegative rational coefficients in its corresponding shifted parameter.

Use the common scale m!, independent of k:

G_k(P,Q)=m!Γ_k(P+1,Q+1).

Every G_k has integer coefficients. For u+v=m, the denominator i!(u−2i)!j!(v−2j)! divides m!: the four factorial arguments sum to m−i−j, so the corresponding multinomial coefficient, with an additional part i+j, proves divisibility.

## 2. Exact coefficient criterion

Define

H_k(P,Q)=k(K−k)G_k²−(k+1)(K−k+1)G_(k−1)G_(k+1).

The factors follow by clearing binomial denominators in the log-concavity inequality for Γ_k/binom(K,k). The common scale multiplies the original remainder by (m!)², preserving its sign.

The executable certificate verifies that every coefficient of H_k is nonnegative and its constant term is positive. Hence H_k(P,Q)>0 throughout P,Q≥0, including the boundary P=Q=0. It also verifies positive constant terms for all G_k. This establishes the statement for all real p,q≥1 without sampling their values for positivity.

## 3. Independent construction and multiplication

`scripts/verify_coefficients.py` reconstructs the degree-(t−k) polynomial t!g_(P+1,t,k) by exact Newton interpolation from the factorial expression at t−k+1 distinct integer values of p. Its known degree makes this an exact polynomial reconstruction. Two additional values check consistency. Positivity is then checked on the reconstructed coefficients, not inferred from the interpolation values.

Multiplication by binom(m,u) converts the two block scales u! and v! to m!. To multiply bivariate polynomials, the script encodes P^rQ^s at position r+(2m+1)s in a large integer. In a product the P-degree is at most 2m, so positions cannot alias. Each digit base exceeds the square of the largest coefficient sum of the G_k. That bounds every coefficient in each product, so no carries cross digit boundaries. The two products are decoded separately before applying the positive and negative ULC factors.

`scripts/verify_direct.py` provides a second implementation: it constructs the block product factors directly and multiplies sparse bivariate polynomials with nested integer loops. It independently checks all 1,568 inequalities with M≥4 and m≤18; its complete row-summary digest agrees with the corresponding part of the m≤24 calculation.

## 4. Exhaustive parameter range

The verifier enumerates every m=3,…,24, every M=1,…,m−2, and every a,b≥1 with a+b=m−M and a≤b. It checks every 1≤k<⌊m/2⌋. For a>b,

Γ_(a,b,M)(p,q)=Γ_(b,a,M)(q,p),

so swapping both parameter pairs covers the remaining cases and preserves coefficient nonnegativity.

The completed exact computation covers 1,078 representative triples and 8,712 representative inequalities, equivalent to 2,024 ordered triples and 16,478 ordered inequalities. There are 3,551,042 positive monomial coefficients in the representative remainders; all remaining coefficients are zero. Every remainder constant is positive. Per-degree counts and deterministic row digests appear in [results/coefficients.json](results/coefficients.json).

These finite exact checks complete the stated computer-assisted proof. They give no automatic extension to m≥25 or to real-rootedness. The M=0 product case is not part of this coefficient calculation.

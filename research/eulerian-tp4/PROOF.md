# Eulerian TP4: reconstruction and audit of Mao's announced finite certificate

Status: proof reconstruction with a second, independently implemented algebraic audit, 2026-11-16. This does not claim priority for TP4 or a solution of the all-orders conjecture. Mao, arXiv:2608.29224v1 (2026-08-29), Remark 1.2 already announces an AI-assisted TP4 candidate with 126 local minors. Our computation independently reconstructs exactly 126 nonzero local polynomials and supplies six short Muirhead certificates. The argument below depends on the standard real-rootedness of Eulerian polynomials and Mao's lower-triangular contiguous-minor criterion (Theorem 2.5).

## Reduction, valid for all row indices
Let f=A_n=prod_i(1+r_i x), r_i>0. Set f_I=f/prod_{i in I}(1+r_i x), c_I=prod_{i in I}(1+r_i), G_j=sum_{|I|=j} c_I f_I. Then (1-x)G'_j=(j+1)G_{j+1}-(n-j)G_j. Define p_{0,0}=1 and other p_{0,j}=0. Under the Eulerian row recurrence, a contribution p G_j in row n+s becomes

[(1+(s+j+1)x)p+x(1-x)p']G_j+(j+1)xp G_{j+1}.

Thus A_{n+s}=sum_{j=0}^s p_{s,j}G_j, with the following rows of p:

- s=0: [1]
- s=1: [1+x, x]
- s=2: [1+4x+x², 3x+3x², 2x²]
- s=3: [1+11x+11x²+x³, 7x+22x²+7x³, 12x²+12x³, 6x³].

For a four-element column set K, expand the determinant of the coefficients of these four row polynomials by multilinearity in rows 1,2,3. Index the choices by I_1,I_2,I_3 with |I_s|≤s. Group them by U=I_1∪I_2∪I_3; |U|≤6. Write g_J=prod_{i in J}(1+r_i x). Each local tuple has rows

(g_U, p_{1,|I_1|}g_{U\I_1}, p_{2,|I_2|}g_{U\I_2}, p_{3,|I_3|}g_{U\I_3}).

Factor f_U from every row, and apply the coefficient Toeplitz Cauchy–Binet formula. Also factor c_U from the scalar product c_{I_1}c_{I_2}c_{I_3}. The remaining scalar is prod_{i in U}(1+r_i)^{m_i-1}, where m_i is the number of selected I_s containing i. Therefore the original determinant is

sum_{|U|≤6} c_U sum_{|L|=4} Q_{|U|,L}(r_U) det T_{f_U}(L,K),

Here Q_{u,L} is the sum over all triples (I_1,I_2,I_3) of subsets of [u] with |I_s|≤s and union [u], of the coefficient determinant on L of the four displayed local rows, multiplied by prod_{i=1}^u (1+r_i)^{m_i-1}. This is the finite sum implemented in local.py. There is no dependence on n in Q. Each local row degree is ≤6: row 0 has degree u≤6, and row s≥1 has degree at most s+u−|I_s|≤s+sum_{t≠s}t=6; columns outside 0,…,6 vanish. The case U=empty has degree≤3.

All T_{f_U} are totally nonnegative, since f_U is a product of positive linear factors. It remains to show every Q≥0 for arbitrary positive r_U.

## Finite exact positivity proof
All Q are symmetric under permuting U. The exact expansion has nonzero counts 1,3,9,19,25,34,35 for u=0,…,6: total126. Of these,120 have nonnegative integer monomial coefficients. Six have a single negative monomial-symmetric orbit.

Let M_λ denote the average of the distinct monomials with exponent multiset λ. Muirhead gives M_λ≥M_μ when λ majorizes μ. In each exceptional polynomial, remove the following indicated combination; the rest has nonnegative coefficients:

|u|L|Combination|
|--|--|--|
|4|1234|8208 M_(2,1,1,0) − 984 M_(1,1,1,1)|
|4|2345|72 M_(3,3,2,0) − 72 M_(3,3,1,1)|
|5|1234|17640 M_(2,1,1,0,0) − 1440 M_(1,1,1,1,0)|
|5|1235|720 M_(3,1,1,0,0) − 720 M_(1,1,1,1,1)|
|5|1345|360 M_(3,2,2,0,0) − 240 M_(3,1,1,1,1)|
|5|2345|1800 M_(3,2,2,1,0) − 600 M_(3,2,1,1,1)|

In every row, left exponent majorizes right and the positive multiplier is at least the negative multiplier. Hence every combination and every Q is nonnegative. certificate.py verifies the identities, full permutation symmetry, majorization, orbit counts and coefficient signs exactly; it uses explicit runtime requirements rather than assert for its acceptance conditions.

## Strictness and TP4
For U=empty, L={0,1,2,3}, Q=1. For consecutive K={k,k+1,k+2,k+3}, the corresponding Toeplitz minor of A_n equals the Schur polynomial s_(4^k)(r_1,…,r_n), positive for 0≤k≤n, including k=0. Thus every admissible consecutive four-by-four minor is strictly positive. Combined with the proved TP3 result and the contiguous-minor criterion, all admissible minors of order≤4 are strictly positive.

## Boundaries and zero minors
For n<6 only subsets U contained in [n] occur; the universal list simply contains unused cases. Set G_j=0 for j>n. For n=0, f=1 and only U=empty survives; the admissible consecutive 4×4 block starts at k=0 and has determinant 1. For any n, k=0 gives the empty Schur shape with value 1, while k=n gives a positive rectangular Schur polynomial. If a chosen minor is not admissible (some sorted column exceeds the corresponding sorted row), it vanishes by lower triangularity, as in Mao's Lemma 2.1. Theorem 2.5 is applied separately to every finite leading principal truncation; each finite minor is contained in one. Muirhead applies because root parameters are positive, the two exponent vectors in each pair have the same total degree and length, and normalized permutation averages are used.

## Audit record and attribution
This is a finite symbolic certificate for arbitrary n, not an inference from finite numerical samples. audit_independent.py independently uses the 24-term Leibniz formula, rather than the exterior-product implementation in local.py. It recalculates all 245 candidate polynomials and matches every coefficient, including the 119 zero cases. It also checks symmetry and the six majorization certificates, with a second sorted-variable positivity check.

This is an internal AI-assisted proof audit, not human peer review or a proof-assistant formalization. Mao's Remark 1.2 already announces the TP4 route and count 126, and the real-root reduction and consecutive-minor criterion are his paper's framework. Our contribution is a reproducible reconstruction and six short positivity certificates. We did not obtain Mao's original computation files. The checked HTML v1 provides no link to those TP4 files; targeted web searches did not locate them. This does not establish that they are unavailable elsewhere. No claim is made about TP5.

Source: https://arxiv.org/html/2608.29224v1 (Remark 1.2, Theorem 2.5, Lemma 2.6).

# Independent AI-assisted mathematical review of the fibre log-concavity argument

Reviewed 4 November 2026 by an independent AI review pass. This is not external human peer review. The argument and primary sources were reconstructed without relying on the other supplied audit reports or their code.

## Verdict

I found no fatal mathematical gap. Under the explicit hypotheses in the mechanism (nonempty laminar simplex Minkowski sum, positive integral singleton weights, nonnegative integral other weights), the argument proves ultra-log-concavity of the degree `d = Q - m` polynomial obtained after dividing the Narayana lattice sum by `x^m`. Defant's results then give exactly the claimed fixed-fibre conclusion for `n >= 1`. This does not prove real-rootedness.

This review initially examined a proof outline. The reconstructions below supply the precise subtree feasibility lemma, the exact degree invariant, and explicit treatment of positive coefficients and endpoint cases. These details are incorporated in the accompanying full proof draft. None requires a new conjecture or stronger closure property.

Literature searches found no earlier general fibre log-concavity proof, but do not establish priority or certify that the problem is still open everywhere. The original question and its open status in the 2023 paper are directly verified.

## Exact primary-source checks

1. Defant, *Stack-Sorting Preimages of Permutation Classes*, SLC 82 (2020), Article B82b, printed p. 37, Conjecture 31, asks for real-rootedness of the fixed-fibre descent counts. The paragraph immediately after it explicitly raises general log-concavity as a weaker question. The defining statistic is the number of preimages having a specified number of descents. Source: https://www.mat.univie.ac.at/~slc/wpapers/s82defant.pdf

2. Defant, *Fertilitopes*, arXiv:2102.11836v2, Section 3: Theorem 3.1 identifies valid compositions with all lattice points of the fertilitope; Theorem 3.2 identifies nonempty fertilitopes with integral binary nestohedra. The displayed formula following these theorems is precisely the Narayana-product formula used here. Section 1 explicitly says the associated log-concavity is unknown. Section 2.6 defines the binary building sets as laminar interval families containing the singletons. Corollary 2.11 proves integrality of the weights. Sources: https://arxiv.org/html/2102.11836v2 and https://link.springer.com/article/10.1007/s00454-023-00488-y

3. Ross, Süss, Wannerer, *Dually Lorentzian Polynomials*: both arXiv:2304.08399v3, printed p. 5, and the 2025 journal version, Section 3, Definition 3.2, define truncation by deleting monomials and keeping their original coefficients. Proposition 3.3 states that these truncations preserve ordinary Lorentzian polynomials. This is not a statement about factorial-normalized coefficients, and is not restricted to dually Lorentzian polynomials. Theorem 3.1 supplies product and nonnegative-substitution closure. Sources: https://arxiv.org/pdf/2304.08399 and https://link.springer.com/article/10.1007/s00605-025-02134-6

4. Brändén–Huh, *Lorentzian polynomials*, Example 2.26, gives the degree-d binary-form equivalence with ULC of order d and no internal zeros. The derivative and nonnegative-specialization closures used for coefficient extraction are also standard parts of this theory. Source: https://web.math.princeton.edu/~huh/Lorentzian.pdf

5. Mao–Wang, *The Narayana transformation*, arXiv:2607.01572v1, Theorem 1.1, is a real-rootedness-preserving one-variable basis-transform theorem with a real-rooted nonnegative input hypothesis. The theorem does not by itself cover arbitrary equal-weight laminar lattice sums, and it is not needed for this proof. Source: https://arxiv.org/html/2607.01572v1

## Independent reconstruction of the missing details

### 1. Feasibility and integer weights

Let `L` be a finite laminar family of nonempty subsets of `[m]`, containing every singleton. Write

`P = sum_{I in L} y_I Delta_I`, with `y_{ {i} } >= 1` and every `y_I >= 0` integral.

Add a dummy root `[m]` of weight zero when necessary. Order the sets by containment. For a node `I`, its children are its maximal proper subnodes; they partition `I`, because all singletons are present. Put `W_I = sum_{J subseteq I} y_J` and `Q = W_[m]`.

Then `q` is in `P` if and only if

`q([m]) = Q` and `q(I) >= W_I` for every node `I`.

Necessity follows by taking the minimum of the coordinate-sum functional on each simplex. For sufficiency, regard q_i as capacity at leaf i and process nodes in increasing order of inclusion. At node I, the weights already allocated inside I total `W_I-y_I`; laminarity ensures other processed nodes are disjoint from I. The residual capacity in I is therefore `q(I)-(W_I-y_I) >= y_I`. Allocate y_I within this residual capacity. After every node has been processed, total allocated mass is Q, so all capacity has been used. Each allocation is an element of `y_I Delta_I`, producing the required Minkowski decomposition. With integral q and weights the allocations can also be made integral. This proves existence only; the recurrence below does not count these possibly nonunique allocations.

Alternatively, for any subset S, the maximal nodes contained in S partition S. Summing their node inequalities gives `q(S) >= sum_{J subseteq S} y_J`, the usual full subset inequalities for this Minkowski sum.

Integrality of the displayed weights follows even if initially only integrality of `P` is given. For each `S`, the minimum of `q(S)` on `P` is `z_S = sum_{I subseteq S} y_I`. It is integral because a minimum occurs at an integral vertex. Recursion by inclusion gives `y_I = z_I - sum_{J proper subset I} y_J`. Positive singleton weights are therefore at least one. For an arbitrary laminar family, a depth-first leaf ordering makes all nodes intervals, so the interval convention of binary nestohedra creates no restriction on the symmetric Narayana lattice sum.

### 2. The recurrence counts each vector once

For node `I`, define `F_I(r)` to sum the products of the descendant Narayana polynomials over integer descendant coordinate vectors satisfying all their node inequalities and total sum `W_I+r`, for `r >= 0`.

A leaf with weight `a` has `F_I(r)=N_{a+r}(x)`. If an internal node has children `I_1,...,I_l` and own weight `c`, a feasible vector uniquely determines the integers

`r_j = q(I_j)-W_{I_j} >= 0`, with `sum_j r_j = c+r`.

Conversely, any such tuple and one feasible vector from each child concatenate to a feasible parent vector. Thus

`F_I(r) = sum_{r_1+...+r_l=c+r} product_j F_{I_j}(r_j)`.

There is no choice of a Minkowski decomposition anywhere in this bijection. Nonunique decompositions consequently produce no multiplicity. For a forest the component totals are fixed by their lower bounds and the total equality; its contribution is the product of the component values at zero. The dummy zero-weight root handles this uniformly.

### 3. The formal change of variables is exact

Set `b_r(x)=N_{r+1}(x)/x` and `M(z,x)=sum_{r>=0} b_r(x) z^r`. The equation

`M = 1 + (1+x) zM + x z^2 M^2`

can be checked directly by Lagrange inversion: if `u=z(1+u)(1+xu)`, then the coefficient of `z^r` in `u/z` is

`sum_{j=0}^r [1/(r+1)] binom(r+1,j) binom(r+1,j+1) x^j = b_r(x)`.

Therefore `u=zM`, `M=R(u,x)=(1+u)(1+xu)`, and `z=u/R`. Since `R(0,x)=1`, these are valid mutually inverse formal substitutions over `Q[x]`.

For a series represented by a polynomial `P(u,x)`, forward shift of its z-coefficients is exactly

`(P(u,x)-P(0,x))/z = R(u,x)(P(u,x)-P(0,x))/u = Theta P`.

The subtraction removes precisely the monomials of u-degree zero, so this remains a polynomial with nonnegative coefficients. Dividing by one factor of x for each leaf, the leaf of weight a has expression `Theta^(a-1)R`; an internal weight c contributes `Theta^c` after multiplying its child expressions. Evaluation at u=0 extracts the desired r=0 coefficient. The number of Theta operations is

`d = sum_leaves(a_i-1) + sum_internal y_I = Q-m`.

### 4. Exact degree and truncation invariant

For every subexpression, record its leaf count m and shift count d. Define `H(u,v)=u^d P(u,v/u)`. The simultaneous invariant is:

* H is a polynomial with nonnegative coefficients.
* Every monomial has total degree at least d.
* Its unique highest-total-degree monomial is `(uv)^(m+d)`, with coefficient one.

At a leaf base `P=R`, this is immediate from `H=(1+u)(1+v)`, with m=1 and d=0. Multiplication adds m and d and preserves all three assertions.

For one Theta operation, the homogeneous degree-d part of H is `H_d=u^d P(0,v/u)`, because a monomial `u^a x^b` of P contributes a monomial of total degree `d+a` in H. Direct substitution gives

`H_new = (1+u)(1+v)(H-H_d)`, with `d_new=d+1`.

Deleting the degree-d part leaves no negative coefficients or exponents, and raises the minimum total degree to at least d+1. Its top term is not removed, since `2(m+d)>d` for m>=1. Multiplication by `(1+u)(1+v)` produces the claimed new unique top term. In particular, the total degree is exactly

`D=2(m+d)`.

Now homogenize by `h(w,u,v)=w^D H(u/w,v/w)`. Deleting H_d is precisely the coefficient-preserving cap on the w exponent

`w exponent <= D-d-1`.

The new homogenization, of degree D+2, is therefore exactly

`h_new=(w+u)(w+v) h_{w exponent <= D-d-1}`.

There is no extra w power, division, derivative multiplier, or factorial normalization. In RSW's componentwise notation the cap is obtained by taking `kappa=(D-d-1,D,D)` in variable order `(w,u,v)`.

The base form `(w+u)(w+v)` is a product of nonnegative linear forms. Product and truncation closure prove inductively that every h is Lorentzian.

One can also independently verify the relevant upper-truncation closure directly. Its support remains M-convex by coordinate exchange. After a differential operator of degree D-2, compare the number of w derivatives with the cap t. Above t the result is zero; at most t-2 it is unchanged; at t the change removes the w row and column of the quadratic matrix; at t-1 it subtracts a nonnegative multiple of the w diagonal entry. Principal-submatrix interlacing and the negative-semidefinite diagonal change cannot increase the positive eigenvalue count. This agrees with RSW's proof.

### 5. Extraction and the exact ULC order

The required binary form is

`H_d(u,v) = [w^(D-d)] h = (1/(D-d)!) (partial_w^(D-d) h)|_{w=0}`.

Differentiation and nonnegative specialization preserve the Lorentzian property, as does positive scalar multiplication. Thus H_d is Lorentzian of degree d, not D. Since `P(0,x)=A(x)`, it equals `u^d A(v/u)`. The binary criterion gives ULC with denominator `binom(d,j)`.

For every integer point q of P, all q_i are positive, and `product_i(N_{q_i}(x)/x)` has positive coefficients in every degree from 0 to `sum_i(q_i-1)=d`, with constant and leading coefficients one. The nonempty integral polytope contains an integer vertex. Therefore A has degree exactly d, every coefficient is positive, and both endpoint coefficients equal `|P cap Z^m|`.

### 6. Exact fibre statement and boundaries

For a nonempty fibre of a permutation pi in S_n, n>=1, put k=des(pi). Defant supplies `m=k+1` and `Q=n-k`, so `d=n-2k-1>=0`. The refined formula gives

`A_pi(x)=sum_{j=0}^d f_{k+j}(pi) x^j`.

Consequently the support of the full descent distribution is exactly `k,...,n-k-1`; outside it are zeros. The normalized central sequence is ULC of order d. Since multiplication by the binomial coefficient sequence preserves log-concavity, the central coefficients are log-concave. Padding them by the forced outside zeros preserves log-concavity, proving precisely the original weaker question.

For d=0, all singleton weights are one and all other weights are zero, giving A=1. For d=1, the binary criterion is vacuous and positivity gives the conclusion. A single leaf gives the usual shifted Narayana polynomial and is covered without alteration. Zero internal weights and disconnected building sets are covered by the same recurrence. Empty fibres have the identically zero descent sequence, which is trivially log-concave; no degree-d assertion need be made for them. If the empty permutation is included in one's convention, state it separately: n=0 does not satisfy the displayed d formula for the claimed degree, so the theorem should explicitly assume n>=1.

## Independent finite check

`../verification/check_permutation_fibres.py` enumerates permutations directly, implements stack-sorting by a monotone stack, groups by the actual image, and checks the support and exact rational ULC inequalities. It imports none of the package's supplied code. It checked every permutation for n=1 through 10, totalling 4,037,913 inputs and 89,261 nonempty fibres across those sizes. All checks passed. There are 76,028 nonempty fibres at n=10. The output is in `../verification/permutation_fibres_output.txt`.

These finite checks are supplementary and are not used to justify any general implication in the proof.

## Revision checklist incorporated into the proof draft

* State n>=1 and retain the nonempty-fibre hypothesis for the positive-degree/ULC formulation.
* Put positive singleton weights explicitly in the general theorem; do not silently expand to Minkowski sums admitting zero coordinates.
* Include the exact vector-to-child-surplus bijection, rather than merely referring to a recurrence.
* State and prove the simultaneous top-term invariant, which yields D exactly and fixes the truncation cap.
* Cite RSW Definition 3.2 together with Proposition 3.3, making ordinary coefficients explicit.
* Include the coefficient-extraction factorial and explain why it is a harmless positive scalar.
* Explain degree, positivity, and zero-padding, so the full-fibre claim follows without a hidden support assumption.
* Separate mathematical validity from publication priority and human peer review. Do not claim that Conjecture 31's real-rootedness statement has been solved.

# Audit: Lorentzian lift for Narayana sums over integral binary nestohedra

Date: 2026-11-04. AI-assisted mathematical and exact computational audit. Not external human peer review.

## Verdict

**The proposed argument survives this audit.** Ordinary, coefficient-preserving coordinate truncation does preserve the Lorentzian property. The polynomial substitution, degree bookkeeping, laminar lattice-point recursion, and final coefficient extraction are compatible with that theorem. With the precise definitions below, the construction proves ultra-log-concavity of the polynomial after removing its forced power of x, and hence proves the log-concavity part of Defant's conjectures for every integral binary nestohedron / nonempty stack-sorting fiber. It does **not** prove the real-rootedness conjecture.

This is an independently checked proof argument, not a publication or a claim of external peer review. A limited current literature search found no primary-source prior resolution of this exact log-concavity statement; that search does not certify novelty.

## Primary references verified

1. Julius Ross, Hendrik Süss, Thomas Wannerer, *Dually Lorentzian Polynomials*, Monatshefte für Mathematik 208 (2025), 495–524, published 17 November 2025. Section 3, Definition 3.2 and Proposition 3.3 explicitly use ordinary monomial coefficients and show that upper and lower coordinate truncations preserve the Lorentzian property. No factorial normalization occurs in this proposition. Theorem 3.1 records product closure and nonnegative linear substitutions.
   https://link.springer.com/article/10.1007/s00605-025-02134-6

2. Petter Brändén and June Huh, *Lorentzian polynomials*, Annals of Mathematics 192 (2020), 821–891. Theorem 2.25 gives the ordinary-coefficient M-convex-support/quadratic-Hessian characterization. Theorem 2.10 and Corollary 2.32 supply substitution and product closure. Example 2.26 identifies binary homogeneous Lorentzian forms with ultra-log-concave coefficient sequences without internal zeros.
   https://annals.math.princeton.edu/2020/192-3/p04
   Author-hosted full text: https://web.math.princeton.edu/~huh/Lorentzian.pdf

3. Colin Defant, *Fertilitopes*, Discrete & Computational Geometry 70 (2023), 713–752. Conjectures 1.1 and 1.2 concern real-rootedness and log-concavity; Theorems 3.1–3.2 and the refined fertility formula transfer between the fiber and binary-nestohedron settings. Section 2.6 describes binary building sets as laminar collections of tree-node leaf sets, with positive integral weights when the nestohedron is integral.
   https://link.springer.com/article/10.1007/s00454-023-00488-y

## Precise candidate theorem

Let B be a finite laminar family on [m] containing every singleton. Let a_i >= 1 be integral singleton weights and c_v >= 0 be integral internal-node weights after completing B to a rooted tree (zero-weight nodes are allowed). Put

    P = sum_i a_i Delta_{ {i} } + sum_internal_v c_v Delta_{L(v)},
    N = sum_i a_i + sum_v c_v,
    d = N - m,
    A_P(x) = x^(-m) sum_{q in P intersect Z^m} product_i N_{q_i}(x).

Then the homogeneous binary polynomial

    u^d A_P(v/u)

is Lorentzian. Equivalently, if A_P(x)=sum_{j=0}^d a_j x^j, the sequence

    a_j / binom(d,j),  0 <= j <= d,

is log-concave. Every coefficient a_j is positive, because each q_i >= 1 and every reduced Narayana polynomial has positive coefficients in its complete degree range. Thus no internal-zero qualification is problematic. For d=0 or 1 the conclusion has its usual vacuous interpretation.

The interval condition in Defant's binary building sets is unnecessary for this proof: coordinate relabeling makes any laminar tree family into intervals. Disconnected maximal components can be joined by a zero-weight root.

## 0. Integrality of the simplex weights

The required implication can be checked without any subtlety about maximal nested-set faces. For every subset S of coordinates, Minkowski additivity of the minimum of a linear functional gives

    z(S) := min_{q in P} sum_{i in S} q_i = sum_{I subseteq S} y_I.

Indeed the minimum of that functional on Delta_I equals 1 if I is contained in S and 0 otherwise. If P is integral, its minimum is attained at an integral vertex, so every z(S) is integral. Order the members I of B by inclusion. Then

    y_I = z(I) - sum_{J in B, J proper subset of I} y_J

proves inductively that every y_I is integral. Positive singleton weights are consequently at least 1. This also supplies the subtree inequalities used in the direct enumeration checks.

## 1. Lattice-point recursion counts each point exactly once

For each node v let P_v be the Minkowski sum from its subtree, supported on L(v), and let N_v be its fixed coordinate sum. Define

    F_v(r;x) = sum_{q in (P_v + r Delta_{L(v)}) intersect Z^{L(v)}}
                 product_{i in L(v)} [N_{q_i}(x)/x],  r >= 0.

For a leaf i, F_i(r;x)=N_{a_i+r}(x)/x. For internal v with children v_1,...,v_s,

    F_v(r;x) = sum_{r_1+...+r_s=c_v+r} product_j F_{v_j}(r_j;x).

The decomposition is unique at the level relevant to counting: for any resulting q, the value r_j is forced by its child-block sum,

    r_j = sum_{i in L(v_j)} q_i - N_{v_j}.

The polynomial counts lattice points, not choices of simplex summands. To prove the membership equivalence, split a vector in (c_v+r)Delta_{L(v)} by child blocks; its block masses are exactly these r_j. Conversely, blockwise decompositions combine into a vector in the proposed argument simplex. Since q is integral and every N_{v_j} is integral, these masses are nonnegative integers. This removes the possible overcounting objection.

The root value F_root(0;x) is A_P(x).

## 2. Generating-function representation

Let

    M(z,x) = sum_{r>=0} [N_{r+1}(x)/x] z^r,
    R(u,x) = (1+u)(1+xu).

The formal solution u=z R(u,x), with u(0,x)=0, satisfies M=R(u,x) and u=zM. This can be verified directly by Lagrange inversion: the coefficient of x^j z^r in R(u,x)=u/z is

    (1/(r+1)) binom(r+1,j) binom(r+1,j+1),

the required reduced Narayana coefficient.

If F(z,x)=P(u(z,x),x), removing its initial coefficient and shifting its sequence left once gives

    (F(z,x)-F(0,x))/z = (Theta P)(u(z,x),x),
    Theta P = R(u,x) [P(u,x)-P(0,x)]/u.

The quotient is a polynomial. Starting with R, every application of Theta and every product leaves nonnegative coefficients. Thus the tree recurrence gives the finite polynomial expression

    leaf i:       P_i = Theta^(a_i-1) R,
    internal v:   P_v = Theta^c_v product_j P_{v_j},
    A_P(x):       P_root(0,x).

There is one factor x removed for each original leaf, not for each application of Theta or each internal vertex.

## 3. Exact homogeneous lift and degree invariant

For an expression with m leaves and d total Theta applications, define

    H(u,v) = u^d P(u,v/u),
    D = 2(m+d),
    G(u,v,w) = w^D H(u/w,v/w).

The induction proves H is a polynomial with nonnegative coefficients, all of total degree at least d and at most D. Its degree-D term is (uv)^(m+d), so D is the actual maximum degree, not an arbitrary padding choice.

Base: m=1,d=0,D=2 and

    H=(1+u)(1+v),
    G=(w+u)(w+v).

Product: the parameters m,d,D add, and both H and G multiply.

Shift: if P'=Theta P and the new count is d'=d+1, then

    H'=(1+u)(1+v) [H-H_[d]],

where H_[d] is the homogeneous total-degree-d part of H. Indeed a term u^i x^j in P becomes u^(d+i-j)v^j in H and has total degree d+i; therefore exactly the i=0 terms comprise H_[d]=u^d P(0,v/u).

Homogenizing at D'=D+2 gives exactly

    G' = (w+u)(w+v) T_{w <= D-d-1}(G).

The operator T retains the ordinary coefficients of all monomials with w exponent at most the indicated bound. Since G has no terms with w exponent above D-d, it deletes precisely the current top w layer. The shift increases the lower u,v degree by at least one, as required.

This is the necessary resolution of the differing-degree concern. The proof does not claim that arbitrary homogenization preserves Lorentzian polynomials. It constructs each homogeneous G from the preceding G using operations known to preserve the property.

## 4. Closure and root extraction

The base (w+u)(w+v) is a product of nonnegative linear forms and hence Lorentzian. Product closure and ordinary coordinate-upper-truncation closure imply inductively that every G is Lorentzian.

At the root, the w^(D-d) coefficient is

    [w^(D-d)] G = H_[d] = u^d A_P(v/u).

Equivalently it is

    (1/(D-d)!) [partial_w^(D-d) G] evaluated at w=0.

Partial differentiation, setting a variable to zero, and multiplication by a positive scalar preserve the Lorentzian property. Therefore this binary form is Lorentzian, yielding the theorem.

Restoring x^m preserves ordinary log-concavity. In fact its degree-N homogenization is v^m times the displayed binary form, also Lorentzian, so the original polynomial has the corresponding degree-N ULC inequality with its forced initial zeros as well. The stronger and cleaner statement is ULC after trimming x^m.

For a nonempty stack-sorting fiber of a permutation pi in S_n with k descents, m=k+1 and N=n-k, so d=n-2k-1. Empty fibers have zero descent polynomial and are handled separately.

## 5. Short independent check of upper-truncation closure

This is the only truncation direction needed. Let f be homogeneous Lorentzian and let g retain only exponents alpha_i <= b in one coordinate. Its support is M-convex: under the symmetric exchange axiom, any coordinate increased to i starts strictly below another permitted value, so neither exchanged point can exceed b.

For any derivative of order deg(f)-2, let its differentiation exponent in coordinate i be t. If t>b the resulting quadratic for g vanishes; if t<=b-2 it is unchanged. If t=b, its Hessian is obtained by setting row and column i to zero, so interlacing applies. If t=b-1, only the x_i^2 term is deleted, so its Hessian is the original Hessian minus a nonnegative diagonal rank-one matrix. Subtracting a positive semidefinite matrix cannot increase the number of positive eigenvalues. The ordinary Lorentzian characterization now applies.

This directly verifies that neither normalization nor an unproved preservation principle is hiding in the critical step.

## 6. Real-rootedness is not supplied by this lift

Coordinate truncation need not preserve stability. Already for two base leaves, G=(w+u)^2(w+v)^2, deleting its w^4 term gives

    (w+u)^2(w+v)^2-w^4.

At u=v=1 this is (w+1)^4-w^4, whose roots include -1/2+i/2 and -1/2-i/2. Thus the corresponding lift after the subsequent factor (w+u)(w+v) is not stable, although it is Lorentzian. The root-extracted target in this example is only 2(u+v), so this is not a counterexample to Defant's real-rootedness conjecture; it identifies why this argument stops at ULC.

## 7. Independent exact finite checks

Files: `../verification/check_laminar_lift.py`, `../verification/laminar_lift_output.txt`, and `../verification/direct_composition_example.json`.

The script independently enumerates deduplicated Minkowski lattice-point sets and computes their Narayana sums. A second enumeration directly scans every positive integer composition of N and retains precisely those satisfying q(L(v)) >= N_v for every subtree. A third calculation constructs the ordinary two-variable polynomial P(u,x) via finite Theta operations and extracts its u^0 coefficients. These use separate representations, rather than just rerunning the same convolution. It compares these with the extracted lift produced entirely by homogeneous multiplication and truncation. It also checks the ULC inequalities exactly, the support exchange axiom on 30 examples, and all order-(D-2) derivative Hessians using exact integer principal minors.

Results:

- 204 deterministic/random weighted laminar trees checked.
- 22,088 exact quadratic Hessian checks passed.
- 30 full M-convex support checks passed.
- Maximum total coordinate sum N=13.
- Maximum lattice-point count among checked examples: 380.
- 204 direct positive-composition inequality enumerations passed, scanning 12,492 positive compositions in total (maximum 792 in one case).
- 204 direct comparisons against ordinary finite Theta output passed.
- All lattice-sum / lift coefficient comparisons and ULC checks passed.

An explicit independently enumerated example has m=5, N=11, leaf weights (2,1,1,2,1), and internal weights 1 on {1,2}, 1 on {3,4,5}, and 2 on all five coordinates. Its constraints include q_1+q_2 >= 4 and q_3+q_4+q_5 >= 5, together with the leaf bounds and total sum 11. Of the 210 positive compositions of 11 into 5 parts, exactly 50 satisfy the constraints. The direct Narayana sum and ordinary finite Theta both yield the reduced coefficient vector

    [50, 457, 1469, 2131, 1469, 457, 50].

The JSON example contains all 50 lattice points and the precise tree constraints.

These finite checks support, but are not needed for, the proof above.

## Audit boundaries

- Do not describe this as proving all of Conjecture 1.1 or 1.2: their real-rootedness clause is not established.
- Do not generalize the unique child-block recursion to overlapping, nonlaminar simplex families.
- Do not drop the positive singleton weights without separately defining zero-index Narayana polynomials and revisiting the base case.
- Keep the root zero polynomial case separate from positive-degree / nonempty-support statements.
- A final independent human or separate mathematical review is appropriate before claiming a new theorem publicly.

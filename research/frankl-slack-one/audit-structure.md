# Independent audit of slack-one block reduction

Audit target: `structure.md`. Outcome: no algebraic or closure defect found. This is an exact conditional encoding reduction, not a solution of the 55-set case.

## Assumptions to make explicit

Write **m = |U|**. Separation makes incidence domination a partial order. The premise that a smallest counterexample has odd size and maximum frequency (|A|-1)/2 is an external structural lemma, not a consequence of being a counterexample alone. The draft assumes that lemma correctly; a stand-alone theorem should cite it. The existence of a sufficiently frequent partner in the t-avoiding subfamily uses minimality of the counterexample.

## Independent derivation

Define A_j as the union of all members missing j. A_j belongs to the family by union closure, and U\A_j consists precisely of elements x with x <= j. In a separating family distinct j give distinct A_j. For a maximum-frequency t, t <= j would force equal incidence (and contradict separation) unless j=t. Thus A_j contains t whenever j differs from t.

Let Q be elements occurring in at least m+1 sets avoiding t, and choose p maximal in Q under domination. If p is absent from A_j, then p <= j. Domination implies j belongs to Q, contradicting maximality unless j=p. Hence U and all A_j with j outside {t,p} give m-1 distinct members in P11.

Put h=m-1+e, s=m+1+b. The bound on frequency(p) gives e+b<=1 with e,b nonnegative integers. The top frequency fixes P10=2m+1-h and total size fixes P00=2m+2-s. This yields exactly the three rows stated in the draft. No fourth integer case is omitted.

For every family member X, its complement restricted to W is a downset: if j is absent and x<=j, then x is absent. The principal ideals D(j), together with the empty set, are distinct and exhaust H except for exactly one extra nonprincipal nonempty downset E when e=1.

Taking a union ORs the t,p membership bits and intersects complements on W. Thus the all-pairs rule for block intersections is both necessary and sufficient, including repeated blocks and E intersections. Avoidance counts in H equal d(x)+1[x in E] when e=1. Subtracting total avoidance from 4m+3 yields exactly the draft's bound of 2m+1 on frequency.

Conversely, the reconstructed family is union-closed and has the prescribed size. Principal ideals distinguish different W elements; the member associated with D(j) distinguishes j from t and p. Nonempty R and S distinguish t from p. H contains the empty complement, so U occurs. The constructed family is therefore separating. Its restriction of domination to W is indeed the proposed poset: downsets enforce every order relation, and D(j) witnesses each failed relation x<=j. The reconstruction need not be smallest or have the chosen p maximal; neither condition is needed for sufficiency as a counterexample.

The common-intersection conditions R0 subset of each member of T and S0 subset of each member of T follow from cross-block closure. Replacing them by empty-core assumptions is not justified. Allowing E as a target is essential; an encoder restricted to principal target ideals is not equivalent.

## Independent executable sanity checks

`check.py` checks the OR/intersection equivalence and all avoidance-count identities for all 255 nonempty set families on 3 elements and 3,000 deterministically sampled nonempty families on 4 elements, over every distinguished pair. Result: 3,255 families / 18,765 pairs passed. It also independently enumerates allowed block cardinalities for m=2,...,100 and recovers only the three rows.

These tests exercise the representation, NOT nonexistence of a Frankl counterexample and NOT the structural lemma granting the premise. The proof above, rather than the finite test, establishes the general dictionary.

## Literature and significance

The counting mechanism is Hu's maximal-partner method (2017), available at https://arxiv.org/html/1706.06167 and reproduced in the appendix of the supplied 54-set source. Hu's displayed Theorem 1 and its proof give |A| >= 4m-1; a conflicting 4m+1 phrase in the introduction must not be substituted for the proved bound. The three cases are the immediate integer slack decomposition of that mechanism. Novelty has not been established.

The audit does not certify the supplied paper's <=54 computational theorem or any proposed m=14 search. A full 55-set exclusion still needs all admissible cases and independently checkable certificates, and the appropriate ground-size reduction. No UNSAT result was produced here.

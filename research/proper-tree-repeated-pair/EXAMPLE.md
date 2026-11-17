# Explicit example audit

Let S have vertices c,u1,u2,u3,v1,v2,v3 and edges c-ui, ui-vi for i=1,2,3. Assign respective weights (2,2,6,18,54,162,486). Define T by attaching w(x)-1 new leaves to each x in S.

## Hypotheses and elementary checks

- Exactly one repeated weight, 2, occurs at c and u1. Both are internal vertices of S (degrees 3 and 2).
- Every weight is divisible by 2. To avoid a notation collision with the literature below, call this arithmetic divisor d=2, not the caterpillar parameter q.
- Every submultiset sum divided by 2 has the form a0+3a1+9a2+27a3+81a4+243a5, with a0 in {0,1,2} and a1,...,a5 in {0,1}. Uniqueness of base-3 representation gives injectivity. There are 3*2^5=96 submultisets and 96 different sums. This is submultiset injectivity, NOT injectivity on labelled vertex subsets: {c} and {u1} necessarily have equal sums.
- T has 730 vertices, 729 edges, 723 leaves. Every skeleton vertex has at least one attached leaf and is nonleaf in T. Thus its nonleaf-induced skeleton is exactly S and T is proper.
- S has diameter 4. Attaching at least one leaf at every vertex gives diameter(T)=diameter(S)+2=6.
- The seven nonleaf degrees of T are 4,3,7,19,54,162,486. In particular T has no vertex of degree 2.

`checks/example.py` independently constructs the expanded tree and checks all numerical claims and all 96 sums.

## Scope relative to specific cited results

1. Awan, Theorem 1 (https://arxiv.org/html/2609.13464v2), and Zeng, Theorem 1.1 (https://arxiv.org/html/2608.18179), require every nonleaf of the skeleton/core to have a weight occurring exactly once. Our c and u1 violate this requirement.
2. Gonzalez–Orellana–Tomba, Corollary 5.15 (https://arxiv.org/html/2404.06002v2), requires distinct leaf-component orders. The repeated order 2 violates that criterion. Their diameter-at-most-five reconstruction theorem does not apply because T has diameter 6.
3. T is not a caterpillar: deleting its leaves leaves S, which branches at c and is not a path.
4. Nor is T a proper r-caterpillar for any r>=2 in Definition 1 of G. Arunkumar, Narayanan Narayanan, Raghavendra Rao B. V. and Sagar S. Sawant, *Proper q-caterpillars are distinguished by their Chromatic Symmetric Functions*, Discrete Mathematics 347 (2024), 114162, https://doi.org/10.1016/j.disc.2024.114162 (preprint https://arxiv.org/abs/2307.02234). Their construction attaches one or more pendant paths of length r at each spine vertex. Every such pendant path has an interior degree-2 vertex when r>=2. T has none. Their parameter measures path length, not the common divisor of skeleton weights used here.

Important distinction: S ITSELF is a proper 2-caterpillar under that definition (one-vertex spine c and three arms of length 2). The object reconstructed in our proposition is T, not S. Applying a theorem to the unweighted S does not give reconstruction of the expanded weighted T from Phi(T).

These are exclusions from particular hypotheses, not a claim of novelty or proof that no other existing reconstruction theorem covers T.

## Reconstruction conclusion

By Awan's Lemma 2.4, any competing proper tree T' with the same Phi has the same skeleton weight multiset W. Applying the proposition therefore determines this T among all proper trees, not just among trees assumed in advance to have this W. We do not claim distinguishability from arbitrary non-proper trees.

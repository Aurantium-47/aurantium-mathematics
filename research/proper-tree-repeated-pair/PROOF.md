# A sufficient first-derivative reconstruction criterion with one repeated skeleton weight

Working note, 17 November 2026. Novelty has not been established.

## Proposition

Let T be a proper tree with k >= 3 skeleton vertices and weight multiset W. Suppose:

1. Exactly one value a occurs twice in W; every other value occurs once.
2. All values in W are divisible by an integer q >= 2.
3. The map U -> sum(U) is injective on the submultisets U of W.

If T' is a proper tree and Phi(T')=Phi(T), then T' and T are isomorphic. Here Phi is the power-sum derivative of the chromatic symmetric function, specialized at p1=0.

The criterion permits the two vertices of weight a to be internal skeleton vertices. It does not encompass all proper trees, all trees of diameter six, or the general tree reconstruction conjecture.

## Inputs from existing work

We use Awan's [Proposition 2.1 and Lemma 2.4](https://arxiv.org/html/2609.13464v2). These give the weighted-skeleton forest expansion for Phi and the recovery, among proper trees, of the entire skeleton weight multiset and its colored edge counts. No multiplicity-isolation hypothesis is required for these two inputs. The argument below adds a third-vertex statistic and a reconstruction step for one repeated pair.

## Proof

Write S for the skeleton, n=sum(W), and epsilon=(-1)^(n-k-1). Its vertices of repeated weight a are r and s; all other vertices can be named by their unique weight. By the cited recovery result, T' has the same W and k, so it satisfies the same three assumptions.

For a color submultiset C of size h=2 or 3, let N_C count subsets of h skeleton vertices with those weights and connected induced subgraph. Define

    M_C = p_(sum(C)-1) times the product of p_b over b in W minus C.

We claim that

    [M_C] Phi(T) = epsilon * (-1)^(h-1) * (sum(C)-h) * N_C.       (1)

Indeed, a nonzero summand of the forest expansion has precisely one power-sum index congruent to -1 modulo q, which identifies its marked component; the other indices are divisible by q. Adding one back to the marked index and using assumption 3 identifies each component's color multiset. Consequently a term contributing to M_C must have one marked component of color multiset C and singleton components elsewhere. Since S is a tree, each connected h-vertex subset determines exactly one such forest, containing h-1 edges. Its coefficient is the scalar in (1). No forest with two separate edges can imitate a connected triple. Also sum(C)-1 >= 3, so the marked factor survives p1=0 even when q=2. The scalar sum(C)-h is positive. Thus all N_C for h=2,3 are recovered.

The pair statistics determine all edges between uniquely weighted vertices and the possible edge rs. For each unique vertex x let

    A_x = (1_{xr in E(S)}, 1_{xs in E(S)}).

Pair statistics determine d_x=||A_x||^2. If unique vertices x,y are not adjacent, a connected induced triple of colors {w(x),w(y),a} must consist of x,y and a common neighbor r or s. Hence its count is A_x dot A_y. If x,y are adjacent, a common neighbor would create a triangle, so A_x dot A_y=0. This recovers the complete Gram matrix of the rows A_x.

A binary two-coordinate row with squared norm 0 or 2 is fixed. Norm-one rows belong to { (1,0), (0,1) }; two such rows agree precisely when their dot product is 1. Their division into at most two classes is therefore known, and only simultaneous interchange of the columns remains undetermined. This interchange is exactly the weight-preserving swap of r and s. Thus all skeleton edges are determined up to weighted isomorphism. Attaching w(v)-1 leaves at each skeleton vertex recovers T. The same reconstruction applies to T', proving the assertion. QED.

## A nonempty family

For integers q >= 2 and B >= 3, take

    W = {q, q, qB, qB^2, ..., qB^(k-2)}.

Submultiset sums have a unique base-B digit expansion: the units digit is at most 2, all other digits at most 1. Place these weights on any k-vertex tree. This includes skeletons of arbitrary diameter and branching, with the repeated weight at internal vertices. The large gaps between weights are a strong restriction, not a generic-case claim.

## Comparison with cited reconstruction results

- [Awan, Theorem 1](https://arxiv.org/html/2609.13464v2) assumes repeated skeleton weights occur only at skeleton leaves and reconstructs using Phi. The present sufficient condition trades that structural restriction for strong arithmetic separation and multiplicity exactly two. Neither hypothesis contains the other in general. Its ingredients are borrowed explicitly from Awan.
- [Zeng, Theorem 1.1 and Section 5](https://arxiv.org/html/2608.18179) treats the same multiplicity-isolated structural class using the full chromatic symmetric function. Section 5 identifies repeated non-leaf weights as an obstruction to using edge counts alone. Our extra triple counts address a narrow instance of that obstruction, not the unrestricted case.
- [Gonzalez, Orellana and Tomba, Corollary 5.15](https://arxiv.org/html/2404.06002v2) reconstructs proper trees when all leaf-component orders are distinct. Their diameter-at-most-five results cover some small members of the present family, but not arbitrary skeletons.
- [Aliste-Prieto, de Mier, Orellana and Zamora](https://doi.org/10.1137/22M148046X) develop the marked-graph and D-polynomial methods and prove proper-tree reconstruction in diameter at most five. Those tools should be credited as background; their advertised diameter restriction is not the unrestricted skeleton criterion above.
- Dénes Bartha, Péter Burcsi and Zsuzsanna Lipták, [*Reconstruction of Trees from Jumbled and Weighted Subtrees*](https://doi.org/10.4230/LIPIcs.CPM.2016.10), CPM 2016, LIPIcs 54, 10:1–10:13, study reconstruction from subtree label compositions and weights, including the unknown-topology problem. Their main convention is edge labelling, but Section 2 explicitly allows vertex-labelled adaptations and Sections 3–4 discuss vertex-labelled examples. This is prior work on the reconstruction framework; we do not claim that framework as new. Their stated positive results for spiders, stars and given-topology reconstruction do not state the one-repeated-vertex-pair criterion used here.
- Antoine Dailly and Tuomo Lehtilä, [*Reconstructing graphs with subgraph compositions*](https://doi.org/10.1016/j.dam.2026.04.023), Discrete Applied Mathematics 390 (2026), 198–219 ([preprint](https://arxiv.org/abs/2504.00169)), use vertex-labelled connected induced subgraph compositions. Their Definition 1 gives precisely the statistics M_2 and M_3 corresponding to our colored pair and triple counts. Their main reconstruction problem assumes known topology, although Remark 17 also recovers topology within a restricted subdivided-star class. These results do not state reconstruction of an arbitrary unknown skeleton under our one-repeated-pair hypothesis. The application-specific step here is extracting these statistics from Phi using Awan's formula; novelty of either this criterion or the elementary Gram-matrix observation remains unestablished.

The search did not find an exact prior statement of this criterion. That is not proof of novelty. A complete publication-level literature review, independent human review and any desired formalization remain separate work.

## Computational cross-check

The independently written `checks/forest.py` enumerates the full forest expansion on every labelled skeleton with 3 through 6 vertices, using q=2,B=3. It verifies 34,271 instances of equation (1). These finite checks corroborate, but do not establish, the infinite proposition.

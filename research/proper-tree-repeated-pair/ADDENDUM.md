# Short sums suffice for one repeated skeleton weight

This strengthens the sufficient condition in [the original draft](https://github.com/Aurantium-47/aurantium-mathematics/pull/5). It reconstructs a restricted class among proper trees; it neither settles the general chromatic symmetric function conjecture nor claims priority.

Let T be a proper tree with weighted skeleton S on k ≥ 3 vertices: each skeleton vertex has weight one plus its attached leaf count. Suppose its weight multiset W has one weight a of multiplicity two and all other weights distinct, and all weights are divisible by a common q ≥ 2. Instead of injectivity of all submultiset sums, assume:
1. No singleton weight equals the sum of an available two- or three-element submultiset of W.
2. Sums are injective on the two-element submultisets and, separately, on the three-element submultisets. These are multisets of weights, not labelled vertex sets.

Then T is determined by Phi(T) among proper trees. In particular the simpler stronger assumption max(W) < 2 min(W) suffices for condition 1.

## Proof

Use [Awan, Proposition 2.1 and Lemma 2.4](https://arxiv.org/html/2609.13464v2) for the forest expansion of Phi and the recovery of W among proper trees. Write n = sum(W), epsilon = (-1)^(n-k-1). For a weight submultiset C of size h = 2 or 3, consider the target monomial with one power sum p_(sum(C)-1) and the remaining factors p_b for b in W minus C. A contributing skeleton forest has exactly k-h+1 components by the number of factors, hence h-1 edges. Its components have at most h vertices. The unique index congruent to -1 mod q identifies the marked component; every unmarked factor is indexed by an original singleton weight. Condition 1 forces each unmarked component to be a singleton. Consequently the marked component has h vertices and its weight multiset equals C by condition 2. Conversely a connected induced skeleton subset with weight multiset C gives exactly one such forest and marking. Its contribution is epsilon times (-1)^(h-1) times (sum(C)-h). This scalar is nonzero, and p_(sum(C)-1) survives p1=0. We recover the counts of all connected pairs and triples of each weight multiset.

The pair counts give all uniquely weighted edges and whether the repeated vertices r,s are adjacent. For each unique vertex x set A_x=(1_{xr},1_{xs}); pair counts give its squared norm. For nonadjacent unique x,y their inner product is the connected triple count with colors w(x),w(y),a. For adjacent x,y the inner product is zero, since a common neighbor would yield a cycle. Norm-zero and norm-two rows are fixed; the norm-one rows split into at most two classes by whether inner product is 1. This reconstructs both columns up to a global swap. Hence the weighted skeleton, and then its leaf expansions, are determined.

## A polynomial-size family

Choose a prime p > max(k-1,3) with p=O(k) by Bertrand's postulate, and k-1 distinct residues x. Let B=3(p-1)+1 and d(x)=[x]+B[x²]+B²[x³], where the brackets mean least nonnegative residues modulo p. Assign each weight q(B³+d(x)), duplicating one of these weights to get k vertices. All weights are in [qB³,2qB³), so no singleton equals a larger sum. For equal-size sums of at most three terms, subtract the common offset and divide by q. Each digit sum is at most 3(p-1)<B, so ordinary equality forces equality of the three power sums modulo p. Newton's identities recover the elementary symmetric functions of the underlying multiset, since 2 and 3 are invertible; the resulting monic polynomial recovers the full multiset, including multiplicities. This elementary finite-field power-sum encoding is a bounded-sum (B_3-type) construction; we claim no novelty for it. The number of vertices after attaching leaves is O(q k^4), or O(k^4) for fixed q. Any k-vertex skeleton shape is allowed, with the repeated weight placed at any two vertices.

## Strict weakening on a diameter-six example

In order 0 through 7 take weights (218,240,280,298,298,306,342,354), with edges 03, 13, 34, 45, 46, 52, 67. Both vertices of weight 298 are internal; the skeleton diameter is four, so the proper tree has diameter six and 2,336 vertices. The ratio condition holds, and the checker verifies 22 two-element and 41 three-element submultisets with distinct sums within each size. In contrast, 240+280+306+342 = 218+298+298+354 = 1168. Thus this tree is covered by the new condition but not by the original one.

Run `python checks/short_sums.py` (Python 3.10+, standard library only) to compare all 63 target coefficients, including zeros, against all 128 skeleton forests. The finite check is not the proof of the general statement.

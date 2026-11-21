# Recovering component colors by the singleton complement

This second addendum further weakens the first addendum of [draft #5](https://github.com/Aurantium-47/aurantium-mathematics/pull/5). The original proof and examples remain valid under their respective hypotheses.

**Proposition.** Let T be a proper tree with a weighted skeleton on k ≥ 3 vertices and weight multiset W. Each weight equals one plus its number of attached leaves. Suppose exactly one weight occurs twice, every other weight occurs once, and all weights are divisible by a common integer q ≥ 2. Suppose no singleton weight equals the sum of an available two- or three-element submultiset of W. Then T is determined by Phi(T) among proper trees. No injectivity of pair or triple sums is needed.

**Proof.** By [Awan's Proposition 2.1 and Lemma 2.4](https://arxiv.org/html/2609.13464v2), use the weighted-skeleton forest formula and recover W from Phi among proper trees. Put n = sum(W) and epsilon = (-1)^(n-k-1). For C a submultiset of h weights, h = 2 or 3, take the coefficient of the monomial with one factor p_(sum(C)-1) and singleton factors p_b for b in W minus C, with multiplicity.

Any contributing skeleton forest has k-h+1 components because this is the monomial's number of factors. It therefore has h-1 edges, so every component has at most h vertices. The marked component is identified by its index -1 modulo q; all other factors have index divisible by q. Each unmarked factor has index equal to an original singleton weight. The hypothesis forces the corresponding component to be a singleton, since sizes 2 and 3 are the only other possibilities. The marked component's weight multiset is therefore the multiset difference between W and those singleton factors, namely C. This is stronger than recovering C from its sum. The argument also distinguishes target monomials for different C of the same size even when their marked indices coincide.

Each connected induced skeleton subset with color multiset C contributes exactly once, as its induced edges are the unique connected choice and all others are absent. It contributes epsilon times (-1)^(h-1) times (sum(C)-h), a nonzero integer because weights are at least q ≥ 2. The marked factor's index is at least 3, so the specialization p1=0 does not discard it. Dividing yields every connected pair and triple color count.

The existing two-column Gram reconstruction now applies. The pair counts determine edges between uniquely colored vertices, the edge between the repeated vertices r and s, and each unique vertex's number of neighbors in {r,s}. For distinct nonadjacent unique vertices the number of their common neighbors in {r,s} is the connected triple count with their two colors and the repeated color. Adjacent vertices have no common neighbor in a tree. These statistics recover the two incidence columns up to interchange: rows of norm squared 0 or 2 are fixed, and two rows of norm squared 1 lie in the same column exactly when their inner product is 1. The reconstructed skeleton determines the leaf expansions. Equality of Phi with another proper tree gives the same W, so the argument applies to that tree as well.

## Quadratic-size family

For any k-vertex tree take the k-1 distinct weights qk, q(k+1), ..., q(2k-2), and add a second copy of qk. Place them on the skeleton in any order. The maximum weight is less than twice the minimum; thus no singleton equals a sum with two or more terms. Attaching w-1 leaves at the vertex of weight w gives a proper tree with q(3k²-3k+2)/2 vertices: O(qk²), or O(k²) for fixed q. The repeated weight may be internal. This construction uses no finite-field arithmetic.

## Exact fixture with collisions

Take weights (16,18,20,22,22,24,26,28) on the skeleton edges 03, 13, 34, 45, 46, 52, 67, in vertex order 0 through 7. Both occurrences of 22 are internal. The skeleton diameter is four, giving a proper tree of diameter six and 176 vertices. Singletons cannot collide with larger sums, but 16+22 = 18+20 and 16+18+24 = 16+20+22. Thus neither pair nor triple sum injectivity holds. The companion checker verifies all 63 target coefficients, including zeros, against all 128 skeleton forests.

This is a sufficient criterion among proper trees with exactly one repeated pair, not a theorem for arbitrary proper trees or all diameter-six trees. The finite check corroborates the proof and is not a proof by exhaustive sampling. The work uses Awan's formula and weight recovery, and the previous addendum's Gram argument; no priority claim is made.

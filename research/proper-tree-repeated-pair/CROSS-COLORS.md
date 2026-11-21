# Reconstruction with edges between different repeated weights

Call a weight **repeated** if it occurs at more than one vertex of the weighted skeleton. Let $e_{ab}$ denote the number of skeleton edges joining weights $a,b$.

**Theorem.** The specialized first power-sum derivative determines a proper tree among proper trees if its weighted skeleton satisfies these conditions:

1. A same-weight edge at a repeated weight is allowed only when that weight has multiplicity two.
2. There is at most one edge of each type between distinct repeated weights. The simple graph on the repeated weights with these types as edges is triangle-free.
3. For every edge $a-b$ of this graph, no unique-weight vertex has neighbors of both weights $a$ and $b$.

No inequality between weights or edge sums is assumed. The conditions depend only on the data in [Awan, Lemma 2.4](https://arxiv.org/html/2609.13464v2#S2), so every proper competitor with the same invariant satisfies them. A skeleton on at most two vertices is determined by those data alone.

## Two-edge layer

As in Addendum V, provisionally assign every unordered pair of distinct edges its disjoint template, setting it to zero if the four endpoint weights do not fit in the multiset. The corrections for wedges centered at unique weights are known. At a repeated weight $a$, the number of wedges using an $a-a$ edge and an $a-b$ edge is $e_{aa}e_{ab}$, including when $b$ repeats: the $a-a$ edge uses both copies of $a$. Its disjoint template is zero. Remaining wedges centered at repeated weights have three distinct weights. In fact two edges to the same other weight are impossible at one center: a unique neighbor is a single vertex, and any cross type between two repeated weights has at most one edge.

For a repeated center $a$ and distinct prospective neighbor weights $u,v\ne a$ with both incident types occurring, use the column $C$a;u,v$-D$au,av$$. Omit this candidate if both neighbors are unique and joined by an edge, since those vertices with the center would form a triangle. Otherwise include it even when the count of actual wedges turns out to be zero. Every column has a feasible disjoint template because $a$ repeats and $u,v$ are distinct from $a$ and from each other.

The unordered triple of weights determines a column. With only one repeated weight the center is forced. With two repeated weights and one unique weight, the two possible centers would require a cross edge and adjacency from the unique vertex to both repeats, contradicting condition 3. With three repeated weights, two possible centers would require a triangle of cross types, contradicting condition 2. A column counts at most one actual wedge: two wedges with the same repeated neighbor would reuse its unique incident cross edge from $a$, and two wedges with the same pair of unique neighbors would form a 4-cycle.

## Rank

Use the leading-marked monomial order and collision description in Addendum VI. Each triple parent is determined by its three deleted parts and the new part $s=a+u+v$; different totals distinguish the parents at the larger total, and equal totals identify the multiset of deleted parts and hence the column. The paired disjoint parent is smaller. In the comparison its added parts $a+u,a+v$ are at most $s-2$ and its altered singleton part $a$ is smaller still; thus the parents do not fit the leading-mark collision pattern. The leading term of a column therefore comes from its triple parent.

In a hypothetical rational relation, let $S$ be the largest triple total of its nonzero columns and $M$ the largest vertex weight. Divide by the common monomial containing all original weights. If $S<M$, the terms with exponent $-1$ at $p_M$ arise only by marking an untouched singleton of weight $M$; after removing the common marking factor, each unmarked triple of total $S$ is identified by its three denominator weights, and no disjoint term has exponent $+1$ at $p_S$. Thus every top-total coefficient vanishes, a contradiction.

If $S\ge M$, a monomial with exponent $+1$ at $p_S$ must arise from a total-$S$ triple and a singleton marking. Choose any top-total column containing a repeated weight $r\ge3$, not necessarily its center. The leftover singleton of weight $r$ can be marked. The resulting term has exponent $-2$ at $p_r$. Because a triple deletes three distinct weights, any other top-total term with these two exponents must also delete $r$ and mark a singleton of weight $r$. The two other deleted weights distinguish the resulting monomial after canceling the common factor $p_S p_{r-1}/p_r^2$. So this column's coefficient must vanish. Every remaining top-total column has repeated center 2 and two unique neighbors. The largest triple parent in the relation then removes a 2. Any smaller parent with the same leading marked monomial would have strictly fewer 2s than this parent, by the collision description in Addendum VI. A parent can remove at most one copy of 2, and triple totals exceed 2, so this is impossible. This rules out a nonzero relation.

## Reconstructing the skeleton

For each repeated weight $a$, label possible incident edges by the vertex when its weight is unique, and by the other weight $b$ for a cross type $a-b$ (there is just one such edge). A recovered wedge records that two labels occur at the same copy of $a$. The labels of each copy form a clique, and maximal cliques of size at least two are exactly these neighborhoods. To see this, a clique containing a cross label must belong to the one copy incident with that edge. For unique labels, two copies cannot share two labels (a 4-cycle), and three pairwise joined labels cannot come from three distinct copies (a 6-cycle). It follows that any clique of unique labels with at least two members is contained in a single neighborhood. Subtract the recovered neighborhoods from the known incidence counts, add the residual one-label neighborhoods, and pad with empty neighborhoods to the known multiplicity. Match the endpoints of every cross edge by its labels. Insert same-weight edges between the unique pair of copies when present and add the known edges between unique vertices. Expanding the skeleton weights restores the original tree.

This includes the same-weight adjacent-pair case and allows wedges involving three different repeated weights. As in that case, equality of full chromatic symmetric functions extends the comparison to arbitrary trees via [Orellana–Tomba, Corollary 3.13](https://arxiv.org/html/2611.18940v1#S3.SS3).

## Exact fixture

Take vertex weights (3,4,5,2,3,6,4,7,5) and edges 01,02,03,34,15,56,27,78. The expanded proper tree has 39 vertices and diameter eight. The edges of cross types 3–4 and 3–5 meet at one copy of weight 3. Thus the example lies outside the same-weight adjacent-pair case and outside [Awan's leaf-only repeated-weight hypothesis](https://arxiv.org/html/2609.13464v2#S2).

The five overlap columns, in order, are (3;2,4), (3;2,5), (3;4,5), (4;3,6), (5;3,7). The following rows give a minor of determinant 32:

```text
(2,2,4,4,5,6,15)
(2,2,4,5,5,7,13)
(2,2,4,5,6,7,12)
(2,4,4,5,6,7,10)
(2,4,5,5,6,7,9)
```

The exact checker recovers (1,1,1,1,1) and verifies all 66 nonzero coefficients against direct enumeration.

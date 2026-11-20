# Same-weight edges at arbitrary multiplicity

**Theorem.** A proper tree is determined among arbitrary trees by its full chromatic symmetric function if each unordered pair of repeated skeleton weights, including an equal-weight pair, occurs as the endpoint weights of at most one skeleton edge.

The specialized derivative determines such a tree among proper trees under these sufficient bounds: every candidate ordinary wedge centered at a repeated weight has center weight at least 3 and multiplicity at least three; every candidate wedge using a same-weight edge at a center of multiplicity at least three has center weight at least 3 and multiplicity at least four. These conditions use only the recovered weights and edge counts. Skeletons of at most two vertices are already determined by those data.

## Extract the overlaps

Use the two-edge layer and disjoint baseline of DIAGONAL-EXTRACTION. Corrections at unique centers stay known. For a same-weight edge at multiplicity two, each edge of type $a,b$ shares an endpoint with $a,a$, so those overlaps are also known. At higher multiplicity, there is one new candidate column for each pair of types $a,a$ and $a,b$ with $b\ne a$ and both types present. Distinct same-weight edges cannot overlap. All other columns are the ordinary ones from DIAGONAL-EXTRACTION.

Normalize by the product of the original weight variables. The new column's connected Laurent monomial is $p_{2a+b}/(p_a^2p_b)$, and its disjoint one is
$$E(a;b)=\frac{p_{2a}p_{a+b}}{p_a^3p_b}.$$
The exponent $-3$ identifies the center $a$ and cannot occur in a connected or ordinary disjoint term. For fixed $a$, the remaining negative exponent at $b$ identifies $b$, unless $b=2a$, the only cancellation possible. Thus each $E$ is distinct and its coefficient after baseline subtraction is the negative of its wedge count. Subtract these recovered columns and use the earlier exponent $-2$ extraction for ordinary wedges.

For the derivative, mark a leftover singleton $a$ in each new disjoint template. The resulting $E(a;b)p_{a-1}/p_a$ has exponent $-4$ at $p_a$ and occurs with column coefficient $-(a-1)(m_a-3)$, where $m_a$ is the multiplicity. A mark can lower an exponent by at most one, so exponent $-4$ requires premark exponent $-3$ at $p_a$. Neither nonsingleton component has weight $a$, hence the mark must come from a leftover singleton. For fixed $a$, removing the common marking factor gives the same distinct $E$ monomials. Subtract these columns before using the earlier exponent $-3$ extraction for ordinary wedges. For full $X$, the star-basis criterion cited in DIAGONAL-EXTRACTION detects properness of the competitor.

## Reattach equal-weight endpoints

Use the ordinary wedge counts to recover the multiset of external neighborhoods of the copies of $a$, as in CROSS-COLORS. Each label is a unique vertex or a single cross-weight edge. Include empty neighborhoods up to the known multiplicity. For an $a,a$ edge, the recovered overlaps with its $a,b$ incidences give the sum of the two endpoints' external incidence vectors. At multiplicity two this identifies the only possible pair.

For higher multiplicity, choose two distinct copies with the recorded sum and require both endpoints together to include every empty copy. The true pair is eligible because an unselected empty copy would be isolated. If another eligible pair shares one endpoint with the true pair, the two unshared copies have identical neighborhoods and are interchangeable. If the pairs are disjoint, all four copies have nonempty neighborhoods. The true endpoints cannot share a label: a shared unique vertex would give a triangle, and a cross-edge label cannot be shared. An outside copy cannot meet two labels from one true endpoint, since that would give a 4-cycle. It cannot meet one label from each true endpoint either, since that would create a cycle using the same-weight edge. In either case a shared label must denote a unique vertex. Consequently each alternative endpoint has at most one label in the union; the recorded sum gives it no other labels. Both pairs therefore use the same two singleton neighborhoods. Swapping equal neighborhoods again preserves the external graph. These swaps fix the unique vertices and preserve every cross-edge incidence, so the choices at different weights give a weighted isomorphism. Insert the known equal-weight edges and expand the skeleton.

## Exact fixtures

The 38-vertex full-invariant fixture has weights (3,3,6,3,4,5,5,2,7) and edges 01,12,24,43,05,56,57,78. Its 3–3 edge exercises the cancellation with $b=6=2a$. The 46-vertex derivative fixture adds weights 3 and 5, and uses edges 01,12,24,43,05,76,57,78,49,7–10. The checker recovers all seven candidate wedge counts (including one redundant zero with adjacent unique neighbors) and matches every coefficient in the respective two-edge layers: 27 and 83 nonzero terms.

# Diagonal extraction for proper-tree reconstruction

Use the weighted skeleton and edge counts of Addenda V–VI and CROSS-COLORS. Assume at most one edge of each type joining distinct repeated weights, and allow an edge joining two copies of one weight only at multiplicity two. Make no assumption about triangles in the weight graph.

A proper tree in this class is determined among all trees by its full chromatic symmetric function $X$. It is determined among proper trees by the specialized derivative $\Phi$ if every candidate wedge center satisfies $a\ge3$ and $m_a\ge3$, where $m_a$ is the multiplicity of weight $a$. More generally, for $\Phi$ it suffices that after excluding centers satisfying these two bounds, the remaining candidate wedge columns have distinct unordered triples of weights. These conditions are computable from the recovered weight multiset and edge-type counts. Skeletons on at most two vertices require no two-edge extraction.

## Unmarked extraction from full X

[Orellana–Tomba, Proposition 3.8](https://arxiv.org/html/2611.18940v1#S3.SS2), restating the core formula of Aliste-Prieto, de Mier, Orellana and Zamora, gives the unmarked forest polynomial: keep star-basis coefficients indexed by partitions with no part 1 and replace each factor indexed by $s$ with a formal variable $p_s$. Only the term $j=0$ survives in each component. The weight multiset and edge counts are already available from $\Phi$, which is computable from $X$. Terms with $k-2$ factors, where $k$ is the skeleton order, are the two-edge layer.

Assign every distinct edge pair its disjoint template provisionally, then subtract this baseline and all known wedge corrections from the observed layer. The corrections at unique centers are known as in Addendum V; an overlap of an $a-a$ edge and an $a-u$ edge has count $e_{aa}e_{au}$ since the first edge uses both copies of $a$. As in CROSS-COLORS, all remaining candidate columns have a repeated center $a$, distinct neighbors $b,c$ different from $a$, and both incident edge types present. Candidates whose two neighbors are unique and actually adjacent can be omitted. Each column is the connected template minus its disjoint template.

Divide by the common monomial $P_W=\prod_{w\in W}p_w$ (with multiplicities). For $b<c$, the disjoint Laurent monomial is
$$D(a;b,c)=\frac{p_{a+b}p_{a+c}}{p_a^2p_bp_c}.$$
It has exponent $-2$ exactly at its center $a$. No connected triple has such an exponent, because its deleted weights are distinct. For a fixed center, $a+c$ exceeds every denominator index; the only possible cancellation is $a+b=c$. If no cancellation occurs, the two exponents $-1$ recover $b,c$. If cancellation occurs, there is exactly one exponent $-1$, at $b$, and then $c=a+b$. Thus each disjoint monomial is unique, whether or not two columns have the same connected template. Its residual coefficient is the negative of that wedge count.

The neighborhood reconstruction of CROSS-COLORS requires only the per-edge-type multiplicity assumptions: each cross label identifies its sole incident edge, while unique labels use the same acyclicity argument. It does not require the weight-graph triangle conditions after the wedge counts have been recovered. Finally, the full $X$ detects properness by [Orellana–Tomba, Corollary 3.13](https://arxiv.org/html/2611.18940v1#S3.SS3), so an arbitrary tree competitor with the same $X$ is proper.

## Marked extraction from the specialized derivative

In the signed-normalized two-edge layer of Addendum V, take any candidate column with center $a\ge3$ and $m_a\ge3$. Its disjoint template leaves $m_a-2$ unmarked singletons of weight $a$. Marking one gives the monomial
$$D(a;b,c)\frac{p_{a-1}}{p_a}$$
with column coefficient $-(a-1)(m_a-2)$. In the Laurent expansion this has exponent $-3$ at $p_a$. A triple or a disjoint template with a different center deletes $a$ at most once; marking can remove at most one further factor $p_a$. In a disjoint template with center $a$, exponent $-3$ is possible only when the marked component is a leftover singleton of weight $a$: neither edge component of that template has sum $a$. Hence the specified monomials isolate the columns, by the uniqueness of $D$ for fixed $a$.

After subtracting these directly recovered columns, apply the rank proof of CROSS-COLORS to any remaining columns whose unordered triples are distinct. In that proof the weight-graph conditions were used only to make those triples distinct; the rank argument works with the surviving columns as they stand.

## Exact fixtures

A 32-vertex fixture has skeleton weights (3,4,5,3,2,4,6,5) and edges 01,12,23,04,45,26,67. Its repeated-label graph is a triangle, and the unique vertex of weight 2 is adjacent to vertices of both weights 3 and 4. The unmarked checker recovers all nine candidate wedge counts from 15 nonzero coefficients. In particular, for the unordered triple {3,4,5}, the three centers recover counts (0,1,1), in center order 3,4,5.

Append weights (3,4,5) at vertices 8,9,10 with edges 48,49,6–10. In the resulting 44-vertex fixture the nine marked extraction rows form a diagonal minor with diagonal (−2,−2,−2,−3,−3,−3,−4,−4,−4). The checker verifies each row and recovers all nine wedge counts.

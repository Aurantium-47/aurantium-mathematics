# A two-edge rank certificate without an edge-sum bound

Let `T` be a proper tree with nonempty weighted skeleton `S`, and let `W` be its weight multiset. As in Addendum IV, suppose that the vertices of nonunique weight form an independent set in `S`. There is no numerical separation assumption. We give a finite matrix, computable from the specialized first power-sum derivative `Phi(T)`, whose full column rank certifies reconstruction among proper trees.

## The observable linear system

Use [Awan, Proposition 2.1 and Lemma 2.4](https://arxiv.org/html/2609.13464v2#S2) to obtain the weighted forest formula, `W`, and every edge-type count `e_R`, where `R` is the unordered multiset of endpoint weights. Independence of the repeated-weight vertices follows for any competing proper tree from these same edge counts. Skeletons on at most two vertices are already determined by `W` and `e_R`; let `k >= 3` be the number of skeleton vertices.

Read the layer of monomials of length `k-2` in `Phi(T)` and divide by the common sign `(-1)^(sum(W) - k - 1)`. This layer corresponds exactly to two selected skeleton edges: marking a component decreases its index by one without changing the number of factors unless the term vanishes at the specialization `p1=0`. For a component of size `c` and total weight `s`, with signature `(c,s)`, marking contributes `(s-c) p_(s-1)` instead of `p_s`; every other component contributes its unmarked factor. A template polynomial sums over each component as the marked component separately, omitting terms containing `p1`. Components with identical weights or signatures still count separately.

For two edge types `R,D`, form:
- `D(R,D)`: the template for two separate size-two components with endpoint multisets `R,D`, and singleton complement `W - R - D`. Set it to zero when that complement is not a multiset.
- `C(a;u,v)`: the template for one size-three component with multiset `{a,u,v}` and singleton complement. Here `a` is the center weight and `u,v` are the neighbor weights.

Start with a known baseline: every unordered pair of distinct edges is provisionally assigned its disjoint template. For distinct types the count is `e_R e_D`; for equal types it is `binomial(e_R,2)`. For a pair actually sharing a center of unique weight `a`, correct the baseline by adding `C(a;u,v) - D({a,u},{a,v})`. The number of these corrections is known: for distinct neighbor weights it is `e_{a,u} e_{a,v}`, and for equal neighbor weight `u` it is `binomial(e_{a,u},2)`. Use only nonzero counts. The zero convention for impossible disjoint templates is necessary; in particular one occurrence of `a` cannot be used as two disjoint endpoints.

Every other overlap is centered at a repeated weight `a`. By independence its neighbors have distinct unique weights `u,v`, and those two vertices cannot themselves be adjacent by acyclicity. Index the unknowns `x(a;u,v)` by these unordered pairs with `e_{a,u},e_{a,v} > 0` and `e_{u,v} = 0`. Each unknown is 0 or 1, because two common neighbors would make a four-cycle. Its column is the coefficient vector of `C(a;u,v) - D({a,u},{a,v})`. Here the disjoint template is defined because `a` occurs at least twice. Any actual pair of edges is either disjoint or overlaps at exactly one of these centers, so the observed signed layer minus the known baseline and unique-center corrections is exactly the matrix times `x`.

If the matrix has full column rank over the rationals, all the `x`'s are uniquely recovered. For each repeated weight, form the graph on unique vertices with edges given by the corresponding positive `x`'s. By Addendum IV's clique argument, maximal cliques of size at least two recover the full neighborhoods of repeated vertices of degree at least two. Residual edge incidences give the degree-one repeated vertices. Edges between unique vertices were already known, and there are no repeated-to-repeated edges. Expanding skeleton weights back into leaf counts recovers `T`. This is a sufficient certificate, not a claim of full rank for all inputs.

## Explicit 47-vertex instance

Use weights `(2,3,4,5,6,5,7,8,7)` indexed from 0 and edges `03,13,34,45,46,52,67,48`. The proper tree has diameter six. Both repeated weights, 5 and 7, occur internally; edges 03 and 13 have weight sums 7 and 8, so this instance fails Addendum IV's strict edge-sum inequality with maximum weight 8.

The columns in order are `(5;2,3), (5;2,4), (5;2,6), (5;3,4), (5;3,6), (5;4,6), (7;6,8)`. Choose rows with sorted index multisets
```
(2,2,4,5,5,13,15)
(2,2,5,7,7,8,15)
(2,3,5,7,7,8,14)
(2,4,5,7,7,8,13)
(2,4,6,7,7,8,12)
(2,5,6,7,7,8,11)
(3,5,6,7,7,8,10)
```
Their determinant is `-576`. The exact companion checker constructs the certificate, independently enumerates the full two-edge layer from the actual edge pairs, and solves the minor against the enumerated layer. No finite scan is used to prove the reconstruction criterion or a universal rank theorem. Related reconstruction results are discussed in Addendum IV; no literature priority is asserted here.

# Independent audit: regular 01 branch (2026-11-17)

Verdict: the 13-point, 55-member, degree-27 **regular** 01 exclusion is correct. No exclusion of a general nonregular branch follows. One harmless wording repair is needed: the blanket crown lemma should specify at least two ground points (the family {{x}} is a one-point exception).

## Source and hypotheses

I independently read the author-uploaded transcription of Gebendorfer v2.1, Assumption 2.2, Theorem 2.6, Lemma 2.9 and Theorem 3.4 including its proof:
https://www.researchgate.net/publication/411040817_Structure_Residual-Degree_Bounds_and_Target_Capacity_for_Minimal_Regular_Counterexamples_to_Frankl%27s_Union-Closed_Sets_Conjecture

The published preprint's arena minimizes member count among regular counterexamples and then ground size. Its Theorem 3.4 is a zero-residual-codegree obstruction. We do not assert peer review or audit the remaining paper. The concrete proof below is independently valid without either minimality assumption, once separation, regularity and the specified parameters hold. This is an existing argument's numerical specialization, not a new general Frankl bound.

## Independently reconstructed proof

Let F be a simple, separating union-closed family on U, |U|=13, |F|=55, with every point degree 27.

For distinct x,y, equal-size but distinct stars imply some member contains y and avoids x. Unioning those members for fixed x yields U minus {x}; the full U is also present. Thus K={U} union {U minus {x}:x in U} has 14 members and every point has degree13 in K. No minimality is needed for this step. The residual R=F minus K has 41 members, constant degree14, and incidence sum182. R is not assumed union-closed.

In the 01 block case, the original t,p codegree is |P11|=12. Exactly12 crown members contain t,p (U and the11 co-atoms omitting neither). Hence their residual codegree is0. The two residual stars therefore have14 members each and are disjoint. For any A in the t-star and B in the p-star, union closure in F gives A union B in F. It contains t,p and cannot be residual, so it belongs to K and has size at least12. Summing |A|+|B|>=12 over all196 ordered cross pairs counts each star member14 times. Combined incidence of the28 star members is at least168.

The remaining41-28=13 residual members contain at most one empty set. There are no singleton or doubleton members in F: singleton {a} injects a-avoiding sets into a-containing sets; doubleton {a,b} injects the00 incidence cell into11, giving deg(a)+deg(b)>=55. Either possibility contradicts degrees27. Thus the remaining members contribute at least12*3=36. Total incidence is at least204, contradicting182. Even the weaker singleton-only bound gives168+24=192>182, so the exclusion does not depend on the doubleton lemma.

For case00, degree(p)=12+14=26 directly contradicts imposed regular degree27. For case10, original codegree13 leaves residual codegree1, so the zero-codegree proof does not apply.

## Scope and attempted counterexamples

The crown lemma needs regularity AND separation. A separating nonregular chain {empty,{a},{a,b},{a,b,c}} lacks two co-atoms. A regular nonseparating family {empty,U} on three points lacks every co-atom. Therefore no crown, antichain or degree-equality clauses should enter the general nonregular encoder.

The statement 'all separating regular families have the crown' additionally needs |U|>=2: {{x}} is a one-point exception. This does not affect any13-point reasoning.

Independent exhaustive Python enumeration of every family on at most4 points checks the crown lemma for n>=2 and the singleton/doubleton frequency lemma. All pass. Counts include4959 nonempty union-closed families on4 points,18 regular separated full-ground families,4918 families with a singleton or doubleton. These are finite smoke tests, not the proof of the13-point exclusion.

Files: audit_regular.py, logs/regular_audit.json.

# Slack-one four-block reduction (working derivation)

Status: conditional structural reduction, not an UNSAT proof or novelty claim. Derived independently from the Hu maximal-partner counting argument reproduced in the source appendix. No product-measure assumption.

Let A be a separating smallest Frankl counterexample with |A|=4m+3, maximum frequency n=2m+1, and choose a top t. Let p be domination-maximal among elements occurring in at least m+1 members avoiding t. Minimality supplies such p. Then p occurs with t in at least m-1 members: U and A_j for j outside {t,p}. Set W=U\{t,p}.

Write h=|P11|=m-1+e and s=|P01|=m+1+b. Since frequency(p)=h+s=2m+e+b<=2m+1, e,b are nonnegative integers with e+b<=1. Thus exactly three block-size cases remain:

|e,b|P11|P10|P01|P00|freq(p)|
|--|--|--|--|--|--|
|0,0|m-1|m+2|m+1|m+1|2m|
|1,0|m|m+1|m+1|m+1|2m+1|
|0,1|m-1|m+2|m+2|m|2m+1|

For m=13 these are (12,15,14,14), (13,14,14,14), (12,15,15,13), respectively. Each totals55. This refines the source's remark about one unit of slack; it does not eliminate any case.

## Exact complement constraints

Use the domination partial order on W, with D(j)={x:x<=j}. Each A_j contains t,p, so D(j) lies entirely in W. For each block Pab let B_ab={W\X:X in Pab}. Name H=B11, R=B10, S=B01, T=B00.

1. All four families consist of distinct downsets of W, with sizes in the table.
2. H={empty} union {D(j):j in W} when e=0. When e=1, H additionally contains one downset E distinct from empty and every D(j).
3. For every pair of block labels u,v in {00,01,10,11}, every B in B_u and C in B_v satisfies B intersect C in B_(u OR v). This covers all union-closure constraints, including within-block closure.
4. For each x in W,
   r(x)+s(x)+t(x)+d(x)+e*1[x in E] >= 2m+2,
   where d(x)=#{j in W:x<=j}. This exactly counts members avoiding x.

Constraints1–4 and the cardinalities are sufficient to reconstruct a separating union-closed counterexample: replace a complement B in block ab by (W\B) union its selected t,p bits. Distinctness within blocks and different selected bits give exactly4m+3 distinct sets. Constraint3 proves closure. Frequencies t=2m+1, p=2m+e+b<=2m+1, and constraint4 bounds every W frequency by2m+1. H contains empty so the full ground set occurs. Principal ideals distinguish W elements; members of H missing j separate j from t,p, while nonempty R,S separate t,p.

They are necessary for every smallest counterexample of this size by the maximal-partner argument. Sufficiency does not require that reconstructed t,p retain the original maximal-partner selection property. This is advantageous: no risky extra symmetry exclusion is needed.

## Redundant strengthening useful for an encoder

Let R0=intersection of R and S0=intersection of S; closure puts each in its family. The sets corresponding to A_p and A_t show R0 subset T and S0 subset T for every T in T. Alternatively derive this from cross-block closure: R0 intersect T lies in R, hence contains R0. Do not add the stronger statement R0=S0=empty, which is not justified.

All cross intersections involving E must target H; it is unsafe to restrict them to principal ideals as in the old boundary encoder. The new E option is precisely why blindly reusing that encoder would exclude legitimate candidates.

## Next verification obligations

- Independent implementation of these constraints, with a truth-table test of the four-block union/intersection dictionary.
- Sanity SAT cases after weakening the frequency bounds, decoded back into actual families and checked directly.
- Only then attempt m=13 for each of three cases, storing proof files; in parallel m=14 boundary case is needed for55/56.
- Search prior literature/source notebooks before claiming this straightforward slack decomposition is novel.

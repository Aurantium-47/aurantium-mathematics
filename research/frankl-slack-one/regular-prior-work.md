# Regular-only diagnostic, 2026-11-17

## Primary source and scope
Jonas J. Gebendorfer, *Structure, Residual-Degree Bounds, and Target Capacity for Minimal Regular Counterexamples to Frankl’s Union-Closed Sets Conjecture*, v2.1, 6 August 2026. Author-uploaded full text:
https://www.researchgate.net/publication/411040817_Structure_Residual-Degree_Bounds_and_Target_Capacity_for_Minimal_Regular_Counterexamples_to_Frankl%27s_Union-Closed_Sets_Conjecture

Relevant text inspected: Assumption 2.2, Theorem 2.6, Lemma 2.9, Theorem 3.4 and proof, and §15.1. Not a complete audit of every theorem in the 28-page preprint. The PDF download link returned 404; ResearchGate exposed the full-text transcription. The site lists DOI 10.5281/zenodo.21671811 but its page was inaccessible in this session.

The author's arena minimizes member count among regular counterexamples, then ground size. §15.1 isolates N=13,d=55,M=27, residual degree14, residual count41, incidence total182; this configuration is explicitly unresolved. Its additional kernel properties must not be presumed for arbitrary nonregular counterexamples. Cardinality counts all members, including the empty set if present, agreeing with our convention. This is prior work, not our novelty.

## Mapping and independently checked implications

Our base has total 55 members and cap27. Its reconstructed families are separating. Imposing exact degree27 for **all** points is a genuine extra assumption, not symmetry breaking.

A separated regular union-closed family on at least two ground points has every co-atom: for x!=y, distinct equal-size stars ensure a member containing y but avoiding x; union these over y. Thus the domination order is an antichain. This proof needs no minimality. In our complement encoding, H is empty plus the 11 singletons, and possibly E. The two other co-atoms correspond to empty complements in R and S; closure and regularity already force them, so no slot anchoring is imposed.

Cases indexed by (e,b):
- 00: p has degree26, hence impossible under degree27 regularity by arithmetic alone.
- 10: H has13 members, residual (t,p)-codegree1.
- 01: H has12 members, residual (t,p)-codegree0.

## Hand exclusion of regular case 01 (specializing prior Theorem 3.4)

Remove the 14 crown sets. Residual has41 sets, degree14, total incidence182. Suppose no residual set contains both t,p. Their disjoint residual stars have14 sets each. Each cross-star union must be a crown set, hence has size >=12. Summing all196 cross pairs and dividing by14 makes the combined star incidence at least168. There are13 residual sets outside these stars. At most one is empty; all others have size >=3: a singleton or doubleton in a union-closed family implies some degree >= half, by the standard union-injection argument. Their incidence is therefore >=36. Total >=204 contradicts182.

This excludes **regular** 01 without importing unproved parts of the preprint. It is a specialization of existing work, not a new general branch exclusion. It leaves regular10 unresolved and leaves every general nonregular branch unchanged.

## Executable diagnostic
`regular_diagnostic.py` imports the existing independently authored slot encoder, adds exact degree constraints and redundant antichain clauses. It intentionally does not import the zero-codegree bound as clauses, to distinguish raw SAT behavior from the hand proof.

Independent direct family oracle:243 fixed family/cap assignments on three points, including6 positive regular examples, all agree with SAT. Separate exhaustive crown check:4 regular separated full-ground union-closed three-point families, all pass. These are smoke tests, not a proof of large encoding completeness.

Run: `timeout 60s python regular_diagnostic.py --run` (from this directory; dependencies in requirements.txt)
- 00: immediate UNSAT,0 conflicts; expected degree mismatch, not a research exclusion.
- 10: UNKNOWN after21,066 conflicts (~2.4s).
- 01: UNKNOWN after20,022 conflicts (~2.3s), despite the hand exclusion above.

No large SAT certificate or new Frankl theorem obtained. The hand specialization has now passed a separate audit (see [audit](audit-regular.md)); a next step is stronger **regular10-only** constraints, not unrestricted solver retries or crown assumptions on general cases.

Reproduce the independent finite audit: `python audit_regular.py`. Its output is retained in `logs/regular_audit.json`. Diagnostic output is in `logs/regular_diagnostic.log`. These files do not modify the unrestricted encoder.

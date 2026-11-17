# Independent audit: slack_sat.py and three m=13 artifacts

Conclusion: no erroneous pruning or encoding mismatch found. No full-size SAT solve was run. This audit does not establish UNSAT.

## Logical review

- The natural-index order is a legitimate linear-extension symmetry choice. Every finite domination poset can be relabelled so that strict order edges point upward. The clauses enforce transitivity; reflexivity is implicit and opposite edges are unavailable. This does not assume the poset is a chain.
- H has exactly the empty row, one principal ideal per coordinate, and one extra row when e=1. The last row is subject to ordinary downset and pairwise distinctness conditions, not an unjustified principal-ideal restriction.
- The four XOR clauses encode d iff a differs from b. Their final disjunction enforces distinct rows within each block. Variable keys contain globally unique first-row-bit IDs for w>0, so different blocks do not accidentally share difference auxiliaries. The actual instances have w=11.
- Each pair of rows has a nonempty disjunction of witness selectors. If selected, the three bitwise implications enforce c=a intersect b exactly. At least one witness is sufficient; requiring exactly one is unnecessary. All pairs, same-block pairs, and self-pairs occur. Targets use bitwise OR of block labels. In the code, bit 0 is t and bit 1 is p; this differs from the prose's written digit convention but is internally consistent and documented.
- Negated absence-bit literals are the presence indicators. Sequential-counter constraints enforce frequency <= cap for each W coordinate. Top and partner frequency bounds are independently enforced from block sizes. All auxiliaries share the IDPool, preventing collisions.
- No R0=S0=empty condition, undocumented E exclusion, or additional partner-selection symmetry appears.
- Decoding reconstructs the expected sets. The supplied direct checker validates H, closure, distinctness, downsets, and frequency. Separation follows from the H principal-ideal witnesses and positive R/S sizes; no extra SAT condition is necessary for these instances.

## Independent tests and artifacts

`check_sat.py` uses its own raw reconstructed-family oracle and its own fixed-literal builder, not Encoding.check or Encoding.assumptions. It tests 9,600 fixed semantic assignments on W of size 3, including nontransitive candidate relations, both E branches, two slots in each non-H block, duplicate rows, and active frequency bounds. There were 109 valid assignments. SAT agreed in both directions on every assignment, and every positive model decoded back exactly.

An additional valid relaxed-cap instance has antichain W, H=[empty,{0},{1},{2},{0,1}], and R=S=T=[empty,{0,1}]. The intersection of the nonempty R and S rows requires the E target in H. The emitted SAT model selects that target correctly. This specifically tests the branch an old principal-only target encoder would wrongly exclude.

All existing SHA256 checks pass. Each three-instance DIMACS header agrees with parsed clause and variable counts, and all map semantic IDs are distinct and in range. Independently regenerated generator output matches each saved CNF clause-for-clause and each map exactly. Regeneration was generation only, not a full-size solver run.

|case|T,R,S,H sizes|variables|clauses|
|---|---|---:|---:|
|00|14,15,14,12|33141|706751|
|01|13,15,15,12|33331|712703|
|10|14,14,14,13|33564|721346|

## Proof certificate limitations

The three full-size CNFs have no supplied UNSAT certificates. A solver's future UNSAT message alone would be insufficient. Save its actual DRAT/LRAT proof, bind it to the exact CNF hash, and check it with a separate proof checker. Encoder correctness and the mathematical reduction remain separate obligations even after certificate validation.

The toy DRAT file is a single newline, because its original CNF already contains an empty clause from the impossible fixed t/p frequency bound. The empty-clause input is directly and trivially UNSAT; this does not exercise proof logging of a nontrivial learned refutation or validate an external proof-checking pipeline. Add a toy UNSAT case without an original empty clause before claiming certificate-pipeline readiness.

Suggested hardening (not fixes for discovered false pruning): retain an explicit standalone decoder accepting DIMACS models/maps; reject missing semantic model values rather than silently treating them as false; add a reproducible external checker command and a nontrivial toy checked certificate. These improve artifact usability but do not alter the reviewed formula.

## Follow-up after the initial audit
The empty-clause toy was removed from the packaged generator. The nontrivial PHP(5,4) DRAT pipeline and two rejecting negative controls are now verified; see `proof-pipeline.md`. The original audit observation above is retained for chronology. Full research instances remain UNKNOWN.

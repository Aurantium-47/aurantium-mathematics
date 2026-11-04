# Final internal verification

Date: 4 November 2026 (UTC).

**Outcome: no substantive gap found in the full proof candidate.** This remains AI-assisted work with provisional, same-family internal review. It has not received external peer review or proof-assistant verification. Historical priority is unestablished.

## Exact input

The supplied verification archive had SHA256
`edefd11415e5956dce878e1486cdbb2a9598718d71b97d77d653f82746885cba`.
All 17 entries in its original manifest matched before executing the programs.
The complete 408-line proof source was reviewed unchanged; its SHA256 is
`41b2ca55174f1caac4b954c95b45cce0ddda1fdf851adc42e1f3dc2b6eacd616`.

The publication adds this verification record, actual rerun records, the independent boundary replay, and an example/proof-route figure. The proof source and supplied PDF are unchanged. `SHA256SUMS` is regenerated for the publication contents.

## Fresh adversarial review

A fresh reviewer read the entire proof source without reading any supplied review. It checked all eight named results, the appendix, theorem-application hypotheses, coefficient and factorial conventions, formal substitutions, inequality directions, degeneracies, and the acyclic dependency chain. No fatal, critical, major or minor issue was reported; no mathematical edit was required.

The sensitive obligations checked were:

- The child-surplus bijection counts lattice points once; it does not count potentially nonunique Minkowski decompositions.
- The formal Narayana substitution is over the characteristic-zero ring Q[x], and its inverse has the required unit constant term.
- The simultaneous invariant makes the Laurent expression a nonnegative polynomial of actual degree D=2(m+d). Ordinary coefficient-preserving truncation implements precisely the shift, with no padding degree or normalization hidden in the identity.
- Coefficient extraction includes 1/(D-d)! and produces the binary form of degree d; the ULC denominator is binom(d,j).
- Positive singleton weights give positive coefficients throughout the trimmed support. Degree zero/one, single leaves, zero internal weights, forests, empty fibres and the empty-permutation convention are explicitly covered.
- Defant's exact refined fertility formula applies to every nonempty fixed fibre with m=k+1 and Q=n-k. The x-exponent shift and zero padding are correct.

The reviewer also checked seven explicit laminar examples, nine polynomial expressions and a separate recursive implementation scanning all 5,913 permutations of sizes 1-7, with 420 nonempty fibres. These supporting checks found no counterexample. They are independent supporting checks, not the all-parameter proof.

## Executor reproduction

Both supplied standard-library programs were rerun under Python 3.12. Their complete outputs matched the supplied records exactly.

| Check | Reproduced coverage |
| --- | --- |
| Direct permutation enumeration | 4,037,913 permutations of sizes 1-10; 89,261 nonempty fibres |
| Laminar comparisons | 204 deterministic weighted tree cases |
| Independent positive-composition enumeration | 12,492 positive compositions; 204 comparisons |
| Exact quadratic Hessians | 22,088 tests |
| Full M-convex support checks | 30 cases |
| Ordinary finite tail-shift comparisons | 204 cases |
| Explicit fixture | 50 lattice points; coefficients [50,457,1469,2131,1469,457,50] |

See `../verification/final_rerun_laminar_lift.txt`, `../verification/final_rerun_permutation_fibres.txt` and `../verification/final_rerun_results.json`.

The supplied SymPy program was not rerun because SymPy was unavailable. A separate standard-library rational/Sturm implementation, `../verification/check_boundary_stdlib.py`, instead reproduced its key boundary certificates: discriminants -3 and -4, the exact fertility factorization, and the degree-eight Cauchy obstruction with six negative real roots and two nonreal roots. These obstruct stronger proposed proof mechanisms; they are not counterexamples to Defant's real-rootedness conjecture.

## Primary sources and bounded prior-art search

The original problem was rechecked directly on printed page 37 of [Defant's 2020 paper](https://www.mat.univie.ac.at/~slc/wpapers/s82defant.pdf#page=37). The general log-concavity question is explicitly stated after the real-rootedness Conjecture 31.

The following imported statements were checked for their exact formulation and applicability, not reproved in full:

- [Defant, Fertilitopes](https://arxiv.org/html/2102.11836v2): Section 2.6, Theorems 3.1/3.2, and the displayed refined fertility formula following them.
- [Brändén-Huh, Lorentzian polynomials](https://web.math.princeton.edu/~huh/Lorentzian.pdf): homogeneous Lorentzian characterization, nonnegative substitutions, derivatives, products, and binary ULC normalization.
- [Ross-Süss-Wannerer, Dually Lorentzian Polynomials](https://arxiv.org/pdf/2304.08399): Definition 3.2 and Proposition 3.3 use ordinary coefficients in truncation.

A new bounded web search used eight target/structural queries, including `"stack-sorting" "fibers" "log-concavity" proof`, `"stack-sorting" "ultra-log-concave"`, `"laminar" "Narayana" Lorentzian`, `"fertilitopes" "log-concavity" proof`, `"fertilitope" Lorentzian proof`, and the two fibre spellings. No earlier complete resolution was identified. The original literature audit's nearby-work comparisons were spot-checked against the primary texts of [Alexandersson-Jal](https://arxiv.org/html/2410.00127v3), [Mao-Wang](https://arxiv.org/html/2607.01572v1), and [Bóna](https://arxiv.org/html/2505.18295v4). Those results do not supply a demonstrated reduction resolving this exact fixed-fibre question. This is a bounded negative finding, not a priority certificate or a guarantee of current worldwide open status.

## PDF and publication boundaries

All nine pages of the supplied PDF were rendered and visually inspected. They are readable, with equations and references inside the page bounds. PDF author metadata is blank; there are no embedded attachments or JavaScript. A local rebuild was not completed: the compilation service returned an unknown outcome and local MiKTeX encountered configuration access denied. The original PDF is retained unchanged, and no successful rebuild in this environment is claimed.

Only proof/reproduction material and public mathematical reviews are included. No private conversation, handoff file, credentials, downloaded third-party full text, invented author/affiliation/endorsement, or new license is included.

The precise claim remains an **AI-assisted full proof candidate for the general fixed-fibre log-concavity question raised after Defant's 2020 Conjecture 31, strengthened to trimmed ULC**. The stronger real-rootedness conjecture is not resolved by this work. The Lorentzian framework, truncation theorem, fertility formulas and broad Lorentzian suggestion remain credited prior work.

# Verification record · 11 November 2026

The publication scripts were run with Python 3.12.14 and use only Python's standard library and exact integer or rational arithmetic. They were run on the published source files; the recorded commands and outputs are listed below.

| Command | Result |
| --- | --- |
| `python3 scripts/verify_coefficients.py` | Every a,b≥1, M≥1 with m≤24: 1,078 symmetry representatives, 8,712 inequalities, 3,551,042 positive monomial coefficients; every remaining coefficient nonnegative and every remainder constant positive. |
| `python3 scripts/verify_direct.py` | Independent factor-product and sparse-loop implementation for M≥4, m≤18: all 1,568 inequalities pass; the canonical digest of all row summaries agrees with the corresponding interpolation/packed-integer result. |
| `python3 scripts/check_probability.py` | Exact Catalan-power normalization, beta-binomial joint masses, interval identities, full-block ratios, parity factors, the m=7 and m=17 retention-probability obstructions, and the common-factor remainder formula. |
| `python3 scripts/check_recursion.py` | All normalizations and means; 360 derivative coefficient identities and 5,100 point-mass recurrence identities. |

## Evidence and reproducibility

The result JSON and terminal output for each command appear in `results/`. `coefficients.json` includes per-degree inequality counts and SHA-256 digests of the canonical row summaries. A row records a,b,M,k, the positive-coefficient count, and the constant term. Canonical serialization sorts the keys, uses compact JSON separators, and orders rows by (m,a,b,k). The scripts reconstruct and check the polynomial coefficients directly; a row-summary digest is not presented as a full coefficient table.

The coefficient proof uses exact interpolation at enough points to recover a known-degree polynomial, followed by coefficientwise verification. The points are not positivity samples. Packed multiplication has a proven no-carry bound, described in [PROOF.md](PROOF.md). The direct implementation uses a different block construction, scale calculation, and multiplication algorithm.

The probability checker uses four rational parameter pairs, including values below 1, and all m=3,…,14. The recursion checker uses four rational pairs and all m=0,…,19. These finite checks test implementations; the all-positive-real identities are proved algebraically in [PROBABILITY.md](PROBABILITY.md) and [RECURSION.md](RECURSION.md).

## Scope of review

Independent AI-assisted reviews checked the block normalization, ULC factors, parameter enumeration, symmetry, interpolation degree, carry bound, probability factorization, parity simplification, derivative identity, mixture weights, and exact counterexamples. The public scripts were rerun after preparation. This is a computer-assisted mathematical proof of the stated finite-degree theorem and ordinary proofs of the identities, not a proof-assistant formalization or a human peer-review report.

The finite theorem requires p,q≥1, while the probability and recursion identities hold for p,q>0. No unrestricted-degree ULC theorem or real-rootedness theorem is inferred. The example a=1,b=2,M=4,p=q=1 violates an auxiliary log-concavity condition, not gamma-ULC.

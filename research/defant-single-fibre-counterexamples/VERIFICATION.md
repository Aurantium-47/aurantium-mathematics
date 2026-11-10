# Verification record · 10 November 2026

All checks below were run successfully on the publication files with Python 3.12.14 and SymPy 1.14.0.

| Check | Verified result |
| --- | --- |
| `source/verify_stdlib.py` | Original-coordinate Narayana dynamic programming; every coefficient; both factorizations; exact negative discriminants; 2,046,730,147 and 259,330,500 lattice points; explicit permutations and descent counts. |
| `compact/check_compact.py` | Independent gamma-basis computation; exact agreement with all normalized coefficients; exact rational Laguerre violations at 39/10 and 407/100. |
| `verify_direct_stack.py` | Independent recursion from the definition of stack sorting; all 72 and 75 coefficients of the full fibre polynomials agree. No geometric correspondence is used in this check. |
| `sturm111/check.py` | Degree-12 F has 10 positive real roots and two nonreal roots and is squarefree. |
| `sturm112/check.py` | Degree-11 F has 9 positive real roots and two nonreal roots and is squarefree. |

Each nonreal z root gives two nonreal x roots under (1+x)²+zx=0. Each positive real z gives two distinct negative real x roots, since the discriminant is z(z+4)>0. The remaining displayed factors have only real roots. Consequently each full fibre polynomial has exactly four nonreal roots, counted with multiplicity.

The accompanying output files record the exact values and Sturm signs. The root-count scripts regenerate their full exact Sturm sequences and data. `SHA256SUMS.txt` records the publication files.

An independent AI review reran the arithmetic, derived the direct stack-sorting verifier, and checked the geometric construction against the primary text of *Fertilitopes* v2: Proposition 3.8, the proof of Lemma 3.9, Theorem 3.1, and the formula preceding Corollary 3.3. This package is a mathematical proof with reproducible exact computation, not a proof-assistant formalization or a human peer-review report.

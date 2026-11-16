# Eulerian TP4 finite certificates

A reproducible reconstruction of the TP4 candidate announced in Jianxi Mao, *Eulerian triangle is totally positive of order 3*, arXiv:2608.29224v1, Remark 1.2. The reduction covers arbitrary row indices.

**Result:** 245 local coefficient determinants, 126 nonzero. Of these, 120 have nonnegative coefficients; the remaining six have short Muirhead certificates. A second implementation independently recomputes every local polynomial using the Leibniz determinant formula.

Read `PROOF.md` for the reduction, strictness, boundaries, attribution and precise scope. This repository does not claim priority for TP4 or a solution to total positivity of all orders.

## Reproduce
Requires Python 3 and SymPy (tested with SymPy 1.14).
Run from this directory:

```sh
python local.py > result.log
python certificate.py
python audit_independent.py > independent.log
```

`local_u0.txt` through `local_u6.txt` are exact integer polynomials, not floating-point root approximations. `certificates.json` identifies each local positivity certificate. `independent_results.json` records the second implementation's checks. `derive.py`, `ordered.py` and `orbits.py` are auxiliary derivation/exploration scripts; the acceptance checks are in the two verifier scripts above.

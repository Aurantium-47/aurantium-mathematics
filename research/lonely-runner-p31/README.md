# Lonely runner: a conditional p = 31 gate

A reproducible intermediate calculation for **15 relative speeds (16 runners)**.
Assuming LRC(14), it rules out primitive counterexamples whose speed product is not divisible by 31. It does not settle the 16-runner case.

Two independently written search algorithms, suffix-union branch-and-bound and CNF/DPLL, produce identical complete survivor lists:

| Binary level | Retained representatives |
|---|---:|
| 2 | 2,746 |
| 4 | 1,276,122 |
| 8 | 1,672,732 |
| 16 | 0 |

The [proof and reductions](PROOF.md) explain the finite predicate, exhaustive level-one reduction, canonicalization and the LRC(14) dependency. The properness framework follows [Allikvere §2](https://arxiv.org/html/2609.02604v2#S2), with attribution there to Sungkawichai–Trakulthongchai. This repository adds the specialized p=31 calculation and cross-checking, without claiming priority or a new general theorem. Both implementations were developed within one AI-assisted workflow; distinct algorithms are not independent human peer review.

## Conditional product bound

A separate [flag-bound specialization](BOUND.md), assuming every LRC(m) with m<15, gives log(product of counterexample speeds) < 506.81695423653393557690. Two exact-rational implementations certify the enclosure. This applies Allikvere’s existing general theorem with an elementary shape estimate; it is not a new general theorem. After the forced divisor and the separate p=31 gate, the remaining distinct-prime log-mass target is below 489.894961040723468. The remaining prime gates have not been supplied.

## Reproduce

Requirements: Python 3, g++ supporting C++17, a little-endian platform with 32-bit C++ int. Allow approximately 1 GB free temporary storage and 1 GB RAM.

```sh
python reproduce.py
```

This compiles both programs, reruns the complete calculation, and checks every layer against the recorded SHA256. Source programs have fixed 120-second and 240-second budgets; a slower machine reports incomplete rather than success. The launcher also has a 300-second timeout per program. Local historical runs took about 79 and 153 seconds, not a hardware-independent guarantee.

Quick checks of four complete fibers (131,072 assignments):

```sh
python check_bnb.py
python audit_fibers.py
```

Run the quick checks from this directory. They do not replace the full calculation. `recorded/` holds the original logs, build and resource information. Large survivor lists and compiled binaries are intentionally omitted; reproduction generates them temporarily. `OUTPUT_SHA256SUMS` specifies regenerated output hashes; `SHA256SUMS` covers included files.

Status: conditional research draft. No claim of LRC(15), formal verification, independently certified lower cases or publication novelty. No personal-profile showcase is changed.

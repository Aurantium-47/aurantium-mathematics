# Proper-tree reconstruction with one repeated skeleton weight

A sufficient reconstruction criterion for a restricted family: a proper tree whose skeleton has exactly one weight of multiplicity two, all other weights distinct, all weights divisible by q >= 2, and distinct weight submultisets having distinct sums is determined, among proper trees, by its specialized first power-sum derivative Phi.

The repeated pair may occupy internal skeleton vertices. The example weights q,q,qB,...,qB^(k-2), B >= 3, gives nonempty families in arbitrary skeleton shapes. These strong arithmetic restrictions are part of the result.

[Proof and references](PROOF.md). The proof uses Awan's existing master formula and general weight-recovery lemma, then extracts connected colored triples and reconstructs two-column adjacency data. No claim is made to solve Stanley's general conjecture, cover unrestricted diameter-six trees, or establish priority.

## Reproduce the checks

Python 3.10+; standard library only. From this directory:

```sh
python checks/signature.py
python checks/forest.py
sha256sum -c SHA256SUMS
```

- `signature.py`: all 18,247 labelled skeleton trees on 3 through 7 vertices; colored edge/triple data determines the tree up to swapping the repeated pair.
- `forest.py`: an independently implemented full forest expansion on all 1,440 labelled skeletons on 3 through 6 vertices; 34,271 exact coefficient identities checked, including q=2.

Finite checks corroborate the written argument; they do not replace it. The draft has undergone AI-assisted mathematical and code review, not independent human peer review or formal verification.

## Lean investigation

The source of Awan's accompanying Lean project was inspected at commit 2827a80aba46196bb8a2a25760df548bef0f3e6d. It defines the chromatic symmetric function through Stanley's power-sum expansion and does not separately formalize the passage from proper colorings to that expansion. Our clean-build attempt stopped when official Mathlib cache downloads were rate-limited; no successful build is claimed. This note's new criterion has not been formalized in Lean.

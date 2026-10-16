<div align="center">

# Aurantium · Mathematics

**Proofs, counterexamples, and extensions in combinatorics, graphs, and polynomials**

[中文](README.md) · [English](README.en.md) · [Lean sources](formalizations/README.md) · [Research background](REPORT.zh.md) · [References](SOURCES.md)

</div>

---

This collection brings together AI-assisted research in combinatorics, graph theory and polynomials: all-parameter proofs, exact counterexamples and structural extensions.

| Public research projects | Projects with Lean results | Extension groups |
| :---: | :---: | :---: |
| **24** | **8** | **7** |

By primary result, the collection contains 10 affirmative target projects, 3 counterexample-focused projects, 7 further-progress projects, 3 construction/classification projects, and 1 parallel treatment. The repository includes [189 Lean source files from eight fixed public versions](formalizations/README.md).

**Highlights:** the remaining cases of Howroyd’s 2018 classification problem; all-index Lecture Hall polynomiality with SAGBI and toric-degeneration extensions; chemical-graph degree extremizers for every n ≥ 7; a 237-step fence-rowmotion counterexample; and a sharp 23-colour bound for K6 clique chains.

**Mathematical areas:** extremal graph theory, algebraic combinatorics, commutative algebra, real-rootedness and interlacing, enumerative geometry.

The project entries below connect each result to its original question, earlier literature, proof and verification materials.

## Selected problems

### Howroyd’s 27-set classification · posed in 2018

[OEIS A297557](https://oeis.org/A297557) records Howroyd’s conjecture dated 1 January 2018. Machacek proved the divisible-by-three branch in work published in the LAGOS 2021 proceedings, Procedia Computer Science 195. This project completes the remaining residue classes and classifies all maximum independent sets: three background classes, each with nine corner extensions, explain the number 27. The remaining-branch theorem is formalized in Lean.

[Proof and classification](https://github.com/Aurantium-47/howroyd-27-conjecture)

### Lecture Hall polynomiality · posed in 2018

[Katthän’s paper](https://arxiv.org/abs/1809.01377), associated with the Osaka lattice-polytopes workshop, proposed polynomiality and algebraic-structure conjectures and reported computations through length 12. This project identifies the sequence with signed Dyck-path sums and proves polynomiality for every index. Further written results construct a minimal monic SAGBI basis, identify its leading exponents with a Hilbert basis, and give a flat toric degeneration. The polynomiality and path-identification core is formalized in Lean. Flajolet’s continued-fraction theory and Sokal’s exposition supply credited classical tools.

[Proof and algebraic extensions](https://github.com/Aurantium-47/lecture-hall-polynomiality)

### Chemical-graph extremizers · a 2024 conjecture

Knor, Škrekovski, Filipovski and Dimitrov posed Conjecture 10 in Applied Mathematics and Computation. Later work in Discrete Mathematics Letters covered the divisible-by-four case. This project classifies the maximizing degree multiplicities for every n ≥ 7, covers all four residue classes, proves connected realizability, and formalizes the original target in Lean.

[All-parameter classification](https://github.com/Aurantium-47/chemical-graph-sigma-extremizers)

### Peak polynomials · Experimental Mathematics, 2016

Billey, Fahrbach and Talmage’s root conjecture belongs to a line of work including the 2017 JCTA positivity theorem and Li’s 2026 coefficient results. The project gives an integral sign argument on the entire interval between the last two peaks. Its additional analysis addresses the remaining noninteger portion; already-known positivity consequences are credited to their sources.

[Root exclusion and sign analysis](https://github.com/Aurantium-47/peak-polynomial-last-real-root)

### Fence rowmotion · Algebraic Combinatorics, 2023

Elizalde, Plante, Roby and Sagan studied orbit statistics on fence posets. A 237-step orbit on 32 elements has cardinality sum 3774 and mean 1258/79 rather than 16, refuting Conjecture 5.4(b). The complete certificate and least-period statement are kernel-checked in Lean.

[Counterexample and certificate](https://github.com/Aurantium-47/fence-rowmotion-counterexample)

### K6 clique chains · a 2025 conjecture

Furmańczyk, Gözüpek and Özkan proposed a uniform 22-colour packing bound. The 450-vertex graph H75 rules out 22 colours; a periodic construction gives a sharp uniform bound of 23. The negative rank certificate contains 16,646,562 records and has Python/C++ checking implementations.

[Sharp bound and exact certificate](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring)

## Mathematical areas

Algebraic combinatorics; extremal graph theory; commutative algebra; discrete geometry; real-rooted polynomials and interlacing; enumerative geometry; asymptotic analysis; dynamical algebraic combinatorics.

Concrete methods include Dyck paths, Stieltjes–Rogers polynomials, Toeplitz/Hankel determinants, SAGBI and Hilbert bases, toric degeneration, Pólya-frequency sequences, monotone Hurwitz numbers, and finite-state rank certificates. Computational tools include Lean 4 / mathlib, Python / SymPy, C++17, and LaTeX, as used in the linked projects.

## Literature and extensions

The bibliography contains 24 problem-source records and 36 related studies or classical tools, covering more than one hundred listed author names. Seven project-level extension groups are highlighted. Karp is listed as a parallel treatment of a result submitted earlier by Zweiman: our manuscript retains a Beta-moment route, a parameterized transform lemma and a symmetric-weight corollary. The main target overlaps. See the [dated comparison](KARP_COMPARISON.md); these additions are not counted as a confirmed new extension group.

Problem dates and venue information are given in the [research background](REPORT.zh.md). Source dates describe the documented history; each project's exact contribution is stated separately.

<details>
<summary><strong>All 24 projects</strong></summary>

| Repository | Status |
| --- | --- |
| [howroyd-27-conjecture](https://github.com/Aurantium-47/howroyd-27-conjecture) | Includes Lean results |
| [chemical-graph-sigma-extremizers](https://github.com/Aurantium-47/chemical-graph-sigma-extremizers) | Includes Lean results |
| [stern-polynomial-positivity](https://github.com/Aurantium-47/stern-polynomial-positivity) | Includes Lean results |
| [hardinian-array-asymptotics](https://github.com/Aurantium-47/hardinian-array-asymptotics) | Includes Lean results |
| [triangle-free-circulant-existence](https://github.com/Aurantium-47/triangle-free-circulant-existence) | Includes Lean results |
| [nonmixed-five-point-packing](https://github.com/Aurantium-47/nonmixed-five-point-packing) | Includes Lean results |
| [lecture-hall-polynomiality](https://github.com/Aurantium-47/lecture-hall-polynomiality) | Includes Lean results |
| [fence-rowmotion-counterexample](https://github.com/Aurantium-47/fence-rowmotion-counterexample) | Includes Lean results |
| [k6-clique-chain-packing-coloring](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | Written proof / exact verification |
| [rook-polynomial-unimodality](https://github.com/Aurantium-47/rook-polynomial-unimodality) | Written proof / exact verification |
| [even-catalan-hankel-degrees](https://github.com/Aurantium-47/even-catalan-hankel-degrees) | Written proof / exact verification |
| [numerical-semigroup-endpoint-residues](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | Written proof / exact verification |
| [peak-polynomial-last-real-root](https://github.com/Aurantium-47/peak-polynomial-last-real-root) | Written proof / exact verification |
| [karp-order-two-real-rootedness](https://github.com/Aurantium-47/karp-order-two-real-rootedness) | Literature comparison in progress |
| [gap-five-gaussian-quotients](https://github.com/Aurantium-47/gap-five-gaussian-quotients) | Written proof / exact verification |
| [hurwitz-single-cycle-genera-two-three](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | Written proof / exact verification |
| [eventual-infinite-log-concavity](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | Written proof / exact verification |
| [stanton-eleven-entry-w-positivity](https://github.com/Aurantium-47/stanton-eleven-entry-w-positivity) | Written proof / exact verification |
| [unit-translation-coefficient-oscillation](https://github.com/Aurantium-47/unit-translation-coefficient-oscillation) | Written proof / exact verification |
| [hoggatt-row-sum-moments](https://github.com/Aurantium-47/hoggatt-row-sum-moments) | Written proof / exact verification |
| [narayana-polytope-counterexamples](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | Written proof / exact verification |
| [peak-and-x-descent-growth-rates](https://github.com/Aurantium-47/peak-and-x-descent-growth-rates) | Written proof / exact verification |
| [fixed-length-fertility-counterexample](https://github.com/Aurantium-47/fixed-length-fertility-counterexample) | Written proof / exact verification |
| [clique-join-domination-polynomials](https://github.com/Aurantium-47/clique-join-domination-polynomials) | Written proof / exact verification |

</details>

## Collaboration

The Hardinian kernel-polynomial integration and related algebraic verification are complete; collaborative generalizations will be added when ready. I lead problem selection, research organization, assessment and delivery, with AI assistance in derivation, implementation and verification. Sources and collaborators receive credit for their actual contributions.

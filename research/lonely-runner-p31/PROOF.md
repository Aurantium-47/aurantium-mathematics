# A conditional p = 31 gate for fifteen relative speeds

Research draft, 2026-11-16. Not a claim of the sixteen-runner conjecture, novelty, formal verification, or human peer review.

## 1. Statement and provenance

Write ||x|| for distance to the nearest integer. We use LRC(s) for the assertion that every s-tuple of nonzero integer speeds has a time at which all distances are at least 1/(s+1). Thus sixteen runners correspond to fifteen relative speeds and threshold 1/16.

**Conditional proposition.** Assume LRC(14). Subject to the finite computation described and independently cross-checked below, every primitive integer counterexample to LRC(15) has a speed divisible by 31.

Here primitive means gcd of all fifteen speeds is 1. Speeds may be taken positive by changing individual signs. Repetitions are allowed in this statement; LRC(14) is used in its all-tuples form. If it is stated only for distinct speeds, assume all LRC(s), s <= 14, and collapse repetitions when invoking it.

For comparison, [Allikvere, arXiv:2609.02604v2, §2, Definition 2.1 and Lemma 2.2(i)](https://arxiv.org/html/2609.02604v2#S2) provide the general properness and prime-divisibility framework, attributed there to Sungkawichai–Trakulthongchai. Their stated criterion assumes k >= 3, all lower LRC cases, and a primitive positive counterexample with distinct coordinates. Our parameters satisfy k = 15 and p = 31; levels are powers of two coprime to p. The specialized proof below supplies its reduction directly. No unit-orbit reduction, generalized criterion 2.2(ii), lattice-product bound, or claim about any other prime is needed.

## 2. Exact finite predicate

For level l in {1,2,4,8,16}, put M = 31l. For a residue tuple w with no coordinate divisible by 31, call it grid-good if some integer t, 1 <= t < M, satisfies

    M <= 16*(t*w_i mod M) <= 15*M   for every i.

Residues are always in [0,M-1]. This is precisely ||t*w_i/M|| >= 1/16, including equality. The negation for a coordinate is the strict condition 16*r < M or 16*(M-r) < M. No floating-point operation is involved. The t = 0 class cannot be a witness. Replacing t by M-t preserves every distance, so testing 1 <= t <= floor(M/2) is equivalent to testing all nonzero classes.

Call w gcd-good if gcd(l,w_j : j != i) > 1 for some omitted coordinate i. Retain only tuples that are neither grid-good nor gcd-good. These are the improper tuples in the terminology of the cited framework.

A grid witness persists on lifting from M to 2M: time t/M becomes 2t/(2M). A common divisor of l and fourteen coordinates also persists at level 2l. Thus an improper tuple at a higher level must descend from an improper tuple at the previous level.

## 3. Why gcd-good classes contain no primitive counterexample

Since l is a power of two, gcd-good implies fourteen specified actual speeds are even. Congruence modulo M preserves this assertion because l divides M. If the fifteenth speed is also even, the actual integer tuple is not primitive.

Otherwise the fifteenth speed is odd. By LRC(14), choose t0 for the fourteen even speeds with distances at least 1/15. At t0+1/2 those fourteen distances are unchanged. The phases of the odd speed at t0 and t0+1/2 differ by 1/2 modulo one. At least one of two opposite phases has distance at least 1/4 from an integer. Choosing that time gives all fifteen distances at least 1/16. This argument is valid for every integer tuple in the residue class, even if the witnessing real time is not on the chosen finite grid.

This is exactly why deleting gcd-good classes is legitimate for the conditional counterexample argument but does NOT establish a grid witness for every deleted class.

## 4. Exhaustive level-one reduction

Assume no speed is divisible by 31. At level one, each speed a rules out exactly two nonzero time classes: t*a = +1 or -1 modulo 31. Indeed 31/16 lies strictly between 1 and 2, so these are the only nonzero residues of distance less than the target. There are thirty nonzero time classes and fifteen speeds.

If their fifteen bad pairs fail to cover all thirty time classes, there is a grid witness. If they cover all thirty, each pair occurs exactly once. The map from a sign class {a,-a} to its inverse time pair {a^(-1),-a^(-1)} is a bijection on the fifteen sign classes modulo 31. Therefore any level-one improper tuple contains all fifteen sign classes exactly once. Individual sign changes and permutation bring it to the single representative

    (1,2,...,15).

This does not assume the input residues were distinct: distinct sign classes follow from the covering argument. There is no nontrivial gcd-good condition at l = 1.

## 5. Lifting and canonical representatives

A parent v modulo M has exactly 2^15 lifts modulo 2M:

    w_i = v_i + epsilon_i*M, epsilon_i in {0,1}.

After retaining improper lifts, replace each coordinate x by min(x,2M-x), then sort the coordinates. This is canonicalization only under individual signs and permutations. Both transformations preserve the grid predicate and gcd-good predicate. They also induce bijections between the complete lift fibers of equivalent parents. For example the negative of a lift of x reduces to -x modulo M, and negation permutes the two lift choices. Hence retaining one representative of each orbit loses no improper orbit. This argument iterates at each doubling.

Consequently induction proves: after level l, the stored canonical list represents EVERY improper tuple modulo 31l, not merely the lifts of some unproved selection of level-one states. Previous good classes are omitted only using the monotonicity established in §2.

## 6. Two enumeration algorithms

**Program A: suffix-union branch bound.** For each coordinate and each of its two lifts, compute the set of folded grid times where it is bad. A full assignment is grid-bad exactly when its fifteen selected bad sets cover the time universe. At a partial assignment, form the union of the selected bad sets and all bad sets available to every remaining coordinate. If this union misses a time, that time is good for EVERY completion, so pruning is sound. Otherwise branch on both choices. At depth fifteen the test is exact. This proves that all and only grid-bad assignments are emitted before gcd deletion.

**Program B: CNF/DPLL.** For each of all M-1 nonzero times, form a clause asserting that at least one coordinate is bad. A coordinate bad for both choices makes that clause tautological; one bad for exactly one choice supplies the corresponding literal. Empty clauses are contradictions. Their conjunction therefore has exactly the grid-bad assignments as models. Unit propagation forces the sole remaining literal of an unsatisfied unit clause; an empty unsatisfied clause rejects the branch. Branching on both values of an unassigned variable is exhaustive. When all clauses are already satisfied, the implementation still enumerates all free-variable assignments. Thus no models are lost.

The implementations construct their constraints differently and use different search logic. They intentionally share the same proven gcd and canonicalization rules. Agreement is an independent software cross-check, not a proof assistant certificate or independent human peer review.

## 7. Finite computation and direct checks

The saved complete runs give:

| l | Parent representatives | Raw grid-bad lifts | Retained representatives |
|---|---:|---:|---:|
| 2 | 1 | 2,747 | 2,746 |
| 4 | 2,746 | 1,276,122 | 1,276,122 |
| 8 | 1,276,122 | 1,672,732 | 1,672,732 |
| 16 | 1,672,732 | 0 | 0 |

The audit inspected both sources and logs and executed byte comparisons of the complete sorted survivor files at every level: all four pairs are identical. Program A's archival run exited 0; its recorded wall time is 78.74 seconds. Program B completed all levels within its 240-second cap; its final cumulative timestamp is 152.56 seconds, with no INCOMPLETE marker. These are local run measurements, not performance promises.

Program A additionally compares every mask to exhaustive enumeration at levels 2 and 4. Program B includes full brute-force fiber checks at first/middle/last parent positions. A separate Python audit using good-time intersections, rather than the original bad-time bitsets, independently checked all 32,768 masks for one stored fiber at each level. This is 131,072 independently checked assignments, not exhaustive direct checking of every high-level mask.

The final empty list, together with §5 and the exact search algorithms, yields I(15,31,16) empty, conditional only on the correctness of the finite program execution for this finite fact. The lower LRC hypothesis is not required to define or enumerate I; it is needed for its implication about actual primitive counterexamples.

## 8. Concluding the conditional proposition

Let v be a primitive counterexample with 31 dividing none of its speeds. Reduce modulo 496 = 31*16. By the completed finite calculation this class is grid-good or gcd-good. In the former case its grid time is also a witness for the actual speeds, since integer congruence preserves phases at denominator 496. In the latter case §3 contradicts its being a primitive counterexample, using LRC(14). Both cases are impossible. Thus 31 divides the product of the speeds.

## 9. Scope and remaining gaps

This establishes at most one modular gate by computer-assisted reasoning. It does not prove LRC(15), establish a sufficient set of primes, or independently verify the lower-dimensional input. No first-discovery claim has been checked.

Both full implementations were authored within the same assistant workflow. They are distinct algorithms but not independent human research. The audit inspected sources, compared full output files, and ran separate fiber checks; it did not itself rerun both complete archived executables. Stored hashes detect changes but do not prove program correctness. For formal verification, one would need a trusted checker or proof-assistant development of the reductions and finite coverage.

The fixed integer bounds are safe for this run: modulus <= 496, folded bitset size <= 248, fifteen-bit lift masks. Generalizing the program to larger levels or dimensions requires revisiting capacities and overflow. Survivor files contain fifteen native 32-bit integers per record, little-endian on the recorded platform. A portable checker should specify that encoding explicitly.


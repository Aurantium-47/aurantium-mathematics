# Literature and scope audit for fixed fiber descent log concavity

Review date: 4 November 2026, UTC.

## Conclusion

The proposed conclusion addresses a genuine, explicitly stated specialist question: log-concavity of the descent distribution on every fiber of West's stack-sorting map. It is the weaker question immediately following Defant's 2020 real-rootedness conjecture, not the real-rootedness conjecture itself. A 2023 primary paper explicitly records log-concavity as unknown. The bounded search documented below did not identify an earlier general resolution, but it does not establish priority or certify worldwide open status as of the review date.

This is a literature and claim-boundary audit of a proof candidate. It is not a claim of human peer review, journal acceptance, or formally verified mathematics. No author was contacted and nothing was submitted or published during this review.

## Exact proposed conclusion

Let \(s\) be West's stack-sorting map, let \(n\geq1\), and let \(\pi\in S_n\) have \(k=\operatorname{des}(\pi)\) and a nonempty fiber. Set

\[
f_r(\pi)=\#\{\sigma:s(\sigma)=\pi,\ \operatorname{des}(\sigma)=r\},
\qquad d=n-2k-1.
\]

The proposed theorem is that

\[
A_\pi(x)=x^{-(k+1)}\sum_{s(\sigma)=\pi}x^{\operatorname{des}(\sigma)+1}
=\sum_{j=0}^{d}f_{k+j}(\pi)x^j
\]

has degree exactly \(d\), positive coefficients throughout \(0,\ldots,d\), and

\[
\left(\frac{f_{k+j}(\pi)}{\binom dj}\right)^2
\geq
\frac{f_{k+j-1}(\pi)}{\binom d{j-1}}
\frac{f_{k+j+1}(\pi)}{\binom d{j+1}}
\quad(1\leq j<d).
\]

Thus the nonzero central block is ultra-log-concave of order \(d\). Ordinary log-concavity follows, including the forced zero entries outside \(k,\ldots,n-k-1\). Empty fibers have an identically zero descent sequence and can be included in the ordinary log-concavity conclusion. The cases \(d=0,1\) have no internal inequalities. If the empty permutation is allowed, handle \(n=0\) separately rather than using the displayed degree formula.

The general lattice-sum statement must retain its hypotheses: a finite laminar family containing every singleton, integral nonnegative simplex weights, and singleton weights at least one. For
\(P=\sum_I y_I\Delta_I\subseteq\mathbb R^m\) and \(Q=\sum_Iy_I\), the candidate establishes ULC of order \(Q-m\) for
\(x^{-m}\sum_{q\in P\cap\mathbb Z^m}\prod_iN_{q_i}(x)\).
Do not silently extend this to arbitrary generalized permutohedra, arbitrary discrete polymatroids, nonlaminar families, or zero singleton weights.

No real-rootedness conclusion follows merely from ULC or the binary Lorentzian conclusion. The candidate therefore does not resolve Defant's Conjecture 31, or the real-rootedness assertions of Fertilitopes Conjectures 1.1 and 1.2. It also does not automatically prove descent log-concavity for arbitrary unions of fibers or all iterated stack-sortable classes: sums of log-concave sequences need not be log-concave.

## Original problem and standing

Defant's *Stack-Sorting Preimages of Permutation Classes*, Séminaire Lotharingien de Combinatoire 82 (2020), Article B82b, printed page 37, defines \(f_r(\pi)\) as fixed-fiber descent counts. Conjecture 31 asks for their real-rootedness. The following paragraph explicitly proposes proving their log-concavity as a weaker goal. The preceding paragraph credits Bóna with symmetry and unimodality. The numbering and page were checked in the original PDF, not inferred from a problem database. [Original article, page 37](https://www.mat.univie.ac.at/~slc/wpapers/s82defant.pdf#page=37)

This evidence supports the description “an explicit open question in specialist enumerative combinatorics, recorded in 2020 and still stated as unknown in 2023.” It does not support presenting the question as a classical grand conjecture, or equating progress on its weaker conclusion with a solution of the stronger named conjecture. That assessment concerns the documented formulation and scope, not a numerical ranking of mathematical importance.

## Known ingredients that require credit

### Defant's polyhedral reformulation

In *Fertilitopes*, Discrete & Computational Geometry 70 (2023), 713–752, Theorem 3.1 identifies valid compositions with all lattice points of the fertilitope. Theorem 3.2 identifies nonempty fertilitopes with integral binary nestohedra. The refined fertility formula becomes the Narayana-product lattice sum. Corollary 3.3 proves equivalence of the two real-rootedness formulations. Section 1 explicitly says the associated log-concavity is also unknown. Section 2.6 supplies the laminar interval structure; Corollary 2.11 gives integral weights. These are established input theorems, not contributions of the candidate. [Journal article](https://doi.org/10.1007/s00454-023-00488-y), [arXiv v2, 20 May 2023](https://arxiv.org/html/2102.11836v2)

Defant also explicitly points to Lorentzian polynomials as a possible connection. Consequently, the broad suggestion to use Lorentzian methods should not be claimed as new. The candidate's proposed contribution is the particular recurrence, substitution, and truncation construction that would make that connection work.

### Ordinary Lorentzian truncations

Ross, Süss, and Wannerer, *Dually Lorentzian Polynomials*, Monatshefte für Mathematik 208 (2025), 495–524, Definition 3.2 defines componentwise truncation by deleting monomials while retaining their coefficients. Proposition 3.3 states preservation of the ordinary Lorentzian property. Theorem 3.1 supplies product and nonnegative linear-substitution closure. These statements appear also in arXiv v3, dated 30 May 2023, printed page 5. [Journal Section 3](https://doi.org/10.1007/s00605-025-02134-6), [preprint, page 5](https://arxiv.org/pdf/2304.08399v3#page=5)

The paper's title must not cause a normalization error: Proposition 3.3 is not limited to dually Lorentzian polynomials, and its truncations do not introduce factorial factors. It applies to the candidate's coordinate-exponent cap only after the candidate independently establishes the stated homogeneous polynomial and correct cap. Truncation closure itself is prior work.

### Binary Lorentzian forms and ULC

Brändén and Huh, *Lorentzian polynomials*, Annals of Mathematics 192 (2020), 821–891, Example 2.26 gives the equivalence between a degree-\(d\) binary Lorentzian form and an order-\(d\) ULC coefficient sequence with no internal zeros. Their theory supplies differentiation, nonnegative specialization, and product closure. The candidate's coefficient extraction must include its positive factorial scalar, and its extracted form must have degree \(d\), not the larger homogenization degree. [Author PDF, Example 2.26](https://web.math.princeton.edu/~huh/Lorentzian.pdf#page=22), [journal record](https://doi.org/10.4007/annals.2020.192.3.4)

## Comparisons with nearby work

### Alexandersson and Jal

The current version of *Rook matroids and log-concavity of P-Eulerian polynomials* is arXiv:2410.00127v3, 30 June 2026, superseding the 2024 and April 2025 versions. The arXiv record says v3 corrects an error in the proof of Theorem 3.3. In v3, Corollary 4.1 proves ULC for non-nesting rook numbers, and Corollary 5.8 proves ULC for naturally labeled width-two posets. The corresponding April 2025 references were Corollaries 4.2 and 5.10. [Version history](https://arxiv.org/abs/2410.00127), [current full text](https://arxiv.org/html/2410.00127v3)

This is important overlapping methodology and a relevant ULC result, but it is not itself a theorem about fixed stack-sorting fibers. Applying it would require a suitable identity or reduction preserving the statistic and normalization; none was identified in the inspected theorem statements and constructions. Shared appearances of trees, posets, and Lorentzian polynomials do not supply that reduction.

An independent elementary scope check also rules out literal equality with an ordinary naturally labeled poset descent polynomial in general. Direct enumeration of the 120 permutations in \(S_5\) gives \(A_{21345}(x)=3+8x+3x^2\). A naturally labeled poset has exactly one zero-descent linear extension, so its ordinary descent polynomial has constant term one. Even dividing this example by three gives a nonintegral coefficient. This does not exclude weighted, indirect, or more elaborate reductions, and is not a priority argument.

### Mao and Wang

*The Narayana transformation*, arXiv:2607.01572v1, 2 July 2026, Theorem 1.1 proves that the one-variable basis transformation \(x^r\mapsto N_{r,m}(x)\) preserves real-rootedness for real-rooted inputs with nonnegative coefficients. For \(m=1\), its convention corresponds to the shifted type-A Narayana basis \(N_{r+1}(x)/x\) used in the candidate. [Theorem 1.1 and definitions](https://arxiv.org/html/2607.01572v1)

The input hypothesis is essential to the comparison: a multivariate, equal-weight laminar lattice sum is not automatically a single application to a known real-rooted input. The paper does not supply the missing reduction for general fibers. It is useful related work, not an ingredient needed by the candidate's Lorentzian proof, and cannot by itself upgrade that proof to real-rootedness.

### Bóna

*Stack-sorting preimages and 0-1-trees* was published in DMTCS 28:1 (2026), article 1, on 26 March 2026; the inspected arXiv version is 2505.18295v4, 19 March 2026. It gives tree-based proofs of enumerations of inverse images of the pattern classes avoiding \(132,312\) and \(231,312\). Its further question concerns another pattern-class enumeration. [Journal record](https://doi.org/10.46298/dmtcs.16393), [full text](https://arxiv.org/html/2505.18295v4)

Those are aggregate cardinalities over permutation classes. The inspected article does not state a general theorem on the descent coefficients within every fixed fiber. It should not be cited as resolving the candidate's LC target, nor confused with Bóna's earlier symmetry and unimodality work.

### Other search hits needing separation

Gu and Wang's *Lattice paths and (n−2)-stack sortable permutations*, Journal of Combinatorial Theory A 190 (2022), 105622, proves descent log-concavity for the indicated iterated-sortable class, not every one-step fixed fiber. [Journal article](https://doi.org/10.1016/j.jcta.2022.105622)

Defant, Engen, and Miller's *Stack-Sorting, Set Partitions, and Lassalle's Sequence* concerns a different sequence refined by first entries of uniquely sorted permutations. A log-concavity claim about that sequence is not the fixed-fiber descent question. [Primary preprint](https://arxiv.org/abs/1809.01340)

## Bounded search log

Searches and direct source checks were performed on 4 November 2026, approximately 17:33–17:36 UTC. General web search was used to locate sources; mathematical comparisons above rely on the linked original papers, journal records, and authors' arXiv submissions. Search result crawl dates were not treated as publication dates. No exhaustive citation index, subscription database, private correspondence, or unpublished manuscript collection was searched.

The following literal queries were issued, grouped by purpose:

- Initial targeted checks: `Alexandersson Jal rook matroids width two poset ultra log concave 2024 2025`; `Miklós Bóna 2026 "Stack-sorting preimages" "0-1"`; `Defant fertility log concavity descent 2026 proof`; `Mao Wang "The Narayana transformation"`.
- General target: `"stack-sorting" "log-concavity"`; `"fertilitopes" "log-concavity" proof`; `"stack-sorting" "ultra-log-concave"`; `"Defant" "Conjecture 31" log concavity`.
- Structural variants: `"fertilitope" "Lorentzian" 2026`; `"stack-sorting fibers" concavity`; `"stack-sorting fibres" concavity`; `"Narayana" "laminar" log concavity`.
- Additional scope variants: `"Fertilitopes" proof logconcavity 2024 2025 2026`; `"Narayana" "binary nestohedra"`; `"stack-sorting" "log-concave" "fiber"`; `"stack-sorting" "log-concave" "fibre"`.
- Date and author checks: `Colin Defant research papers Fertilitopes website`; `"fertilitopes" "2026" "log"`; `"fertilitopes" "2025" proof`; `"stack-sorting" "log-concavity" proof fiber 2026 arxiv`.
- Primary repository checks: `site:arxiv.org "fertilitopes" log-concave`; `site:arxiv.org "stack-sorting" "Lorentzian"`; `site:arxiv.org "stack-sorting" "log-concave" 2026`; `site:arxiv.org "binary nestohedron" log concavity`.

Direct checks included the original 2020 PDF, Fertilitopes v2 and its journal text, RSW v3 and its 2025 journal text, Brändén–Huh's author PDF, Alexandersson–Jal v2 followed by the current v3, Mao–Wang v1, and Bóna v4 plus the journal record. ArXiv abstract pages were checked for current versions. A guessed author-publications URL failed; the verified author homepage was accessible, but its linked CV exposed only a viewer shell, so no claim of an exhaustive author-bibliography check is made. Secondary problem pages and other broad search hits were not accepted as evidence of current open status.

The searches retrieved no primary paper that was identified as proving the full fixed-fiber descent-LC conclusion. This is a bounded negative finding, not a theorem that no such paper exists. Indexing delays, differing terminology, unindexed proceedings, and unpublished work remain possible. The defensible public description is therefore “a proof candidate for the log-concavity question explicitly posed after Defant's 2020 Conjecture 31, strengthened to trimmed ULC; priority has not been established.”

## Recommended presentation

Use a title such as **Ultra log concavity of trimmed stack sorting fiber descent polynomials**. Separate the mathematical statement, the cited prior ingredients, the proposed structural construction, and the literature-status qualification. State that the stronger real-rootedness problem is not proved by this argument, rather than asserting without qualification that it remains globally open today. Do not claim novelty of Narayana formulas, fertilitopes, Lorentzian closure properties, or the general suggestion of a Lorentzian connection.

# Gessel–Zhuang inverse peaks: boundary and regression checks

This note records an elementary consequence of Troyka–Zhuang's inverse-peak-zero uniqueness theorem, with an independent construction and reproducible checks. It is supporting material, not a new solution of Conjecture 7.1(a). Prepared with AI assistance.

## Normalization

For n ≥ 1, let pk(π) count internal peaks, and ipk(π) = pk(π⁻¹). Define

F(n,k;t) = Σ_{π ∈ S_n, pk(π)=k} t^{ipk(π)},

where 0 ≤ k ≤ ⌊(n−1)/2⌋. Gessel–Zhuang Conjecture 7.1(a) asks for real-rootedness of **t F(n,k;t)**. Conjecture 7.3 instead concerns gamma-positivity for inverse **descents** with a fixed **pinnacle set**. These are different targets.

## Constant coefficient

**For every admissible n,k, [t⁰]F(n,k;t) = C(n,2k+1).** In the paper's shifted normalization, this is the coefficient of t, not the constant coefficient.

Here is a direct proof of the uniqueness input. Given a descent word w ∈ {0,1}^{n−1}, start the permutation at d+1, where d is the number of ones. For each 1, append the next smaller unused value; for each 0, append the next larger unused value. The used values form an interval at every step. The resulting descent word is w, and its inverse decreases then increases, so has no peak.

Conversely, a peak-free inverse decreases then increases. Values below the first letter of the original permutation must occur in decreasing order; those above it occur in increasing order. A choice from the lower side is always a descent, and a choice from the upper side always an ascent. Thus the word forces every choice and the starting letter d+1.

Peaks correspond to 01 transitions in w. A word with k such transitions has the unique block form

1^{a₀} 0^{b₀} 1^{a₁} 0^{b₁} ⋯ 1^{a_k} 0^{b_k},

with a₀,b_k ≥ 0 and all 2k intermediate exponents positive. Distributing n−1 letters among the 2k+2 blocks gives C(n,2k+1) by stars and bars. For k=0 the form is simply 1^{a₀}0^{b₀}.

## The complete k=0 row

Inversion exchanges pk and ipk. Consequently

F(n,0;t) = Σ_{j=0}^{⌊(n−1)/2⌋} C(n,2j+1)t^j.

Substituting t=−x² gives ((1+ix)^n−(1−ix)^n)/(2ix). Its distinct negative roots are exactly

−tan²(πr/n),  1 ≤ r ≤ ⌊(n−1)/2⌋.

Indeed x=tan(πr/n) makes the numerator zero; these give as many distinct roots as the degree. For n=1,2 the polynomial is constant. This settles the k=0 boundary by a known-theorem consequence, not the general conjecture.

## Reproduction

Run `python verify.py` (Python standard library). It checks all 46,233 permutations of sizes 1–8 for the boundary and joint-matrix symmetry, and the construction for all 4,095 descent words of sizes 1–12. Both normal and `python -O verify.py` runs passed on 2026-11-18. Finite checks validate the implementation; the argument above proves the all-n boundary. The original authors already checked their real-rootedness conjecture through n=50, so these smaller checks are not new computational evidence.

## References

- I. M. Gessel and Y. Zhuang, [Two-sided permutation statistics via symmetric functions](https://doi.org/10.1017/fms.2024.89), *Forum of Mathematics, Sigma* 12 (2024), e93, Conjectures 7.1(a) and 7.3.
- J. M. Troyka and Y. Zhuang, [Fibonacci numbers, consecutive patterns, and inverse peaks](https://arxiv.org/abs/2109.14774), *Advances in Applied Mathematics* 141 (2022), article 102406; arXiv v2 (2023). Their uniqueness theorem supplies the established boundary input.

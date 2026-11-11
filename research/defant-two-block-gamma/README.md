# 双块 gamma-ULC：24 次以内的精确证书与概率化简

**对所有整数 a,b≥1、M≥1、m=a+b+M≤24，以及全部实数 p,q≥1，双块 gamma 系数列属于 ULC(⌊m/2⌋)；有内部不等式时全部严格。**

The bound is on the total degree m, not on p or q. The proof checks every coefficient of the ULC remainders in P=p−1 and Q=q−1 using exact integers. It covers 1,078 triples up to symmetry and 8,712 inequalities, with 3,551,042 positive monomial coefficients and positive constant terms.

For d>0, define G_(d,0)=1 and

g_(d,t,k) = d ∏_(h=k+1)^(t−1)(d+h) / [k!(t−2k)!],

G_(d,t)(y) = Σ_(k=0)^⌊t/2⌋ g_(d,t,k)y^k,

Γ(y) = Σ_(u=a)^(a+M) G_(p,u)(y)G_(q,m−u)(y).

Here t≥1 in the product formula, and an empty product is 1. ULC(K) means log-concavity after dividing the kth coefficient by binom(K,k).

## Results and proofs

- [Finite-degree theorem and exact certificate method](PROOF.md).
- [All-parameter beta-binomial reduction](PROBABILITY.md): Γ_k=g_(p+q,m,k)H_k, with an explicit equivalent inequality for interval probabilities H_k.
- [Adjacent-k recursion](RECURSION.md): an exact two-branch size-biased coupling valid for all positive real p,q.
- [Exact obstructions to stronger auxiliary claims](OBSTRUCTIONS.md): already at a=1,b=2,M=4,p=q=1, the retention probabilities and a common-factor remainder fail ordinary log-concavity. The actual gamma-ULC inequalities hold.
- [Verification record](VERIFICATION.md) and [sources](SOURCES.md).

The probability identities have no degree bound. The remaining comparison inequality for arbitrary m is open in this work; the finite certificate establishes ULC, not real-rootedness. This is progress on the two-block family, separate from the [single-fibre real-rootedness counterexamples](../defant-single-fibre-counterexamples/README.md).

## Reproduce

From this directory, with Python 3 and no third-party packages:

```sh
python3 scripts/verify_coefficients.py
python3 scripts/verify_direct.py
python3 scripts/check_probability.py
python3 scripts/check_recursion.py
```

The first command verifies the full m≤24 scope. The second independently reconstructs the earlier M≥4, m≤18 scope and compares a canonical digest of all row summaries. The last two check the probability identities and counterexamples with exact rational arithmetic. Their universal identities are proved in the accompanying text. Run without `-O`, because the checks use assertions.

Results are stored in `results/`; the full polynomial coefficients are reconstructed by the scripts rather than stored in these summaries. `SHA256SUMS.txt` records the publication files.

Research developed with AI assistance. Independent mathematical and computational reviews checked the formulas and certificate calculations; the verification record states the checks actually run.

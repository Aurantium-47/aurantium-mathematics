# Defant 单排列纤维实根性猜想的反例

**111 和 112 元素的显式排列，其栈排序原像下降多项式均有非实根；由乘积构造得到每个 n ≥ 111 的反例。**

For West’s stack-sorting map s, the polynomial

D_π(x) = ∑_{σ ∈ s⁻¹(π)} x^(des(σ)+1)

need not be real-rooted, even for a single target permutation π. The two explicit witnesses have lengths 111 and 112 and exactly four nonreal roots each. Joining either witness with (1) increases its length by two and multiplies its fibre polynomial by x, giving counterexamples at every length n ≥ 111.

## Proof and data

- [Construction and propagation proof](PROOF.md): nested simplices, distinct lattice-point sum, explicit permutation construction, and two factorization identities.
- [Compact proof](COMPACT_PROOF.md): a gamma-basis formula and an exact violation of F′² − FF″ ≥ 0 at a rational point. This avoids numerical root approximations.
- [111-element permutation](source/permutation111.json) and [112-element permutation](source/permutation112.json).
- [111 polynomial certificate](source/polynomial111.json) and [112 polynomial certificate](source/polynomial112.json). Coefficients named “ascending” are stored constant term first; F is stored leading coefficient first. The normalized polynomial omits x^41 and x^39, respectively.
- [Sources and relation to prior work](SOURCES.md).
- [Verification record](VERIFICATION.md).

## Reproduce

From this directory, with Python 3 (no third-party dependencies):

```sh
python3 source/verify_stdlib.py
python3 compact/check_compact.py
python3 verify_direct_stack.py
```

The first command reconstructs the original-coordinate Narayana sums, verifies every coefficient and factorization, computes exact negative discriminants by fraction-free elimination, counts lattice points, and reconstructs the permutations. The second independently computes the gamma-basis sums and checks exact rational Laguerre inequalities. The third reconstructs the fibre polynomials directly from the stack-sorting recurrence, without using fertilitopes, hooks, or Narayana formulas.

Optional exact root counts require SymPy:

```sh
python3 sturm111/check.py
python3 sturm112/check.py
```

These checks use exact Sturm arithmetic and write their generated certificates alongside the scripts.

## Scope

This answers the real-rootedness assertion in Defant’s *Stack-Sorting Preimages of Permutation Classes*, Conjecture 31, and its binary-nestohedron reformulation in *Fertilitopes*, Conjectures 1.1–1.2. It does not settle the separate log-concavity question or Bóna’s conjecture for aggregated t-stack-sortable sets. The construction gives an upper bound of 111 on the smallest possible counterexample length, not a minimality result.

Research developed with AI assistance; the accompanying mathematical arguments and exact computations are available for independent checking. See the verification record for the checks actually performed.

# Independent exact audit of the fixed-index extension

The verifier `audit_exact.py` does not import `base.py` or `extend.py` and does not use their polynomial operations. It reads the proposed rational monomial coefficients, checks positivity and a positive constant, then verifies the entire polynomial identity by exact integer interpolation.

## Degree bound and identity test

The block coefficient is the polynomial

`g(n,j) = n^(falling 2j) / (j! (j+1)!)`.

It has degree `2j`. A row coefficient at index j has total degree at most `2j` after affine chart substitution. Therefore every term of the common-tangent defect D has total degree at most `6k-1`.

The independent code evaluates the row coefficients at nonnegative integer arguments using `binom(n,2j) Catalan(j)`, with zero when `2j>n`, and multiplies all rational monomial coefficients by their common denominator. It then compares integers, without floating point or rounding.

For a univariate chart, d+1 values identify a polynomial of degree at most d. For the bivariate chart, values at all `(s,v)` with `s,v>=0, s+v<=d` identify a polynomial of total degree at most d. Indeed, a vanishing polynomial on this set vanishes identically on `s=0` (d+1 roots), is divisible by s, and induction on the remaining rows proves it is zero.

Consequently these are exact identity certificates, not sampled numerical positivity evidence. No modular arithmetic or probabilistic polynomial identity testing is used.

## Coverage

For fixed k>=1 and m>=2(k+1), let r=floor(m/2), so r>=k+1. Symmetry reduces 0<=u<=r. The charts are:

- u=c for c=0,...,k, r=k+1+v;
- u=k+1+s, r=k+1+s+v.

The fixed-u charts cover the low rows; the last chart covers all remaining rows by s=u-(k+1), v=r-u. Both parities are checked. Thus positive chart coefficients with positive constants imply D>0 on every legal integer row for the verified fixed indices.

For internal k, every row coefficient at k-1 is positive, since row degree is either K or K-1. Hence the common-tangent completion-of-square argument applies to any nonzero nonnegative real weights. Endpoint rows, zero weights, singleton support, and vanishing coefficients at index K are included.

## Scope

The exact audited index range and counts are in `audit_exact_results.json`. The computations verify a finite set of fixed k values for unbounded total m. They do not prove the statement for arbitrary k. This is a mathematical extension of an existing certificate, not a solution to the full conjecture or a real-rootedness theorem. No novelty claim is made by this audit.

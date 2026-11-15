# Arbitrary unit-dimensional mixtures: fixed indices 4 through 16

This is an extension within the existing two-block gamma project, not a solution of the all-index conjecture.

Define

\[
G_n(z)=\sum_{j=0}^{\lfloor n/2\rfloor}\frac{n!}{j!(j+1)!(n-2j)!}z^j,
\quad R_u=G_uG_{m-u},\quad K=\lfloor m/2\rfloor.
\]

For any weights \(w_0,\dots,w_m\ge0\), not all zero, let \(P=\sum w_uR_u\).

**Theorem.** For each integer \(4\le k\le16\) and every integer \(m\ge2k+2\),
\[
k(K-k)P_k^2>(k+1)(K-k+1)P_{k-1}P_{k+1}.
\]

There is no upper bound on m, and the weights may be arbitrary nonnegative real numbers. Endpoint rows, singleton support, zero weights and degree loss are included. This fixes unit dimensions p=q=1. It does not cover arbitrary dimensions or every internal index at arbitrarily large m.

## Proof

Set \(r_{u,j}=[z^j]R_u\), \(c_j=r_{K,j}\), and
\[
D=k(K-k)(2c_kc_{k-1}r_{u,k}-c_k^2r_{u,k-1})
 -(k+1)(K-k+1)c_{k-1}^2r_{u,k+1}.
\]
The common-tangent identity already established in `UNIT_MIXTURE_CERTIFICATES.md` shows that positivity of every D implies the stated strict inequality for every weight vector. The denominators c_(k-1) and P_(k-1) are positive because each row has contiguous positive support through K-1.

Write m=2r+e, e in {0,1}, so r=K≥k+1. By symmetry it suffices to consider 0≤u≤r. For each parity use these k+2 charts:

1. u=j, r=k+1+v, for j=0,...,k and v≥0;
2. u=k+1+s, r=k+1+s+v, for s,v≥0.

These charts cover every legal integer pair (r,u). Write
\[
g(n,j)=\frac{\prod_{a=0}^{2j-1}(n-a)}{j!(j+1)!},\qquad
r_{u,j}=\sum_{i=0}^j g(u,i)g(m-u,j-i).
\]
For nonnegative integer n the falling-factorial formula is the required coefficient, including its zeros when n<2j. Consequently D is a rational polynomial of total degree at most 6k-1.

For every k=4,...,16, the accompanying standard-library verifier expands each chart exactly over `Fraction`. Every nonzero coefficient and the constant coefficient are positive. Thus D>0 throughout each nonnegative chart, proving the theorem. The result JSON records coefficient counts, constants and canonical SHA256 digests; the verifier reconstructs rather than trusts the coefficients.

## Independent identity audit

`audit_exact.py` does not import the producer or its polynomial operations. It reads the expanded coefficients, checks positivity and degree, clears denominators, and compares exact polynomial values with direct binomial-coefficient evaluation of D.

For a univariate chart of degree at most d=6k-1 it checks v=0,...,d. For a bivariate chart it checks the triangular integer grid s,v≥0, s+v≤d. These are unisolvent nodes for total-degree-d polynomials: the Newton basis `binom(s,i) binom(v,j)` with i+j≤d makes the evaluation matrix triangular with diagonal 1. Therefore equality at the nodes proves the entire polynomial identity, not just a finite numerical sample. This audit is independent of the coefficient-construction implementation, not independent human peer review.

## Reproduce

```
python3 verify_fixed_indices.py --dump > reproduced.json
diff -u fixed_indices.json reproduced.json
python3 audit_exact.py 4 5 6 7 8 9 10 11 12 13 14 15 16
```

The producer and auditor use exact arithmetic and explicit exceptions, including under Python `-O`.

## Significance and next gap

The previous published all-size certificate covered k=3. This extends it to a fixed strip through k=16 without bounding m or sampling the weights. Increasing this finite strip is a routine computational continuation of the same method, so it should not be counted as thirteen separate projects or described as a general conjecture proof. The central open step is proving the chart coefficient positivity uniformly in symbolic k (or finding another all-index argument).

A separate floating-point exploration reached m=10,000 without finding a negative common-tangent residual. It is diagnostic only and is not used in the theorem or exact proof.

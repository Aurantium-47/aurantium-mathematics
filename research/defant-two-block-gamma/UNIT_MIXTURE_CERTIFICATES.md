# Unit-dimensional arbitrary mixtures: a third-index theorem and finite all-index certificate

## Results

Let

\[
G_n(z)=\sum_{j=0}^{\lfloor n/2\rfloor}\frac{n!}{j!(j+1)!(n-2j)!}z^j,
\qquad R_u(z)=G_u(z)G_{m-u}(z),\qquad K=\lfloor m/2\rfloor.
\]

Here \(G_0=1\). For arbitrary real weights \(w_0,\ldots,w_m\ge0\), not all zero, put \(P=\sum_{u=0}^m w_uR_u\).

**Third-index theorem.** For every integer \(m\ge8\),

\[
3(K-3)P_3^2>4(K-2)P_2P_4.
\]

**Finite all-index theorem.** For every integer \(5\le m\le160\) and every \(1\le k<K\),

\[
k(K-k)P_k^2>(k+1)(K-k+1)P_{k-1}P_{k+1}.
\]

Both statements cover arbitrary real weights, including singleton support, zero weights, endpoint rows \(u=0,m\), and degree loss. The second statement is proved by exhaustive integer certificates, not by sampling weights. These are ordinary order-\(K\) ULC inequalities; the normalization remains \(K\) when \(P_K=0\).

## Common-tangent certificate

Write \(r_{u,j}=[z^j]R_u\) and \(c_j=r_{K,j}\). Define

\[
D_{m,k,u}=k(K-k)\left(2c_kc_{k-1}r_{u,k}-c_k^2r_{u,k-1}\right)
 -(k+1)(K-k+1)c_{k-1}^2r_{u,k+1}.
\]

Every row has positive coefficients at indices \(0,\ldots,K-1\): its degree is \(\lfloor u/2\rfloor+\lfloor(m-u)/2\rfloor\), either \(K\) or \(K-1\), and both factors have contiguous positive support. Thus \(c_{k-1}>0\) and \(P_{k-1}>0\) at every internal index.

Set \(h=c_k/c_{k-1}\) and \(\rho=(k+1)(K-k+1)/(k(K-k))\). If every \(D_{m,k,u}>0\), division by the positive factor \(k(K-k)c_{k-1}^2\) and summation with weights yield

\[
L=2hP_k-h^2P_{k-1}-\rho P_{k+1}>0.
\]

The identity

\[
P_k^2-\rho P_{k-1}P_{k+1}
 =P_{k-1}L+(P_k-hP_{k-1})^2>0
\]

proves the required inequality for every nonzero nonnegative weight vector. In particular, no division by \(r_{u,k+1}\) or assumption that it is nonzero is made.

## Symbolic proof at the third index

Write \(m=2r+\varepsilon\), with \(\varepsilon\in\{0,1\}\) and \(r\ge4\). Symmetry \(R_u=R_{m-u}\) reduces the rows to \(0\le u\le r\). At \(k=3\), the displayed \(D\) is a rational polynomial in \(r,u\), because

\[
g(n,j)=\frac{\prod_{a=0}^{2j-1}(n-a)}{j!(j+1)!},
\qquad r_{u,j}=\sum_{i=0}^j g(u,i)g(m-u,j-i).
\]

For nonnegative integer \(n<2j\), the product contains a zero, so this polynomial formula agrees with the required zero coefficient.

The following charts cover all the integer pairs \((r,u)\):

* \(u=j\), \(r=4+v\), for \(j=0,1,2,3\), \(v\ge0\);
* \(u=4+s\), \(r=4+s+v\), for \(s,v\ge0\).

For each parity, exact expansion of \(D\) in these charts gives four univariate polynomials with 18 positive coefficients each and one bivariate polynomial with 171 positive coefficients. All other coefficients are zero. Their constant terms are:

| Parity | u=0 | u=1 | u=2 | u=3 | u=4+s |
| --- | ---: | ---: | ---: | ---: | ---: |
| even | 385280 | 80640 | 59840 | 103680 | 17920 |
| odd | 4451328 | 1569792 | 430080 | 1221120 | 552960 |

Hence every chart polynomial is strictly positive for all its nonnegative arguments. This proves \(D_{m,3,u}>0\) for every \(m\ge8\) and all rows, and the common-tangent identity proves the theorem.

The 486 nonzero rational coefficients are reconstructed directly by the verifier using sparse polynomial addition and multiplication over Python `Fraction`. No interpolation, floating-point arithmetic, or positivity sampling is used. The result file records a canonical coefficient digest for each chart: sorted triples `[s_degree, v_degree, rational_as_string]`, JSON encoded with compact separators. A separate SymPy implementation first constructs the unrestricted polynomial in \((r,u)\), then substitutes the charts; all 486 coefficients match exactly.

## Finite all-index verification

The same verifier reconstructs every row using \(g(n,j)=\binom n{2j}\binom{2j}j/(j+1)\), then checks \(D>0\) for every \(5\le m\le160\), every internal \(k\), and every \(0\le u\le K\). Reflection covers the remaining rows. This gives **341,198 strictly positive integer certificates**. A row with \(r_{u,k+1}=0\) is checked rather than discarded. At \(m=4\), the row \(G_2^2=(1+z)^2\) has equality, explaining the lower bound.

An additional exact-rational pair-segment implementation checked all indices through \(m=60\). It normalizes each row by \(r_{u,k}>0\), so all weight vectors become the entire convex hull of the points \((r_{u,k-1}/r_{u,k},r_{u,k+1}/r_{u,k})\). The maximum of \(xy\) occurs on a hull edge: in a two-dimensional hull its gradient \((y,x)\) never vanishes because \(x>0\); degenerate hulls are points or segments. Checking every two-point segment therefore suffices. This is an implementation cross-check; the published proof uses the shorter common-tangent certificate.

## Reproduce

From this directory:

```sh
python3 scripts/verify_unit_mixture_certificates.py > /tmp/unit_mixture_certificates.json
diff -u results/unit_mixture_certificates.json /tmp/unit_mixture_certificates.json
```

The checker requires only Python's standard library and uses explicit exceptions for failed checks, including when Python runs with `-O`. It reconstructs the certificates rather than trusting stored coefficients or counts.

## Relation to the other results

The existing finite-degree theorem in [PROOF.md](PROOF.md) is universal in real dimensions \(p,q\ge1\) for the specified interval sums through \(m=24\). The results here instead fix \(p=q=1\) and allow arbitrary nonnegative row weights. Neither parameter domain contains the other. The common-tangent method and balanced-row candidate predate this certificate; the new symbolic increment is the all-size third-index certificate.

The all-size statement for every internal index remains open in this work. No real-rootedness conclusion follows from these certificates.

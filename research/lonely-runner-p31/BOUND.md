# Conditional finite-checking bound for fifteen relative speeds

This is a specialization of [Allikvere, Theorem 3.8](https://arxiv.org/html/2609.02604v2#S3.SS6), not a new general theorem or a solution of the sixteen-runner case. Assume **all LRC(m) for m < 15** and accept the cited flag theorem. Its numerical examples for n=13,14 do not limit the general statement to those dimensions. We supply a separate elementary shape estimate rather than assume that the paper's dimension-specific shape estimates hold for n=15.

## 1. Exact constants and hypotheses

Let v be a positive primitive counterexample to LRC(15). Signs and common rescaling allow this normalization. The projected lattice has rank 14. Set

    B_0 = 0,
    B_i = (i/[8(16-i)])^2,
    c_i = B_i-B_(i-1)
        = (17i-i^2-8)/(2(16-i)^2(17-i)^2),  1 <= i <= 14.

Exact rational calculation verifies positivity and

    min_i c_(i+1)/c_i = 3751/2349 > 4/3,
    K = product_i c_i
      = 233570089/12695029890685690413859209216000000000000.

Thus the ratio hypothesis in the cited product-minimization lemma holds. With S=sum v_i and the paper's shape factor F, its flag theorem yields S F <= K^(-1/2). The prefix inequality at index r invokes lower cases at most 15-r <= 14, not LRC(15); there is no circular use of the sought conclusion.

## 2. Shape estimate

For u_i=v_i/max(v), define

    q(u)=1+2u-u^2,  a(u)=q(u)/u^(2/15),
    H=(sum_i u_i^2/q(u_i))*product_i a(u_i).

The definition of the paper's R gives R_15^2=225/H. For 0<u<=1, q(u)>=1+u. The logarithmic derivative of (1+u)/u^(2/15) has sign 13u-2, so its minimum is

    a0=(15/13)*(13/2)^(2/15).

Moreover a(u)>a0: in the interior q(u)>1+u, while at u=1 its value is 2>a0. Some u_j=1, contributing 1/2 to the sum in H and 2 to its product. The remaining fourteen factors exceed a0. Hence H>a0^14 and R_15<15/a0^7 throughout the normalized positive domain.

Using 15*(product v_i)^(1/15)=S F R_15 gives

    log(product v_i) < L,
    L = -(15/2) log K -105 log(15/13)-14 log(13/2).

Two distinct exact-rational implementations certify

    506.81695423653393557689 < L
                               < 506.81695423653393557690.

All logarithms are natural. This shape bound is valid but not claimed optimal.

## 3. Reproducible arithmetic

```sh
python bounds/directed_bound.py
python bounds/bound_independent.py
python bounds/block_check.py
```

The first script reduces rational arguments to [1,2] and uses 90 terms of the positive atanh series with a geometric remainder bound. The second independently factors the closed-form rational constants into primes and uses 600 direct prime-argument terms without that range reduction. Negative coefficients reverse interval endpoints. Decimal bounds are parsed as exact rational strings, not floating-point tolerances.

The block check verifies all 8192 consecutive-block partition products with Fraction arithmetic. Its printed approximate values use floats and are informational; certification of the displayed enclosure comes from the other two scripts. The finite block check supplements, not replaces, the general geometric and product-minimization theorems.

These are independent software calculations within one AI-assisted workflow, not independent human peer review. Recorded outputs are in recorded/.

## 4. Divisor accounting and what remains

For every d<=16, a counterexample must have some speed divisible by d: otherwise t=1/d is a witness. Therefore 720720=lcm(2,...,16) divides the speed product. Thus a sufficient additional distinct-prime logarithmic mass is

    > L-log(720720), which is less than 493.328948245208614.

If the separate [p=31 gate](PROOF.md) is accepted, 31 is coprime to 720720, so it can be counted once. The remaining target is

    > L-log(720720*31), which is less than 489.894961040723468.

Further prime gates must exclude primes already counted; no extra prime power follows from an ordinary divisibility gate. A log31 term inside the factorization of K is unrelated to this additional divisor accounting.

This calculation supplies a conditional target, not the missing gates. The full sixteen-runner conjecture, lower-case computational dependencies, and novelty remain unestablished here.

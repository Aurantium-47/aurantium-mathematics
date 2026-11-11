# Exact finite-parameter probability reduction

The identities below hold for every real p,q>0 and integer a,b≥1, M≥0. They give an exact reformulation of ULC; the remaining probability inequality is the general target.

Set D=p+q, m=a+b+M, K=floor(m/2), and extend G_{d,0}=1. Let C(z)=1+zC(z)² be the Catalan series, and let T=1+xT+yx²T² have constant term 1. The substitution T=(1-x)^{-1} C(yx²/(1-x)²), followed by formal Lagrange inversion, gives

G_{d,t}(y)=[x^t]T(x,y)^d.

Define A_{d,j}=d Γ(d+2j)/(j! Γ(d+j+1)); in particular A_{d,0}=1. Then

T(x,y)^d = Σ_{j≥0} A_{d,j} y^j x^{2j}(1-x)^{-d-2j}.

Here (d)_r denotes a rising factorial and Γ in A denotes Euler’s gamma function. Lagrange inversion gives [z^j]C(z)^d=A_(d,j); expanding (1-x)^(-d-2j) recovers the stated block coefficients.

The Catalan-power convolution identity is Σ_{i=0}^k A_{p,i}A_{q,k-i}=A_{D,k}.

For each k, put n=m-2k. Draw I in {0,...,k} with probability

P(I=i)=A_{p,i}A_{q,k-i}/A_{D,k}.

Given I=i, draw R from the beta-binomial distribution with n trials and parameters α=p+2i, β=q+2k-2i:

P(R=r | I=i)=binom(n,r)(α)_r(β)_{n-r}/(D+2k)_n.

Write H_k=P(a≤2I+R≤a+M). Direct coefficient multiplication gives the exact identity

γ_k = g_{D,m,k} H_k.

Indeed the unnormalized joint mass for (I,R) is g_{p,2i+r,i}g_{q,m-2i-r,k-i}, and its full sum is g_{D,m,k}. All quantities are nonnegative, so no analytic convergence or exchange issue occurs.

For 1≤k≤K-1, n=m-2k≥2, explicit factorial cancellation gives

g_{D,m,k}²/(g_{D,m,k-1}g_{D,m,k+1})
= ((k+1)/k)((D+k+1)/(D+k))((n+2)(n+1)/(n(n-1))).

Consequently the original gamma-ULC inequality is equivalent to

H_k² ≥ θ_n ((D+k)/(D+k+1)) H_{k-1}H_{k+1},

where θ_n=(n-1)/(n+1) if n is even, and θ_n=n/(n+2) if n is odd.

The extra factor (D+k)/(D+k+1) is less than 1 and tends to 1 as D tends to infinity. The distribution defining H also depends on p,q, so this observation alone does not prove the inequality.

## A tempting stronger statement is false

The interval-retention sequence H is not always log-concave, even for legal M≥4. Take a=1,b=2,M=4,p=q=1, so m=7. Exact sequences are

γ=(5,55,110,37),

g_{2,7,*}=(8,112,280,112).

Hence H0=5/8,H1=55/112,H2=11/28 and

H1²-H0H2 = -55/12544 < 0.

Thus a proof cannot simply claim log-concavity of interval-retention probabilities. The weaker inequality above remains the correct target.

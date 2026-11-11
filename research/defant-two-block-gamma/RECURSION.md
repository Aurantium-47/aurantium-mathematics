# An exact adjacent-k and dimension recursion

This identity is proved, but does not itself establish ULC. The parameters p,q can be arbitrary positive reals.

Let

W_{p,q,m,k}(u)=[y^k]G_{p,u}(y)G_{q,m-u}(y),

with support 0≤u≤m, and let μ_{p,q,m,k}(u)=W(u)/g_{p+q,m,k}. Thus μ is a probability distribution, including both endpoint terms.

Direct factorial cancellation proves, for t≥2,

G'_{d,t}(y) = (d/(d+1))(d+t-1)G_{d+1,t-2}(y).

For t=0,1 the derivative is zero. Hence, for m≥2 and 1≤k≤floor(m/2),

k W_{p,q,m,k}(u)
= (p/(p+1))(p+u-1)W_{p+1,q,m-2,k-1}(u-2)
+ (q/(q+1))(q+m-u-1)W_{p,q+1,m-2,k-1}(u).

Out-of-support terms are zero. Also

k g_{D,m,k}/g_{D+1,m-2,k-1} = (D/(D+1))(D+m-1),  D=p+q.

Therefore μ_{p,q,m,k} has the following exact generation rule:

1. Choose left with probability p/D or right with probability q/D.
2. If left, draw V from μ_{p+1,q,m-2,k-1}, tilted by the factor
   (D+1)(p+V+1)/[(p+1)(D+m-1)], and output U=V+2.
3. If right, draw V from μ_{p,q+1,m-2,k-1}, tilted by the factor
   (D+1)(q+m-1-V)/[(q+1)(D+m-1)], and output U=V.

The tilt factors integrate to one. To see this, the general mean identity is

E_{μ_{p,q,m,k}}[U]=mp/(p+q).

For a formal proof, mark the first block size with s and differentiate T(sx,y)^p T(x,y)^q at s=1. The derivative equals (p/D)x∂_x T(x,y)^D, whose [x^m y^k] coefficient is (mp/D)g_{D,m,k}.

Applying this coupling to any interval [A,B] gives an exact adjacent-k recurrence for its retention probability, with shifted left interval [A-2,B-2] and unchanged right interval [A,B]. The challenge is that both dimension parameters and the size-biased laws change, so this is not a closed scalar three-term recurrence for H_k with p,q,m fixed.

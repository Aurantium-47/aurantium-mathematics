# Two independent simplex weights: shorter single-fibre counterexamples

Explicit counterexamples to the single-permutation fibre real-rootedness conjecture, 10 November 2026.

## Structural family and its direct lattice formula

For positive integers d,l,b,a,q, put v=(1^d,b^l), A=[d], U=[d+l], and P=v+a Delta_A+q Delta_U. Singletons, A and U form a binary building set (merge repeated singleton A when d=1). Thus P is an integral binary nestohedron. Its lattice points are precisely v+r, where r has nonnegative integer coordinates, sum r=a+q, and sum over A of r is at least a. Indeed one can select a units among the A coordinates to split r into the two integral simplex increments. Each r is counted once; decompositions are NOT counted.

Let N_j(x)=sum_{k=1}^j binom(j,k) binom(j,k-1) x^k/j, and write C_j(x)=N_j(x)/x. Set m=a+q. If L_i=[t^i](sum_{j=0}^m C_(1+j)(x)t^j)^d and R_j=[t^j](sum_{h=0}^q C_(b+h)(x)t^h)^l, the exact normalized sum is sum_{i=a}^m L_i R_(m-i). The full sum has an additional factor x^(d+l). This formula is the structural extension: the inner and outer simplex weights are independent. A coordinate-wise truncated polynomial multiplication computes it exactly without listing individual lattice points.

An explicit permutation realizing P starts at (1), applies J(tau,(1)) d-1 times, appends a successive maxima, applies J(tau,(1,...,b)) l times, and appends q maxima. Here J shifts tau by b, concatenates the second permutation, and appends the maximum. Defant's product rule and append rule give P. The resulting length is 2d+(b+1)l+a+q-1; there are d+l-1 descents. Hence this is a genuine SINGLE fibre, not a union of fibres or an abstract operator example.

## Length 111

Take (d,l,b,a,q)=(34,7,4,4,5). There are 41 coordinates, affine dimension 40, coordinate sum 71, and 2046730147 lattice points. Direct exact coefficient calculation gives

N_P(x)=17 x^41 (1+x)^2 (x^2+5x+1)^2 Q_24(x),
Q_24(x)=x^12 F_12(-(1+x)^2/x),
F_12(z)=120395891z^12-2559916854z^11+22674999303z^10-108092050131z^9+299109879326z^8-484616523267z^7+446781321424z^6-225403055871z^5+59144737218z^4-7457159829z^3+393450176z^2-6817524z+24864.

The integer discriminant is strictly negative; its full value is in source/polynomial111.json. The standard-library verifier calculates it using the 23 by 23 Sylvester matrix and fraction-free Bareiss elimination. A real polynomial with all roots real has nonnegative discriminant, so F has nonreal roots. Every nonreal z produces two nonreal solutions of (x+1)^2+zx=0. Thus Q, and therefore the full Narayana sum, is not real-rooted. Independent Sturm verification yields ten positive real roots and two nonreal roots of F, hence exactly four nonreal roots of Q.

## Length 112

Take (d,l,b,a,q)=(30,9,4,3,5). There are 39 coordinates, affine dimension 38, coordinate sum 74, and 259330500 lattice points. Direct calculation gives

N_P(x)=9 x^39 (1+x)^5 (x^2+5x+1)^4 Q_22(x),
Q_22(x)=-x^11 F_11(-(1+x)^2/x),
F_11(z)=28814500z^11-629529956z^10+5701639759z^9-27591223108z^8+76640276561z^7-122419325864z^6+108264411867z^5-50948627246z^4+12152033627z^3-1357864320z^2+61100080z-762720.

The exact negative discriminant is in source/polynomial112.json. The same argument proves nonreal roots. This is a separate even-length construction, NOT an assumption that appending a maximum preserves nonreal roots.

## Propagation and boundaries

Taking the Cartesian product with {(1)} multiplies the sum by N_1(x)=x and J(pi,(1)) increases permutation length by 2. Once both witnesses are independently verified, they give examples for every length at least 111. No absence below 111 is claimed. The witnesses do not disprove log-concavity, and they do not resolve Bona's different conjecture on aggregated t-stack-sortable sets.

Primary source: Colin Defant, Fertilitopes, DCG 70 (2023), 713-752, Conjectures 1.1/1.2, Theorems 3.1/3.2, Corollary 3.3, Proposition 3.8, Lemma 3.9. https://arxiv.org/pdf/2102.11836 ; https://doi.org/10.1007/s00454-023-00488-y . Original conjecture: Stack-Sorting Preimages of Permutation Classes, 2018 preprint Conjecture 11.1, 2020 journal Conjecture 31. https://arxiv.org/pdf/1809.03123v1 ; https://www.mat.univie.ac.at/~slc/wpapers/s82defant.pdf .


## Direct verification from stack sorting

There is also a verifier independent of the geometric correspondence. Let A_w(x) count preimages of a word w with distinct labels by x^des. Set A_empty=1. If a nonempty w does not end in its maximum, A_w=0. Otherwise, write w=u m with m its maximum and split u into every prefix v and suffix z. The identity s(L m R)=s(L)s(R)m gives

A_w(x)=sum_(u=vz) A_v(x) A_z(x) x^[z nonempty].

Indeed the split is unique for each preimage, the boundary from L to m introduces no descent, and the boundary from m to R introduces exactly one descent when R is nonempty. This is an induction on word length and counts each preimage once. The required D_w is x A_w. The standard-library script `verify_direct_stack.py` memoizes this recurrence on contiguous intervals of each explicit target permutation and matches every coefficient of the displayed certificates. Thus the finite verification can be reproduced directly from the definition of stack sorting.

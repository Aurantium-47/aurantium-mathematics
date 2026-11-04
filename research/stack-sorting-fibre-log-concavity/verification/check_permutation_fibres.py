"""Direct exhaustive fiber check; independent of the laminar/tree code.
Standard-library only. Default n<=10 examines 4,037,913 permutations.
"""
from itertools import permutations
from collections import defaultdict
from math import comb
from fractions import Fraction

def stack_sort(p):
    out=[]; stack=[]
    for x in p:
        while stack and stack[-1]<x: out.append(stack.pop())
        stack.append(x)
    out.extend(reversed(stack))
    return tuple(out)

def des(p):return sum(a>b for a,b in zip(p,p[1:]))

if __name__ == '__main__':
    import argparse
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--max-n',type=int,default=10)
    args=parser.parse_args()
    if not 1 <= args.max_n <= 11:
        parser.error('--max-n must be between 1 and 11 (factorial running time)')
    total_inputs=total_fibres=0
else:
    raise RuntimeError('Run this verification as a standalone script')

for n in range(1,args.max_n+1):
    fibres=defaultdict(lambda:[0]*n)
    for p in permutations(range(1,n+1)):
        fibres[stack_sort(p)][des(p)]+=1
    for q,c in fibres.items():
        k=des(q);d=n-2*k-1
        assert d>=0
        a=c[k:n-k]
        assert len(a)==d+1
        assert not any(c[:k]+c[n-k:])
        assert all(a)
        b=[Fraction(ai,comb(d,i)) for i,ai in enumerate(a)]
        assert all(b[i]**2>=b[i-1]*b[i+1] for i in range(1,d)),(n,q,a)
    total_inputs += __import__('math').factorial(n)
    total_fibres += len(fibres)
    print(n,len(fibres),'PASS', flush=True)
print('TOTAL_INPUTS',total_inputs,'TOTAL_NONEMPTY_FIBRES',total_fibres,flush=True)

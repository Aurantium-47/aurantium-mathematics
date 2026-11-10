"""Independent descent enumerator using only s(L m R) = s(L) s(R) m.

For an interval target w ending in its maximum, every preimage has a unique
split w = s(L) s(R) m. Joining L,m adds no descent; m,R adds one iff R is
nonempty. An empty target has one empty preimage. A nonempty target not
ending in its maximum has no preimages. Thus the recurrence below counts
preimages by descents without using valid hooks, nestohedra, or Narayana sums.
"""
from functools import lru_cache
from pathlib import Path
import json

ROOT = Path(__file__).parent / 'source'

def add(a, b):
    out = [0] * max(len(a), len(b))
    for i, v in enumerate(a): out[i] += v
    for i, v in enumerate(b): out[i] += v
    return out

def mul(a, b):
    if not a or not b: return []
    out = [0] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        for j, v in enumerate(b): out[i+j] += u*v
    return out

for n in (111, 112):
    p = json.loads((ROOT / f'permutation{n}.json').read_text())

    @lru_cache(None)
    def D(lo, hi):
        if lo == hi: return [1]
        if p[hi-1] != max(p[lo:hi]): return []
        out = []
        for cut in range(lo, hi):
            term = mul(D(lo, cut), D(cut, hi-1))
            if term and cut < hi-1: term = [0] + term
            out = add(out, term)
        return out

    actual = [0] + D(0, n)
    data = json.loads((ROOT / f'polynomial{n}.json').read_text())
    k = sum(a > b for a, b in zip(p, p[1:]))
    expected = [0] * (k+1) + data['normalized_narayana_ascending']
    assert actual == expected
    print(f'PASS n={n}: direct stack-sorting recursion matches all {len(actual)} coefficients.')

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <numeric>
#include <set>
#include <vector>
using V = std::array<int, 15>;
using C = std::pair<unsigned, unsigned>;
std::vector<C> clauses;
std::vector<int> solutions;
uint64_t visits = 0;
void solve(unsigned yes, unsigned no) {
  visits++;
  bool changed = true;
  while (changed) {
    changed = false;
    for (auto [p, n] : clauses) {
      if ((p & yes) || (n & no))
        continue;
      unsigned rem = (p | n) & ~(yes | no);
      if (!rem)
        return;
      if (!(rem & (rem - 1))) {
        if (rem & p)
          yes |= rem;
        else
          no |= rem;
        changed = true;
      }
    }
  }
  if ((yes | no) == 32767) {
    solutions.push_back(yes);
    return;
  }
  unsigned pick = 0;
  int best = 16;
  for (auto [p, n] : clauses) {
    if ((p & yes) || (n & no))
      continue;
    unsigned rem = (p | n) & ~(yes | no);
    int k = __builtin_popcount(rem);
    if (k < best) {
      best = k;
      pick = rem & -rem;
    }
  }
  if (!pick) {
    unsigned rem = 32767 & ~(yes | no);
    pick = rem & -rem;
  }
  solve(yes | pick, no);
  solve(yes, no | pick);
}
std::vector<int> find(V v, int m) {
  clauses.clear();
  for (int t = 1; t < m; t++) {
    unsigned pos = 0, neg = 0;
    bool taut = false;
    for (int i = 0; i < 15; i++) {
      bool b[2];
      for (int x = 0; x < 2; x++) {
        int r = (v[i] + x * (m / 2)) * t % m;
        b[x] = (r * 16 < m || (m - r) * 16 < m);
      }
      if (b[0] && b[1]) {
        taut = true;
        break;
      }
      if (b[0])
        neg |= 1u << i;
      if (b[1])
        pos |= 1u << i;
    }
    if (!taut)
      clauses.emplace_back(pos, neg);
  }
  std::sort(clauses.begin(), clauses.end());
  clauses.erase(std::unique(clauses.begin(), clauses.end()), clauses.end());
  std::sort(clauses.begin(), clauses.end(), [](C a, C b) {
    return __builtin_popcount(a.first | a.second) <
           __builtin_popcount(b.first | b.second);
  });
  solutions.clear();
  solve(0, 0);
  std::sort(solutions.begin(), solutions.end());
  return solutions;
}
bool brute(V v, int m, int mask) {
  for (int t = 1; t < m; t++) {
    bool all = true;
    for (int i = 0; i < 15; i++) {
      int r = (v[i] + ((mask >> i) & 1) * (m / 2)) * t % m;
      if (r * 16 < m || (m - r) * 16 < m) {
        all = false;
        break;
      }
    }
    if (all)
      return false;
  }
  return true;
}
int main() {
  auto start = std::chrono::steady_clock::now();
  V a;
  std::iota(a.begin(), a.end(), 1);
  std::vector<V> parents{a};
  for (int l = 2; l <= 16; l *= 2) {
    int m = 31 * l;
    std::set<V> next;
    size_t done = 0;
    uint64_t raw = 0;
    for (V v : parents) {
      if (std::chrono::duration<double>(std::chrono::steady_clock::now() -
                                        start)
              .count() > 240) {
        std::cout << "INCOMPLETE " << l << " " << done << std::endl;
        return 2;
      }
      auto masks = find(v, m);
      if (done == 0 || done == parents.size() / 2 ||
          done + 1 == parents.size()) {
        std::vector<int> b;
        for (int q = 0; q < 32768; q++)
          if (brute(v, m, q))
            b.push_back(q);
        if (b != masks) {
          std::cerr << "MISMATCH";
          return 1;
        }
      }
      raw += masks.size();
      for (int mask : masks) {
        V w;
        for (int i = 0; i < 15; i++)
          w[i] = v[i] + ((mask >> i) & 1) * (m / 2);
        bool drop = false;
        for (int i = 0; i < 15; i++) {
          int g = l;
          for (int j = 0; j < 15; j++)
            if (i != j)
              g = std::gcd(g, w[j]);
          if (g > 1)
            drop = true;
        }
        if (drop)
          continue;
        for (auto &z : w)
          z = std::min(z, m - z);
        std::sort(w.begin(), w.end());
        next.insert(w);
      }
      done++;
    }
    uint64_t h = 14695981039346656037ull;
    for (auto v : next)
      for (int z : v)
        for (int b = 0; b < 4; b++) {
          h ^= (z >> (8 * b)) & 255;
          h *= 1099511628211ull;
        }
    std::ofstream out("runner_dpll/level" + std::to_string(l) + ".bin",
                      std::ios::binary);
    for (auto v : next)
      out.write((char *)v.data(), 60);
    std::cout << "level=" << l << " parents=" << parents.size()
              << " raw=" << raw << " survivors=" << next.size() << " fnv=" << h
              << " seconds="
              << std::chrono::duration<double>(
                     std::chrono::steady_clock::now() - start)
                     .count()
              << std::endl;
    parents.assign(next.begin(), next.end());
  }
}

#include <algorithm>
#include <array>
#include <chrono>
#include <fstream>
#include <iostream>
#include <numeric>
#include <set>
#include <vector>
using V = std::array<int, 15>;
using B = std::array<unsigned long long, 8>;
B full;
std::array<std::array<B, 2>, 15> bad;
std::array<B, 16> suffix;
int words, mod;
unsigned long long nodes, prunes, leaves;
std::vector<int> answers;
bool covered(const B &b) {
  for (int j = 0; j < words; j++)
    if (b[j] != full[j])
      return false;
  return true;
}
void dfs(int depth, int mask, B cur) {
  nodes++;
  B possible = cur;
  for (int j = 0; j < words; j++)
    possible[j] |= suffix[depth][j];
  if (!covered(possible)) {
    prunes++;
    return;
  }
  if (depth == 15) {
    leaves++;
    answers.push_back(mask);
    return;
  }
  for (int bit = 0; bit < 2; bit++) {
    B n = cur;
    for (int j = 0; j < words; j++)
      n[j] |= bad[depth][bit][j];
    dfs(depth + 1, mask | (bit << depth), n);
  }
}
std::vector<int> search(V v, int l, bool brute) {
  mod = 31 * l;
  int half = mod / 2;
  words = (half + 63) / 64;
  full = {};
  bad = {};
  suffix = {};
  for (int t = 1; t <= half; t++)
    full[(t - 1) / 64] |= 1ull << ((t - 1) % 64);
  for (int i = 0; i < 15; i++)
    for (int b = 0; b < 2; b++)
      for (int t = 1; t <= half; t++) {
        int r = (v[i] + b * (mod / 2)) * t % mod;
        if (16 * std::min(r, mod - r) < mod)
          bad[i][b][(t - 1) / 64] |= 1ull << ((t - 1) % 64);
      }
  answers.clear();
  if (brute) {
    for (int mask = 0; mask < 32768; mask++) {
      B u{};
      for (int i = 0; i < 15; i++)
        for (int j = 0; j < words; j++)
          u[j] |= bad[i][(mask >> i) & 1][j];
      if (covered(u))
        answers.push_back(mask);
    }
  } else {
    for (int i = 14; i >= 0; i--)
      for (int j = 0; j < words; j++)
        suffix[i][j] = suffix[i + 1][j] | bad[i][0][j] | bad[i][1][j];
    dfs(0, 0, B{});
  }
  std::sort(answers.begin(), answers.end());
  return answers;
}
int main() {
  auto globalstart = std::chrono::steady_clock::now();
  V a;
  std::iota(a.begin(), a.end(), 1);
  std::vector<V> parents{a};
  for (int l = 2; l <= 16; l *= 2) {
    std::set<V> next;
    nodes = prunes = leaves = 0;
    double bt = 0, dt = 0;
    size_t done = 0;
    for (auto v : parents) {
      if (std::chrono::duration<double>(std::chrono::steady_clock::now() -
                                        globalstart)
                  .count() > 120 ||
          next.size() > 2000000) {
        std::cout << "INCOMPLETE level=" << l << " completed_parents=" << done
                  << " total=" << parents.size()
                  << " retained_so_far=" << next.size() << std::endl;
        return 2;
      }
      auto t = std::chrono::steady_clock::now();
      auto x = search(v, l, false);
      dt += std::chrono::duration<double>(std::chrono::steady_clock::now() - t)
                .count();
      t = std::chrono::steady_clock::now();
      auto y = l <= 4 ? search(v, l, true) : x;
      bt += std::chrono::duration<double>(std::chrono::steady_clock::now() - t)
                .count();
      if (v == parents.front()) {
        std::ofstream f("runner16_math/fiber" + std::to_string(l) + ".txt");
        for (int z : v)
          f << z << " ";
        f << "\n";
        for (int mask : x)
          f << mask << " ";
        f << "\n";
      }
      if (x != y) {
        std::cerr << "MISMATCH";
        return 1;
      }
      for (int mask : x) {
        V w;
        for (int i = 0; i < 15; i++)
          w[i] = v[i] + ((mask >> i) & 1) * (31 * l / 2);
        bool proper = false;
        for (int i = 0; i < 15; i++) {
          int g = l;
          for (int j = 0; j < 15; j++)
            if (j != i)
              g = std::gcd(g, w[j]);
          if (g > 1)
            proper = true;
        }
        if (!proper) {
          for (auto &z : w)
            z = std::min(z, 31 * l - z);
          std::sort(w.begin(), w.end());
          next.insert(w);
        }
      }
      done++;
      if (done % 100000 == 0)
        std::cout << "progress level=" << l << " parents=" << done
                  << " retained=" << next.size() << std::endl;
    }
    std::cout << "level=" << l << " complete_parents=" << parents.size()
              << " potential_assignments=" << 32768ull * parents.size()
              << " nodes=" << nodes << " prunes=" << prunes
              << " accepted_leaves=" << leaves << " survivors=" << next.size()
              << " bnb_seconds=" << dt << " brute_seconds=" << bt << std::endl;
    {
      std::ofstream out("runner16_math/full_level" + std::to_string(l) + ".bin",
                        std::ios::binary);
      for (const auto &record : next)
        out.write(reinterpret_cast<const char *>(record.data()),
                  sizeof(int) * 15);
    }
    parents.assign(next.begin(), next.end());
    if (parents.empty())
      break;
  }
}

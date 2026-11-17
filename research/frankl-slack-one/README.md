# Frankl 55-member slack-one search: reproducible draft

An explicit three-case reduction and exact SAT encoding for the **m=13** branch of a hypothetical smallest 55-member counterexample. This is a working computational artifact, not a new Frankl bound: **all three branches are UNKNOWN; the m=14 boundary case is also unresolved here**. Novelty of the elementary slack decomposition has not been established.

The reduction follows Hu's maximal-partner counting method, not a product-measure assumption. It permits one extra nonprincipal downset in one branch and retains all intersections involving it. See [structure](structure.md), [independent mathematical audit](audit-structure.md), and [independent encoding audit](audit-encoding.md).

The independent audits are separate AI-assisted checks, not human peer review.

## What is included

- Exact, decodable CNF generator and direct reconstructed-family verifier.
- 13,440 end-to-end small semantic tests; an independent 9,600-case oracle, including an intersection that must target the extra downset.
- Representation checks on 5,093 union-closed families, plus independent checks on 3,255 arbitrary families / 18,765 distinguished pairs.
- Bounded exploration logs: Glucose 4.1 / python-sat 1.9.dev22, every branch UNKNOWN. CNF hashes are embedded in logs.
- A separately verified nontrivial PHP(5,4) proof-format test and two rejecting controls. This validates the proof pipeline, not the research conjecture.

Large regenerated CNFs, dependencies, solver/checker binaries, and the earlier author's archive are deliberately excluded.

## Reproduce (from this directory; Python 3.12)

```sh
python -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
python test_blocks.py
python audit_structure.py
python slack_sat.py
python audit_sat.py
for b in 00 10 01; do python slack_sat.py --emit "$b"; done
```

The generated instances are respectively 33,141 / 33,564 / 33,331 variables and 706,751 / 721,346 / 712,703 clauses. Each `.map.json` retains semantic row and order variables. `Encoding.decode` rejects incomplete semantic models; `Encoding.check` reconstructs sets and checks closure and frequencies.

Bounded Linux exploration (1.5 GiB address-space limit, CPU 40/45 seconds, wall limit50 seconds,20,000 conflict budget checked at solver interruption points):

```sh
for b in 00 10 01; do
  timeout --signal=TERM --kill-after=2 50s python -u run_explore.py "$b" > "explore_$b.log" 2>&1
  code=$?
  printf 'process_exit=%s\n' "$code" >> "explore_$b.log"
  if [ "$code" -ne 0 ]; then echo 'UNKNOWN: process/resource limit' >> "explore_$b.log"; fi
 done
```

An UNSAT solver message is not sufficient: preserve its actual proof and verify against the exact CNF hash using an independent checker, in addition to auditing the reduction and encoding. `run_explore.py` saves proof output if it receives UNSAT, without elevating that to a proved mathematical result.

## Check the proof pipeline

```sh
python check_proof_pipeline.py
git clone https://github.com/marijnheule/drat-trim.git checker_drat_trim
git -C checker_drat_trim checkout 2e3b2dc0ecf938addbd779d42877b6ed69d9a985
gcc -D_DEFAULT_SOURCE checker_drat_trim/drat-trim.c -std=c99 -O2 -o checker_drat_trim/drat-trim
checker_drat_trim/drat-trim php54.cnf php54.drat
# Both next commands must reject (exit1):
checker_drat_trim/drat-trim php54.cnf php54.empty.drat
checker_drat_trim/drat-trim php54.sat_control.cnf php54.drat
```

The checked small CNF/proof and controls are retained in `certificates/`. See [proof-pipeline report](proof-pipeline.md).

## Prior work and open obligations

- Hu (2017), [arXiv:1706.06167](https://arxiv.org/abs/1706.06167): maximal-partner argument and the proved 4m−1 bound used in the reduction.
- Bhattacharjee–Bhattacharya, [Zenodo23645724](https://zenodo.org/records/23645724), repository [eUUR](https://github.com/anaxia-research/eUUR), inspected commit `aa658666fd48f92983778946f6c538dbbc270e17`: claimed54-member computational result and explicit remark identifying the55-member slack issue. This package does not independently certify that earlier computational theorem.
- Costa–Sadhu, [arXiv:2610.02295](https://arxiv.org/abs/2610.02295), and Jiang, [arXiv:2609.08291](https://arxiv.org/abs/2609.08291): related entropy/coupling context, not a source of a claimed new bound here.

A complete55-member exclusion would still require the ground-size reduction, rigorous exclusion of all three m=13 cases and the m=14 boundary case, and complete independently checked proof artifacts. None of those exclusions is claimed in this draft. The counting decomposition may already be known; this is reproducible research preparation, not a priority claim.

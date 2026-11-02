# 代表猜想与原始出处

首页采用人名或数学对象的简洁名称，完整题意、版本与原文编号保留在下表。每一项的证明范围可直接对照原文。

| 猜想与研究对象 | 本研究给出的结果 | 原文与证明 |
| --- | --- | --- |
| **Katthän多项式性猜想**<br><sub>Lecture Hall多项式</sub> | 证明每个Lecture Hall递归有理函数都是多项式，覆盖任意长度；原文计算验证到12 | [Katthän（2018），猜想3.4，第4—5页](https://arxiv.org/pdf/1809.01377#page=4) · [证明与推广](https://github.com/Aurantium-47/lecture-hall-polynomiality) |
| **Karp二阶实根猜想** | 给出二阶正满支撑目标的另一条证明，采用Beta矩、Bernstein多项式与Gauss–Lucas卷积路线 | [Karp（2012），猜想3](https://arxiv.org/html/1203.1482) · [本项目证明及同期工作](KARP_COMPARISON.md) |
| **Wang–Xin次数猜想**<br><sub>Catalan幂Hankel行列式 · Cigler表述</sub> | 对原文指定的两个余类，证明所有j≥1、k≥2j−1的精确次数公式；从有限特例推广到整个参数范围 | [Cigler（2023），猜想6，式(19)](https://arxiv.org/pdf/2308.07642v2#page=4) · [完整证明](https://github.com/Aurantium-47/even-catalan-hankel-degrees) |
| **Ulas无实根猜想**<br><sub>指定的Stern多项式族</sub> | 证明指定Stern多项式族对所有自然数下标、所有实数变量严格为正，从而没有实根 | [Ulas（2019），猜想4.4，第16页](https://arxiv.org/pdf/1909.10844v1#page=16) · [证明与Lean源码](https://github.com/Aurantium-47/stern-polynomial-positivity) |
| **Peak末实根猜想** | 证明指定最后实根结论，补齐剩余非整数区间的符号论证 | [Billey–Fahrbach–Talmage原文，猜想6.6，第19页](https://arxiv.org/pdf/1410.8506#page=19) · [证明及前人成果对照](https://github.com/Aurantium-47/peak-polynomial-last-real-root) |
| **Howroyd猜想** | 补齐另外两个模3余类的27集计数与分类；结合已知的整除分支覆盖原猜想 | [OEIS A297557](https://oeis.org/A297557) · [Machacek原文猜想1.1](https://arxiv.org/pdf/2010.11112) · [证明与分类](https://github.com/Aurantium-47/howroyd-27-conjecture) |
| **K₆链装填着色猜想** | 给出22色上界的反例，证明目标链家族的23色统一锐界 | [Furmańczyk等（2025），猜想2](https://arxiv.org/pdf/2511.12761#page=12) · [反例与锐界](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) |

次数问题承接Wang–Xin2018年预印本、2019年期刊版的工作；Cigler在2023年猜想6的标题中明确标注“Wang–Xin，猜想10”。[Wang–Xin原文](https://arxiv.org/pdf/1811.00248v2#page=3)。本研究采用Cigler式(19)明确写出的参数范围，保留这一来源归属。

Stern项目还给出反例，否定Ulas猜想4.3最后一条单调性断言；该猜想中一般唯一实根等其他条款未因此得到证明。Lecture Hall的进一步代数结构见其独立推广说明。

## 本次更新 · 2026年11月2日

**三项式原始目标范围升级。** [公开计算机辅助证明草稿（固定版本68f4c920）](https://github.com/Aurantium-47/eventual-infinite-log-concavity/tree/68f4c920606ad239fbc3a8195bc0987b790f5905/research/trinomial-all-n-ge10)覆盖[Medina–Straub（2014）例5.3](https://arxiv.org/pdf/1405.1765v1#page=11)：对所有整数n≥10，(1+x+x²)^n的系数序列经零延拓后，全部对数凹迭代均非负。[PR #2](https://github.com/Aurantium-47/eventual-infinite-log-concavity/pull/2)仍为未合并草稿；已完成独立AI内部数学复核与精确重放，不等于人工同行评审或Lean形式化。该旧成果组由部分解答改列原始目标解答：当前27组中18项主要目标解答（14项肯定、4项反例）、6项部分解答、3项构造／分类；7组推广和9个含Lean材料项目不变。不把一般多项式猜想5.2另计一次，也不借此重新认证其证明。

该原始目标在[旧主分支论文式(T)](https://github.com/Aurantium-47/eventual-infinite-log-concavity/blob/757ff0e95175a988c4ae52d426157f9a2e01e4c4/paper/proof.tex#L53-L57)明确列出。新草稿的[解析章§1](https://github.com/Aurantium-47/eventual-infinite-log-concavity/blob/68f4c920606ad239fbc3a8195bc0987b790f5905/research/trinomial-all-n-ge10/ANALYTIC_PROOF.md)与[有限／代数章§§1—3](https://github.com/Aurantium-47/eventual-infinite-log-concavity/blob/68f4c920606ad239fbc3a8195bc0987b790f5905/research/trinomial-all-n-ge10/FINITE_AND_ALGEBRAIC_PROOF.md)分别覆盖n≥4004及10≤n≤4003，并补齐早期迭代。[验证附录](https://github.com/Aurantium-47/eventual-infinite-log-concavity/blob/68f4c920606ad239fbc3a8195bc0987b790f5905/research/trinomial-all-n-ge10/README.md)记录3,994个有限指数、15项解析检查、1,929个边界包围的完整新重建，以及与63个旁路盒的覆盖核对；边界重建使用经复核的双队列可恢复封装，不是直接运行`regenerate.py --full`。算术重放与数学论证的区别见[验证映射](https://github.com/Aurantium-47/eventual-infinite-log-concavity/blob/68f4c920606ad239fbc3a8195bc0987b790f5905/research/trinomial-all-n-ge10/ANALYTIC_VERIFICATION_MAP.md)。

原有一般严格正满支撑多项式充分大整数幂结果及增长深度细化保留为同组历史材料。本次复核与计数升级只针对例5.3；不声称非整数幂、内部零系数／稀疏支撑、任意符号、统一于所有多项式的阈值或其他全指数分类已获证明。

**[BRW τ实性团粘合：统一圈替换与结构类](https://github.com/Aurantium-47/brw-tau-clique-attachments)**。将任意普通τ实图替换到任意圈C_(m+2)的一个顶点（所有m≥1），所得图仍为普通τ实图，且Bell边商只有非正实根，因此可与任意普通τ实图沿边粘合，操作可迭代。[统一已发布证明版本](https://github.com/Aurantium-47/brw-tau-clique-attachments/tree/dc6d35ba53c6a41064bc9982cb524b05b74dc2ff/extensions/2026-11-02-uniform-cycle-substitution)。根的单调性与扩充箭头矩阵不变量给出覆盖所有圈长及输入次数的普通数学证明，不依赖有限算例外推；具有互异严格负实根的输入给出严格交错，非零边界输入给出弱交错。不宣称任意同时图替换或不受限的大团粘合。

统一定理包含此前C₅/C₇替换及Θ(2ᵏ,m)特例（2ᵏ表示k条长度为2的路径），并不替代独立的[全三路径定理](https://github.com/Aurantium-47/brw-tau-clique-attachments/tree/cfa1f5fd798116b44ddc95da6f90710e48fac14a/extensions/2026-11-02-all-theta)：全部a,b,c≥2的Θ(a,b,c)有严格负实根Bell边商；也不替代[任意路径数的充分长条件](https://github.com/Aurantium-47/brw-tau-clique-attachments/tree/b40ae7bc9df78ab78d47470d26c1915a0208182f/extensions/2026-11-02-parallel-paths)。带锚点不可比图的团商定理仍保留。给实根Bell边商的种子H添加通用团K_s，可覆盖团商阶数0≤j≤s+2；仅当H无三角形时覆盖全部可能团交。

BRW仍计为**一个部分结果组**；目录保持27组、18项主要目标解答（14项肯定结论与4项反例）、6组部分解答、3组构造与分类、7组推广及9个含Lean材料项目。一般BRW猜想6.5未解决，猜想6.6是不同的图联接问题。统一证明经过独立AI内部复核，不是人工同行评审或证明助手形式化；全三路径定理保留其计算机辅助证明与精确证书。文献比较尚不完整，Mu–Shen–Xu全文未取得、精确重叠待核，不宣称历史首创或全球开放状态。

## 新增及升级目标 · 2026年10月22日

| 题目与原始版本 | 过去的进展 | 本次结论与边界 |
| --- | --- | --- |
| [Zudilin B多项式根位置观察（2015），Section 4](https://arxiv.org/abs/1504.07696) | 原文定义、递推、反射恒等式和实验观察；Long等（2020）研究不同参数设置的渐近性质 | [完整全实参数证明](https://github.com/Aurantium-47/zudilin-b-polynomial-real-rootedness)；变量x=t³；非例外参数严格负根和交错；仅部分Lean伴随 |
| [Koelink–Román–Zudilin（2024），arXiv v2猜想3.4](https://arxiv.org/abs/2409.00261v2) | Proposition 3.1证明充分大t的实根及交错；Durán（2025）研究不同归一化和量词 | [精确反例](https://github.com/Aurantium-47/orthogonal-partial-sum-threshold-counterexample)否定单阈值；期刊最终全文未核对，不宣称反驳未经核对的版本 |
| [Rather（2025），Theorem 2.16后的未编号问题](https://doi.org/10.61091/jcmcc126-19) | Burcroff–O’Brien：三叶片／奇数阶四叶片；Zhang：N≥8192；Omar：阈值图及充分判据 | [全叶片单峰性](https://github.com/Aurantium-47/clique-join-domination-polynomials)；同一旧成果组升级，四叶片加强不另计数；零点问题仍未覆盖 |

这三项是两个新增项目与一个旧项目的范围升级；不把定理、推论、旧特例逐项累计为新增猜想。

## 猜想与开放问题

论文中的“Conjecture”是作者明确提出、当时尚无证明的断言；“Question”或“Problem”是作者提出的问题。两者都是正常的数学研究目标。并非每项猜想都有广为人知的专名，按“作者＋原文编号”引用很常见。

本目录也有原文称为问题的目标，例如：

- **Stamate–Strazzanti 问题5.4**：数值半群平移族的最终行为。[研究结果](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues)
- **Omar–Troyka 问题5.1、5.2**：峰集和X-descent的增长率存在性。[研究结果](https://github.com/Aurantium-47/peak-and-x-descent-growth-rates)
- **Lewis–Morales 注6末尾的问题**：特定q-rook多项式的单峰性。[研究结果](https://github.com/Aurantium-47/rook-polynomial-unimodality)

因此，首页合称“猜想与开放问题”。18是按项目主要目标统计的原题解答数（含clique-join已完整解决的单峰性子问题，不表示其零点问题也解决），其中含Karp的另一条证明，不把一个项目中的每条定理、推论和反例拆开累加。部分解答与原题之外的推广分别统计，见[统计说明](METHODS.md)。

[返回首页](README.md)

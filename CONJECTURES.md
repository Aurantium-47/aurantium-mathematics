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

**[BRW τ实性团粘合：结构类与 theta 图的统一阈值定理](https://github.com/Aurantium-47/brw-tau-clique-attachments)**。对分为k个非空独立类、每类有一个与类外所有顶点相邻的锚点的不可比图，证明所有0≤j≤k的Bell色多项式团商只有非正实根，从而与任意τ实图沿任意团普通粘合保持τ实性。另证明存在同一个整数M，使所有a,b,c≥2且max(a,b,c)≥M的Θ(a,b,c)边商只有非正实根，得到相应的普遍沿边粘合结论。

[结构定理文稿](https://github.com/Aurantium-47/brw-tau-clique-attachments/tree/1ecaf2df19a751422a4672a4ccb30aefe8f73f51/extensions/2026-11-02)与[统一theta补充证明](https://github.com/Aurantium-47/brw-tau-clique-attachments/tree/1ecaf2df19a751422a4672a4ccb30aefe8f73f51/extensions/2026-11-02-uniform-theta)均附精确符号检查。M没有给出数值；本工作未解决有限多个未覆盖的路径长度三元组，也不声称其为反例。这是Brenti、Royle、Wagner于[1994年提出的猜想6.5](https://doi.org/10.4153/CJM-1994-002-3)的部分结果，不是一般猜想或全部theta图的解答；猜想6.6为不同的图联接问题。

新增**一个部分结果组**，目录为27组，其中7组部分解答；17项主要目标解答、7组推广及9个含Lean材料的项目均不增加。AI辅助文字证明与有限精确检查不等于人工同行评审或形式化验证；有限检查不替代充分大参数结论的分析证明。文献比较尚不完整，与Mu–Shen–Xu 2026年τ多项式论文的精确重叠待核，不宣称历史首创或全球开放状态。

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

因此，首页合称“猜想与开放问题”。17是按项目主要目标统计的原题解答数（含clique-join已完整解决的单峰性子问题，不表示其零点问题也解决），其中含Karp的另一条证明，不把一个项目中的每条定理、推论和反例拆开累加。部分解答与原题之外的推广分别统计，见[统计说明](METHODS.md)。

[返回首页](README.md)

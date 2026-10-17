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

## 猜想与开放问题

论文中的“Conjecture”是作者明确提出、当时尚无证明的断言；“Question”或“Problem”是作者提出的问题。两者都是正常的数学研究目标。并非每项猜想都有广为人知的专名，按“作者＋原文编号”引用很常见。

本目录也有原文称为问题的目标，例如：

- **Stamate–Strazzanti 问题5.4**：数值半群平移族的最终行为。[研究结果](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues)
- **Omar–Troyka 问题5.1、5.2**：峰集和X-descent的增长率存在性。[研究结果](https://github.com/Aurantium-47/peak-and-x-descent-growth-rates)
- **Lewis–Morales 注6末尾的问题**：特定q-rook多项式的单峰性。[研究结果](https://github.com/Aurantium-47/rook-polynomial-unimodality)

因此，首页合称“猜想与开放问题”。14是按项目主要目标统计的原题解答数，其中含Karp的另一条证明，不把一个项目中的每条定理、推论和反例拆开累加。部分解答与原题之外的推广分别统计，见[统计说明](METHODS.md)。

[返回首页](README.md)

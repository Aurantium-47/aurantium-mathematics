# 问题的来历、前人的进展与本系列贡献

[返回首页](README.md) · [完整文献目录](SOURCES.md)

## 研究脉络

### 01 · Howroyd：为什么最大独立集恰好有27个？

**2018年提出 · 2021年出现部分证明 · 图论与代数组合 · Lean形式化**

Andrew Howroyd于2018年1月1日在[OEIS A297557](https://oeis.org/A297557)提出一个周期现象：三角网格的最大独立集数量，最终反复出现1、27、27。John Machacek随后证明可被3整除的分支具有唯一最大独立集，论文发表于**LAGOS 2021会议论文集，Procedia Computer Science 195**。[前人论文](https://arxiv.org/abs/2010.11112)

本项目补齐另外两个余类，并给出全部最大独立集的结构分类。27来自三个背景色类，每一类对应9种角部延拓：**3 × 9 = 27**。因此，计算中出现的规律有了对所有允许参数成立的解释。相应27集定理已完成Lean形式化。

→ [证明、分类与精确证书](https://github.com/Aurantium-47/howroyd-27-conjecture)

### 02 · Lecture Hall：从2018年的多项式猜想到代数结构

**2018年提出 · 原文验证至长度12 · 多项式性、SAGBI基与toric退化**

Lukas Katthän在[The Lecture Hall Cone as a toric deformation](https://arxiv.org/abs/1809.01377)中提出两个相互关联的猜想：递归定义的Laurent多项式是否其实都是多项式，以及相应代数能否解释Lecture Hall锥的结构。原文报告了长度不超过12的计算验证，材料来自**大阪大学2018年格点多面体研讨会**。

本项目把特定递归序列识别为带符号Dyck路径的有限权重和，证明全下标多项式性；进一步给出最小单首SAGBI基、领先指数与Hilbert基的对应，以及到半群代数的平坦退化。核心多项式性和路径识别已有Lean证明，代数推广附有完整文字证明。

这条研究线连接**组合路径、行列式恒等式与交换代数**。原题之外，Flajolet的连分数理论（Discrete Mathematics，1980）与Sokal的系统论述（Expositiones Mathematicae，2023）提供经典工具；三项文献的角色在项目中分别列明。

→ [多项式证明与SAGBI推广](https://github.com/Aurantium-47/lecture-hall-polynomiality)

### 03 · 化学图极值：把一个余类推进到所有规模

**2024年原题 · 4位原作者 · Applied Mathematics and Computation · 全部n ≥ 7**

Knor、Škrekovski、Filipovski与Dimitrov在[Extremizing antiregular graphs by modifying total σ-irregularity](https://doi.org/10.1016/j.amc.2024.129199)中提出Conjecture 10：在最大度数不超过4的连通简单图中，哪些度数重数使指定的全点对不规则度达到最大？2026年[Discrete Mathematics Letters后续论文](https://doi.org/10.47443/dml.2026.041)报告了顶点数可被4整除的情形。

本项目覆盖**所有n ≥ 7的四个模4余类**，同时证明每个候选度数向量都可由连通简单图实现。结果给出完整的极值度数重数分类，包含两个容易遗漏的n ≡ 2分支，并完成原目标的Lean形式化。

→ [全参数分类与形式化证明](https://github.com/Aurantium-47/chemical-graph-sigma-extremizers)

### 04 · Peak多项式：排除一个完整实区间里的根

**2014年预印本 · 2016年期刊版本 · Experimental Mathematics · 实代数与排列枚举**

Billey、Fahrbach与Talmage研究排列的峰集所对应的多项式，其[Coefficients and roots of peak polynomials](https://arxiv.org/abs/1410.8506)发表于**Experimental Mathematics 25(2)，2016**。本项目对应其Conjecture 6.6。后续有Diaz-Lopez、Harris、Insko与Omar的正性论文（**JCTA，2017**），以及Li于2026年的[系数研究稿](https://doi.org/10.5281/zenodo.22832569)。

本项目给出自包含积分论证，控制倒数第二峰a与最后一峰m之间<strong>整个实区间 (a,m)</strong>的符号，得到m是a之后唯一实根，且对峰的数量、位置和间距不设有限上限。与Li结果的比较中，新增分析集中在剩余的非整数区间(a,m−1)，已知右侧正性等结论保留原归属。

→ [完整区间的符号论证](https://github.com/Aurantium-47/peak-polynomial-last-real-root)

### 05 · Fence：一个237步轨道改变命题的真假

**2021年预印本 · 2023年期刊论文 · 4位原作者 · Algebraic Combinatorics**

Elizalde、Plante、Roby与Sagan在[Rowmotion on fences](https://arxiv.org/abs/2108.12443)中研究偏序集上的组合动力系统。Conjecture 5.4(b)预测某类fence的序理想大小，在完整轨道上的平均值固定。

本项目构造32元素fence上的一个237步轨道，大小总和为3774，平均值为**1258/79，而非16**，从而否定该条断言。完整轨道及其最小周期均有证书，并由Lean内核核验。这个例子展示了反例的价值：一个可彻底检查的对象，足以划清一般规律的边界。

→ [反例、完整轨道与Lean证明](https://github.com/Aurantium-47/fence-rowmotion-counterexample)

### 06 · K6链：用精确证书把22改成锐界23

**2025年提出 · 3位原作者 · 图着色与有限状态证书**

Furmańczyk、Gözüpek与Özkan在[Packing coloring of graphs with long paths](https://arxiv.org/abs/2511.12761)中提出统一22色上界。这里同色顶点的距离限制随颜色编号增加，局部可行并不保证整条链可行。

本项目给出450顶点、1199条边的H75，排除22色；再构造统一的23色周期方案，得到所有链的23色上界，并对t ≥ 75证明精确值为23。否定部分由**16,646,562条秩证书记录**支撑，配有Python与C++检查器。

→ [锐界证明与可复核证书](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring)

## 前人研究与论文出处

当前目录整理了**24条问题来源、36条相关研究与工具文献，共60条记录**，覆盖百余个作者署名。下面几条线索能说明这些问题处在怎样的研究积累之中。

| 研究线 | 目录中的前人线索 | 发表载体 |
| --- | --- | --- |
| Howroyd | 原始OEIS提问；Machacek的可被3整除分支 | OEIS；LAGOS 2021 / Procedia Computer Science |
| Lecture Hall | Katthän原题；Flajolet连分数理论；Sokal系统论述 | Osaka研讨会材料；Discrete Mathematics；Expositiones Mathematicae |
| 化学图 | Knor等4位作者的原题；Dimitrov等人的一个模4余类结果 | Applied Mathematics and Computation；Discrete Mathematics Letters |
| Peak多项式 | Billey–Fahrbach–Talmage原题；Diaz-Lopez等4人的正性论文；Li的系数稿 | Experimental Mathematics；JCTA；Zenodo研究稿 |
| Hurwitz | Coulter–Do–Moskovsky原题；Accadia–Lewanski–Ruzza框架；Yang的相关渐近研究 | Canadian Journal of Mathematics；两篇arXiv预印本 |
| 无三角形循环图 | Ayat等原题；Sidorenko、Brandt的构造；Bickle–Cream–Gould的端点结果 | AIMS Mathematics；Discrete Mathematics |

这里既有对同一问题的推进，也有证明所使用的经典工具。逐篇关系、作者和DOI见[文献目录](SOURCES.md)。

原题涉及**Applied Mathematics and Computation、Experimental Mathematics、Journal of Graph Theory、Canadian Journal of Mathematics、Algebraic Combinatorics、Electronic Journal of Combinatorics、Journal of Pure and Applied Algebra**等专业期刊。分区按明确版次列在[研究背景](REPORT.zh.md)，成果本文的发布状态见各项目。


## 24个项目的来源年代

Howroyd的提问日期明确为2018年1月1日；Katthän的Lecture Hall猜想见2018年原文。Peak项目采用2016年期刊版本，预印本首发于2014年。按2026减采用版年份，下面22项可定年来源相距0–14年，平均4年；这个量描述文献年代，项目的具体研究历史见上文。

2000年技术报告由后文书目旁证，单列；Stanton作者手稿暂未定年。Karp二阶实根问题于2012年提出，本系列于2026年给出另一条证明；同期工作的先后记录另列。

| 问题／项目 | 来源首年 | 采用版本年 | 截至2026年与采用版相距 | 出处 |
| --- | --- | --- | --- | --- |
| [Howroyd 27集分类](https://github.com/Aurantium-47/howroyd-27-conjecture) | 2018 | 2018 | 8年 | [OEIS A297557](https://oeis.org/A297557) |
| [化学图极值度数分类](https://github.com/Aurantium-47/chemical-graph-sigma-extremizers) | 2024 | 2024 | 2年 | [Applied Mathematics and Computation](https://arxiv.org/abs/2411.01530) |
| [Stern多项式正性](https://github.com/Aurantium-47/stern-polynomial-positivity) | 2019 | 2019 | 7年 | [Publicationes Mathematicae Debrecen / arXiv固定版](https://arxiv.org/abs/1909.10844) |
| [Hardinian数组渐近](https://github.com/Aurantium-47/hardinian-array-asymptotics) | 2023 | 2024 | 2年 | [Electronic Journal of Combinatorics](https://doi.org/10.37236/12358) |
| [无三角形循环图存在性](https://github.com/Aurantium-47/triangle-free-circulant-existence) | 2020 | 2020 | 6年 | [AIMS Mathematics](https://doi.org/10.3934/math.2020242) |
| [五点集合装填密度](https://github.com/Aurantium-47/nonmixed-five-point-packing) | 2024 | 2025 | 1年 | [Journal of Graph Theory](https://doi.org/10.1002/jgt.23269) |
| [Lecture Hall多项式与退化](https://github.com/Aurantium-47/lecture-hall-polynomiality) | 2018 | 2018 | 8年 | [2018 Osaka Lattice Polytopes Workshop / arXiv](https://arxiv.org/abs/1809.01377) |
| [Fence行运动反例](https://github.com/Aurantium-47/fence-rowmotion-counterexample) | 2021 | 2023 | 3年 | [Algebraic Combinatorics](https://doi.org/10.5802/alco.256) |
| [K6链装填着色](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | 2025 | 2025 | 1年 | [arXiv](https://arxiv.org/abs/2511.12761) |
| [q-rook与嵌套盒单峰性](https://github.com/Aurantium-47/rook-polynomial-unimodality) | 2024 | 2026 | 0年 | [Experimental Mathematics / arXiv固定版](https://arxiv.org/abs/2410.19714) |
| [Catalan幂Hankel精确次数](https://github.com/Aurantium-47/even-catalan-hankel-degrees) | 2023 | 2023 | 3年 | [arXiv](https://arxiv.org/abs/2308.07642) |
| [数值半群端点残差](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | 2026 | 2026 | 0年 | [Journal of Pure and Applied Algebra](https://doi.org/10.1016/j.jpaa.2026.108330) |
| [Peak多项式最后实根](https://github.com/Aurantium-47/peak-polynomial-last-real-root) | 2014 | 2016 | 10年 | [Experimental Mathematics](https://doi.org/10.1080/10586458.2015.1051193) |
| [Karp二阶变换实根性](https://github.com/Aurantium-47/karp-order-two-real-rootedness) | 2012 | 2012 | 14年 | [arXiv；后续问题集重述](https://arxiv.org/abs/1203.1482) |
| [Gap-five Gaussian商正性](https://github.com/Aurantium-47/gap-five-gaussian-quotients) | 2025 | 2025 | 1年 | [The Ramanujan Journal](https://doi.org/10.1007/s11139-025-01285-2) |
| [Hurwitz多项式与大亏格展开](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | 2023 | 2023 | 3年 | [Canadian Journal of Mathematics](https://doi.org/10.4153/S0008414X25101168) |
| [最终无限对数凹性](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | 2014 | 2014 | 12年 | [Annals of Combinatorics](https://arxiv.org/abs/1405.1765) |
| [Stanton十一项W正性](https://github.com/Aurantium-47/stanton-eleven-entry-w-positivity) | 未定年 | 未定年 | — | [未标日期的作者手稿](https://www-users.cse.umn.edu/~stant001/PAPERS/macmahon.pdf) |
| [单位平移后的无界振荡](https://github.com/Aurantium-47/unit-translation-coefficient-oscillation) | 2000 | 2000 | 26年 | [SIMU技术报告（年份经后文书目佐证）](https://sites.math.rutgers.edu/~bte14/Articles/Gnk/Gnk.pdf) |
| [Hoggatt行和矩分类](https://github.com/Aurantium-47/hoggatt-row-sum-moments) | 2026 | 2026 | 0年 | [arXiv](https://arxiv.org/abs/2607.01582) |
| [Narayana格点和](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | 2021 | 2023 | 3年 | [Fertilitopes / arXiv固定版](https://arxiv.org/abs/2102.11836) |
| [Peak与X-descent增长率谱](https://github.com/Aurantium-47/peak-and-x-descent-growth-rates) | 2024 | 2025 | 1年 | [European Journal of Combinatorics](https://doi.org/10.1016/j.ejc.2025.104246) |
| [固定长度fertility反例](https://github.com/Aurantium-47/fixed-length-fertility-counterexample) | 2024 | 2024 | 2年 | [arXiv](https://arxiv.org/abs/2408.05378) |
| [Clique-join支配多项式](https://github.com/Aurantium-47/clique-join-domination-polynomials) | 2025 | 2025 | 1年 | [Journal of Combinatorial Mathematics and Combinatorial Computing](https://doi.org/10.61091/jcmcc126-19) |

## 原题与后续论文的刊物记录

| 刊物 | 对应研究 | 中科院分区 | JCR等记录 | 来源 |
| --- | --- | --- | --- | --- |
| Applied Mathematics and Computation | 化学图原题 | 2025大类数学2区；应用数学2区 | Q1；公开索引，应用数学 | [分区记录](https://sci.justscience.cn/details.html?id=3903&sci=1) |
| AIMS Mathematics | 循环图原题 | 2025大类数学3区 | Q1；2024–25公开索引 | [分区记录](https://www.klxksci.com/sci/15468.html) |
| Experimental Mathematics | Peak原题；q-rook论文 | 2025大类数学3区（公开索引） | JCR-JIF 2025 Q3；SJR 2025 Q1 | [分区记录](https://www.iit.comillas.edu/publicacion/info_revista/en/980/Experimental_Mathematics) |
| Journal of Pure and Applied Algebra | 数值半群原题 | 2025大类数学3区 | 分类／年份映射待确认 | [分区记录](https://www.iikx.com/sci/mathematics/14724.html) |
| Electronic Journal of Combinatorics | Hardinian原题、Catalan相关研究 | 2025大类数学3区；小类数学／应用数学4区 | 公开索引Q2／Q3；分类映射待确认 | [分区记录](https://sci.justscience.cn/details.html?id=7296&sci=1) |
| The Ramanujan Journal | gap-five原题；Hankel工具论文 | 2025大类数学3区 | 页面标2026 Q2；数学SCIE | [分区记录](https://www.iikx.com/sci/mathematics/16674.html) |
| Journal of Combinatorial Theory, Series A | Peak后续正性论文 | 2025大类数学3区 | 本次未确认JCR版次 | [分区记录](https://www.xueshu.com/sci/44907/) |

这些分区记录采用各来源标注的版次。Experimental Mathematics在大学记录中同时列出2025 JCR-JIF Q3与SJR Q1，两个体系分别保留。部分刊物的分类或年份尚未核清，表中不填猜测值。

## 数学内容与推广

| 研究领域 | 具体数学内容 | 代表项目 |
| --- | --- | --- |
| 代数组合 · Algebraic combinatorics | Dyck路径、Stieltjes–Rogers多项式、Toeplitz/Hankel行列式、连分数 | Lecture Hall、Catalan、Hoggatt |
| 交换代数与离散几何 | SAGBI基、Hilbert基、半群代数、Ehrhart结构、toric退化 | Lecture Hall、数值半群、q-rook |
| 极值图论与组合优化 | 独立集、循环图、装填着色、度数极值、有限状态秩证书 | Howroyd、化学图、K6链 |
| 实根多项式与正性 | 根交错、Pólya频率序列、系数单峰性、无限对数凹性 | Peak、Hurwitz、q-rook、对数凹性 |
| 枚举几何与渐近分析 | 单调Hurwitz数、换位分解、大亏格展开、根渐近修正 | Hurwitz、Hardinian |
| 代数组合动力系统 | 偏序集、序理想、rowmotion、homomesy | Fence |

| 成果组 | 原问题之外的延伸 |
| --- | --- |
| [Lecture Hall多项式与退化](https://github.com/Aurantium-47/lecture-hall-polynomiality) | 多项式性 → 显式系数/单项式计数 → SAGBI基与toric退化 |
| [K6链装填着色](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | 有限反例 → 全族锐23色上界及长链精确值 |
| [q-rook与嵌套盒单峰性](https://github.com/Aurantium-47/rook-polynomial-unimodality) | near-full q-rook → 任意维嵌套盒乘积差单峰 → Hilbert函数推论 |
| [数值半群端点残差](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | 最终仿射 → 端点斜率公式 → 正负伸缩与有效界 |
| [Hurwitz多项式与大亏格展开](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | g2 → g3/g4 → 一般profile二项展开、根修正与有效界 |
| [最终无限对数凹性](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | 三项式尾部 → 一般严格正多项式幂 → 增长深度曲率 |
| [Narayana格点和](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | 两个否定实例 → 任意有限格点多重集的锐excess界 |

Hurwitz项目尤其连接了枚举几何和实根多项式：已有Coulter–Do–Moskovsky的定义与递推，以及Accadia–Lewanski–Ruzza的大亏格框架；本系列给出g=2、3、4单循环情形的全次数结果，并进一步整理有效二项展开、根修正与定量界。原有框架及直接推论继续归属前人。

## Karp二阶实根猜想：另一条证明

2026年10月17日核到Henry Zweiman的[A proof of Karp’s conjecture](https://arxiv.org/abs/2610.18895)，arXiv记录提交日期为10月10日。其Theorem 1.3给出了正系数实根输入的负实根结论，并证明残余根定位及严格大于1的间距。与本项目主要结论有实质重合。本项目通过Gauss–Lucas卷积、Bernstein多项式与Beta矩给出另一条证明，作为肯定结论计入成果；参数化引理的新增推广仍单独对照。详见[时间线与证明比较](KARP_COMPARISON.md)。

统计与引用口径见[阅读说明](METHODS.md)。

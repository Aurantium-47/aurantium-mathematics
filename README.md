<div align="center">

# Aurantium · Mathematics

**组合数学、图论与多项式中的证明、反例和推广**

[中文](README.md) · [English](README.en.md) · [Lean源码](formalizations/README.md) · [研究背景](REPORT.zh.md) · [文献目录](SOURCES.md)

</div>

---

我在AI辅助下，围绕已有论文和公开问题开展研究，按核心问题整理成**24组研究成果（result families）**。同一问题的主结果、配套证明与后续推广归在一组，并提供论文、精确证书和形式化源码。

| 研究成果组 | 给出原题结论 | 含Lean形式化成果 | 原题之外继续推广 |
| :---: | :---: | :---: | :---: |
| **24组** | **13项** | **8组** | **7组** |

其中，**10项给出原题的肯定结论，3项以反例回答原题，7项取得进一步进展**；另有3项构造或分类、1项同题研究。7组推广和8组形式化分布在这些成果中。

## 前人完成了什么，我补上了什么

| 项目与来源 | 已有研究做到哪里 | 本项目增加了什么 |
| --- | --- | --- |
| [Howroyd · 2018](https://oeis.org/A297557)；后续发表于LAGOS 2021 | 已证明三类余数情形中的一类 | **补齐另外两类**，给出27集分支的完整分类与Lean证明 |
| [Lecture Hall · 2018](https://arxiv.org/abs/1809.01377)；大阪格点多面体研讨会 | 原文计算验证到长度12，提出普遍猜想 | **证明任意长度成立**；再得到系数公式、代数基与退化等推广 |
| [化学图极值](https://doi.org/10.1016/j.amc.2024.129199)；Applied Mathematics and Computation | 后续论文报告了一个模4余类 | **覆盖全部4个余类、所有n≥7**，同时证明可实现性；有Lean |
| [Peak多项式](https://arxiv.org/abs/1410.8506)；Experimental Mathematics，2016 | 后续工作覆盖部分区间与系数性质 | **补齐剩余区间的符号论证**，完成指定的最后实根结论 |
| [Fence行运动](https://arxiv.org/abs/2108.12443)；Algebraic Combinatorics | 原题猜测轨道平均值恒定 | 用**237步完整轨道**给出反例，并完成Lean内核核验 |
| [K6链着色](https://arxiv.org/abs/2511.12761)；2025年预印本 | 原文猜测统一22色足够 | 找到**450顶点反例**，并证明**23是正确统一锐界** |

**原题出处与研究积累：** 目录包含60条问题来源及相关文献。原题载体涵盖Applied Mathematics and Computation、Experimental Mathematics、Journal of Graph Theory、Algebraic Combinatorics、Canadian Journal of Mathematics等专业期刊，以及OEIS和研究预印本。具体命题、前人结果与引用见[研究背景](REPORT.zh.md)和[文献目录](SOURCES.md)。

总库收录[8个项目的189个Lean源文件](formalizations/README.md)，保留原项目配置和固定版本。研究覆盖图论、组合数学、多项式、交换代数与渐近分析。

**验证与交付：** 按项目提供原题与已有文献对照、证明检查、精确计算或有限证书核验；8个项目进一步提供Lean形式化成果。论文、代码、依赖锁与相关验证记录可从各项目查看。

---

## 重点成果及其研究沿革

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

---

## 数学领域与方法

| 研究领域 | 具体数学内容 | 代表项目 |
| --- | --- | --- |
| 代数组合 · Algebraic combinatorics | Dyck路径、Stieltjes–Rogers多项式、Toeplitz/Hankel行列式、连分数 | Lecture Hall、Catalan、Hoggatt |
| 交换代数与离散几何 | SAGBI基、Hilbert基、半群代数、Ehrhart结构、toric退化 | Lecture Hall、数值半群、q-rook |
| 极值图论与组合优化 | 独立集、循环图、装填着色、度数极值、有限状态秩证书 | Howroyd、化学图、K6链 |
| 实根多项式与正性 | 根交错、Pólya频率序列、系数单峰性、无限对数凹性 | Peak、Hurwitz、q-rook、对数凹性 |
| 枚举几何与渐近分析 | 单调Hurwitz数、换位分解、大亏格展开、根渐近修正 | Hurwitz、Hardinian |
| 代数组合动力系统 | 偏序集、序理想、rowmotion、homomesy | Fence |

**计算与形式化工具：** Lean 4 / mathlib用于形式化证明；Python / SymPy用于精确符号计算；C++17用于大型证书检查；LaTeX用于论文与数学排版。各工具的实际覆盖以对应项目为准。

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

## 从单个问题到成果组

其中7组成果在回答原目标后，继续得到更一般的结论、完整分类或更强的定量结果。

| 成果组 | 原问题之外的延伸 |
| --- | --- |
| [Lecture Hall多项式与退化](https://github.com/Aurantium-47/lecture-hall-polynomiality) | 多项式性 → 显式系数/单项式计数 → SAGBI基与toric退化 |
| [K6链装填着色](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | 有限反例 → 全族锐23色上界及长链精确值 |
| [q-rook与嵌套盒单峰性](https://github.com/Aurantium-47/rook-polynomial-unimodality) | near-full q-rook → 任意维嵌套盒乘积差单峰 → Hilbert函数推论 |
| [数值半群端点残差](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | 最终仿射 → 端点斜率公式 → 正负伸缩与有效界 |
| [Hurwitz多项式与大亏格展开](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | g2 → g3/g4 → 一般profile二项展开、根修正与有效界 |
| [最终无限对数凹性](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | 三项式尾部 → 一般严格正多项式幂 → 增长深度曲率 |
| [Narayana格点和](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | 两个否定实例 → 任意有限格点多重集的锐excess界 |

**Karp同题研究：对方先行提交，本项目保留Beta矩证明路线。** Zweiman的arXiv提交记录比本项目Release早约三天。主结果重合；本稿另有Beta积分推导、一般正参数变换引理及对称权重推论，暂不计入上述7组扩展。[时间线与逐项比较](KARP_COMPARISON.md)

<details>
<summary><strong>展开全部24个项目</strong></summary>

| 项目 | 已形成的结果 | 验证与文献状态 |
| --- | --- | --- |
| [Howroyd 27集分类](https://github.com/Aurantium-47/howroyd-27-conjecture) | 证明剩余两个模3余类均恰有27个最大独立集，并给出分类 | Lean |
| [化学图极值度数分类](https://github.com/Aurantium-47/chemical-graph-sigma-extremizers) | 对所有n≥7完成Conjecture 10的极值度数重数分类与可实现性 | Lean |
| [Stern多项式正性](https://github.com/Aurantium-47/stern-polynomial-positivity) | 全参数正性；另以B183否定单调性条款 | Lean |
| [Hardinian数组渐近](https://github.com/Aurantium-47/hardinian-array-asymptotics) | r=2、3渐近式；r=2及高阶核展开已形式化，全r衔接暂存 | Lean子结果 |
| [无三角形循环图存在性](https://github.com/Aurantium-47/triangle-free-circulant-existence) | 覆盖每个k≥1及6k+2≤n≤8k的全部偶数n，给出明确构造 | Lean |
| [五点集合装填密度](https://github.com/Aurantium-47/nonmixed-five-point-packing) | k=m=2、任意互素正参数及非周期中心集的精确密度 | Lean；后续云日志验收悬项 |
| [Lecture Hall多项式与退化](https://github.com/Aurantium-47/lecture-hall-polynomiality) | 全下标多项式性、signed Dyck识别；SAGBI基与平坦退化扩展 | Lean核心 |
| [Fence行运动反例](https://github.com/Aurantium-47/fence-rowmotion-counterexample) | 32元素fence上237态完整轨道，均值1258/79，否定5.4(b) | Lean |
| [K6链装填着色](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | H75否定22色上界；所有链统一23色，t≥75达到23 | 精确证书 |
| [q-rook与嵌套盒单峰性](https://github.com/Aurantium-47/rook-polynomial-unimodality) | 所有非空Ferrers板near-full q-rook多项式单峰 | 证明与精确核查 |
| [Catalan幂Hankel精确次数](https://github.com/Aurantium-47/even-catalan-hankel-degrees) | 所有j≥1、k≥2j−1的两个指定余类，精确次数(2j−1)(k−j) | 证明与精确核查 |
| [数值半群端点残差](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | 平移族最终仿射；显式斜率、修正项与有效阈值 | 证明与精确核查 |
| [Peak多项式最后实根](https://github.com/Aurantium-47/peak-polynomial-last-real-root) | 对任意可容许峰集，完成倒数第二峰之后整个实区间的符号与最后实根结论 | 证明与精确核查 |
| [Karp二阶变换实根性](https://github.com/Aurantium-47/karp-order-two-real-rootedness) | 正、满支撑的二阶Pochhammer变换负实根性及残余根间距 | 已有相关公开证明；贡献对照中 |
| [Gap-five Gaussian商正性](https://github.com/Aurantium-47/gap-five-gaussian-quotients) | gap=5、k≥8、n≥2k：多项式性蕴含系数非负；与已知边界合并覆盖k≥5 | 证明与符号证书 |
| [Hurwitz多项式与大亏格展开](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | g=2、3、4单周期全次数实根/交错；一般profile有效大亏格精细项 | 证明与精确核查 |
| [最终无限对数凹性](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | 固定严格正满支撑多项式的充分大整数幂无限对数凹；三项式与增长深度细化 | 证明与精确证书 |
| [Stanton十一项W正性](https://github.com/Aurantium-47/stanton-eleven-entry-w-positivity) | 对所有可容许对称11项向量证明W正性，A无上界 | 证明与精确证书 |
| [单位平移后的无界振荡](https://github.com/Aurantium-47/unit-translation-coefficient-oscillation) | 显式递归构造：正非增整数系数经x→x+1后可出现任意多次相邻差符号变化 | 构造证明 |
| [Hoggatt行和矩分类](https://github.com/Aurantium-47/hoggatt-row-sum-moments) | 数值行和的Stieltjes矩分类、显式测度及行列式证书；保留Baxter既有结论归属 | 证明与精确证书 |
| [Narayana格点和](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | 两个多面体反例及普遍excess≤3实根性充分条件 | 证明与精确证书 |
| [Peak与X-descent增长率谱](https://github.com/Aurantium-47/peak-and-x-descent-growth-rates) | 构造实现峰集增长率整个区间及可同时选择X/I时的[0,1]谱 | 构造证明 |
| [固定长度fertility反例](https://github.com/Aurantium-47/fixed-length-fertility-counterexample) | 长度9完整枚举362880个排列，fertility谱缺55，否定固定长度包含猜想 | 穷举证书与证明 |
| [Clique-join支配多项式](https://github.com/Aurantium-47/clique-join-domination-polynomials) | 两blade全参数超对数凹；三blade有限及无限族反例 | 证明与精确核查 |

</details>

## 合作与后续

Hardinian的实际核多项式及相关代数验证已完成，一般化结果正在合作推进，完成后补充。

本系列由我负责选题、研究组织、结果判断与交付，AI辅助推导、实现和核验。合作成果按实际贡献署名；原论文与工具的归属分别保留在各项目中。

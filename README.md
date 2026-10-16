# Aurantium · Mathematics

**证明、反例与推广。**

[中文](README.md) · [English](README.en.md) · [成果分析](REPORT.zh.md) · [统计方法](METHODS.md) · [文献目录](SOURCES.md)

![Aurantium Mathematics](assets/banner.png)

这里汇集我围绕组合数学、图论、多项式和渐近分析组织的研究工作。每个项目提供自己的命题、证明与复核材料；本页作为统一入口，连接24个研究仓库。

| 公开项目 | 含Lean成果 | 扩展成果组 | 含反例／否定证书 |
| --- | --- | --- | --- |
| **24** | **8** | **8** | **7** |

## 精选成果

- **Howroyd 27集分类：** 补齐剩余参数分支，给出全参数分类和Lean证明。
- **化学图极值：** 对所有n≥7完成极值度数重数分类与可实现性。
- **Lecture Hall：** 全下标多项式性与signed Dyck识别，并延伸到SAGBI基和退化。
- **K6链packing coloring：** 23色锐界与排除22色的精确状态证书。
- **Fence rowmotion：** 237步轨道给出反例，并经Lean核验。

## 项目目录

| 项目 | 已形成的结果 | 核验形式 |
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
| [Karp二阶变换实根性](https://github.com/Aurantium-47/karp-order-two-real-rootedness) | 正、满支撑的二阶Pochhammer变换负实根性及残余根间距 | 证明与精确核查 |
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

## 从问题到成果组

| 成果组 | 从原问题延伸出的内容 |
| --- | --- |
| [Lecture Hall多项式与退化](https://github.com/Aurantium-47/lecture-hall-polynomiality) | 多项式性 → 显式系数/单项式计数 → SAGBI基与toric退化 |
| [K6链装填着色](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | 有限反例 → 全族锐23色上界及长链精确值 |
| [q-rook与嵌套盒单峰性](https://github.com/Aurantium-47/rook-polynomial-unimodality) | near-full q-rook → 任意维嵌套盒乘积差单峰 → Hilbert函数推论 |
| [数值半群端点残差](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | 最终仿射 → 端点斜率公式 → 正负伸缩与有效界 |
| [Karp二阶变换实根性](https://github.com/Aurantium-47/karp-order-two-real-rootedness) | 二阶负实根 → 残余因子根定位/间距 → 对称权重充分条件 |
| [Hurwitz多项式与大亏格展开](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | g2 → g3/g4 → 一般profile二项展开、根修正与有效界 |
| [最终无限对数凹性](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | 三项式尾部 → 一般严格正多项式幂 → 增长深度曲率 |
| [Narayana格点和](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | 两个否定实例 → 任意有限格点多重集的锐excess界 |

## 研究记录

截至2026年10月16日，本批次本地记录覆盖约4.60天日历跨度、162.93并行任务小时。保存的29次网页解答样本平均34.91分钟；Lean开发在8个相关项目上平均分摊8.07任务小时。不同环节的时间有重叠，详细口径见[成果分析](REPORT.zh.md)。

22项可定年的来源跨0–14年，平均年差4.50；当前文献表有59条记录。来源年代、原题年份和结论覆盖范围分别保存，便于读者追溯。

## 合作与后续

Hardinian的实际核多项式及相关代数验证已完成。一般化结果正在合作推进，将在完成后补充。本目录按已有成果更新。

选题、研究组织、结果判断和交付由我负责，AI参与推导、实现与核验。合作作者按实际贡献署名；各研究仓库保留原有引用、许可和版本。统一目录不改变所链接材料的权利归属。

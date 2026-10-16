# 从猜想到证明：24个数学研究项目

**24个公开项目 · 8个含Lean成果 · 8组扩展成果 · 7个含反例或否定证书的项目**

这批工作围绕组合数学、图论、多项式与渐近分析展开：有对原问题的肯定结论，也有推翻断言的反例，还有把局部现象推进为参数族、分类或一般构造的成果。最值得展示的是“结论、证明和复核材料一起交付”。

## 先看五个代表

| 项目 | 可直接介绍的贡献 | 为什么适合展示 |
| --- | --- | --- |
| Howroyd 27集分类 | 补齐剩余模3余类，给出27个最大独立集的分类与Lean证明 | 问题来自2018年的明确提问，结果简洁可讲 |
| 化学图极值 | 对所有n≥7完成Conjecture 10的度数重数分类与可实现性 | 全参数结论，原题发表于Applied Mathematics and Computation |
| Lecture Hall | 全下标多项式性与signed Dyck识别，并发展出SAGBI基、退化等结果 | 从回答问题走向一组代数结构成果 |
| K6链packing coloring | 450顶点的H75排除22色，23色达到上界；有1664万余状态的精确证书 | 证明与大型可复核证书结合，技术工作量直观 |
| Fence rowmotion | 32顶点实例产生237步轨道，均值1258/79否定原断言 | 一个明确反例改变命题真假，且完成Lean核验 |

适合另列为“持续推进”的是Hurwitz单循环g=2、3、4族，以及正系数多项式大幂的最终无限对数凹性。Hardinian已完成r=2形式化及高阶核展开；更一般的合作证明等待合作研究接口，保持悬置。

## 平均一个项目用了多久

| 环节 | 当前可测总量 | 可报告的平均数 | 含义 |
| --- | --- | --- | --- |
| 本地调研角色 | 4.84任务小时 | 12.09分钟／公开项目 | 分摊筛选成本；网页内部调研另含在下行 |
| 网页调研＋解答 | 29个保存样本，16.87小时 | **34.91分钟／次解答**；中位32.03 | 无法把同一次生成拆成调研和解答 |
| 本地解答角色 | 3.61任务小时 | 9.01分钟／公开项目 | 只覆盖本地补充，不能取代网页时长 |
| 本地核验角色 | 27.98任务小时 | **69.95分钟／公开项目** | 按角色归类的核验任务，可并行 |
| 网页复审 | 2个有计时样本 | 20.77分钟／次 | 只描述这2个样本 |
| Lean开发 | 64.59任务小时 | **8.07小时／含Lean项目** | 按8个项目分摊，复杂度差异很大 |
| 云端运行 | 179次，5.31 runner小时 | **39.83分钟／含Lean项目** | 含环境准备和审计；与开发时间重叠 |

此外统筹48.95小时、发布准备2.61小时、未明确分类10.37小时，保留为单独项。累计162.93任务小时，相当于每个公开项目分摊6.79任务小时；并行区间合并后为60.49小时，整段日历跨度约4.60天。不能把“35分钟初答”说成完整研究、形式化和文献核查全程。

## Token与Pro周限

| 口径 | 全批次本地记录 | 按24个公开项目分摊 |
| --- | --- | --- |
| 含缓存的总处理量 | 39.8847亿 | 1.6619亿 |
| 缓存输入 | 38.9431亿 | 1.6226亿 |
| 非缓存输入 | 7946.14万 | 331.09万 |
| 输出 | 1470.00万 | 61.25万 |
| 非缓存输入＋输出 | 9416.14万 | **392.34万** |

输入中约98%来自缓存复用。对外讲“单项目摊销约392万非缓存输入与输出token”比单独抛出1.66亿更容易正确理解；仍须注明这是本地记录的批次摊销，网页隐藏用量未计。

Pro $100、$200周限的等价比例目前都**无法可靠换算**。官方没有固定token周配额，账户快照又混有其他任务；用API价格或月费比例反推会产生假精度。[官方说明](https://learn.chatgpt.com/docs/pricing)

## 原题有多少年历史

22项可较清楚定年的来源，按2026减来源首年：**最少0年，最多14年，平均4.50年，中位3年**。按实际采用版本计，平均4.00年。0年表示今年提出或发表。

2000年技术报告另列26年，纳入后23项均值5.43年；其年份经后文书目佐证。Stanton手稿暂不定年。来源年代的概括是“题目来源跨越多个年代”，不把这些年差写成持续未解年数。

| 项目 | 来源首年／采用版年 | 来源年差／采用版年差 | 原题出处 |
| --- | --- | --- | --- |
| [Howroyd 27集分类](https://github.com/Aurantium-47/howroyd-27-conjecture) | 2018 / 2018 | 8 / 8 | [OEIS A297557](https://oeis.org/A297557) |
| [化学图极值度数分类](https://github.com/Aurantium-47/chemical-graph-sigma-extremizers) | 2024 / 2024 | 2 / 2 | [Applied Mathematics and Computation](https://arxiv.org/abs/2411.01530) |
| [Stern多项式正性](https://github.com/Aurantium-47/stern-polynomial-positivity) | 2019 / 2019 | 7 / 7 | [Publicationes Mathematicae Debrecen / arXiv固定版](https://arxiv.org/abs/1909.10844) |
| [Hardinian数组渐近](https://github.com/Aurantium-47/hardinian-array-asymptotics) | 2023 / 2024 | 3 / 2 | [Electronic Journal of Combinatorics](https://doi.org/10.37236/12358) |
| [无三角形循环图存在性](https://github.com/Aurantium-47/triangle-free-circulant-existence) | 2020 / 2020 | 6 / 6 | [AIMS Mathematics](https://doi.org/10.3934/math.2020242) |
| [五点集合装填密度](https://github.com/Aurantium-47/nonmixed-five-point-packing) | 2024 / 2025 | 2 / 1 | [Journal of Graph Theory](https://doi.org/10.1002/jgt.23269) |
| [Lecture Hall多项式与退化](https://github.com/Aurantium-47/lecture-hall-polynomiality) | 2018 / 2018 | 8 / 8 | [2018 Osaka Lattice Polytopes Workshop / arXiv](https://arxiv.org/abs/1809.01377) |
| [Fence行运动反例](https://github.com/Aurantium-47/fence-rowmotion-counterexample) | 2021 / 2023 | 5 / 3 | [Algebraic Combinatorics](https://doi.org/10.5802/alco.256) |
| [K6链装填着色](https://github.com/Aurantium-47/k6-clique-chain-packing-coloring) | 2025 / 2025 | 1 / 1 | [arXiv](https://arxiv.org/abs/2511.12761) |
| [q-rook与嵌套盒单峰性](https://github.com/Aurantium-47/rook-polynomial-unimodality) | 2024 / 2026 | 2 / 0 | [Experimental Mathematics / arXiv固定版](https://arxiv.org/abs/2410.19714) |
| [Catalan幂Hankel精确次数](https://github.com/Aurantium-47/even-catalan-hankel-degrees) | 2023 / 2023 | 3 / 3 | [arXiv](https://arxiv.org/abs/2308.07642) |
| [数值半群端点残差](https://github.com/Aurantium-47/numerical-semigroup-endpoint-residues) | 2026 / 2026 | 0 / 0 | [Journal of Pure and Applied Algebra](https://doi.org/10.1016/j.jpaa.2026.108330) |
| [Peak多项式最后实根](https://github.com/Aurantium-47/peak-polynomial-last-real-root) | 2014 / 2016 | 12 / 10 | [Experimental Mathematics](https://doi.org/10.1080/10586458.2015.1051193) |
| [Karp二阶变换实根性](https://github.com/Aurantium-47/karp-order-two-real-rootedness) | 2012 / 2012 | 14 / 14 | [arXiv；后续问题集重述](https://arxiv.org/abs/1203.1482) |
| [Gap-five Gaussian商正性](https://github.com/Aurantium-47/gap-five-gaussian-quotients) | 2025 / 2025 | 1 / 1 | [The Ramanujan Journal](https://doi.org/10.1007/s11139-025-01285-2) |
| [Hurwitz多项式与大亏格展开](https://github.com/Aurantium-47/hurwitz-single-cycle-genera-two-three) | 2023 / 2023 | 3 / 3 | [Canadian Journal of Mathematics](https://doi.org/10.4153/S0008414X25101168) |
| [最终无限对数凹性](https://github.com/Aurantium-47/eventual-infinite-log-concavity) | 2014 / 2014 | 12 / 12 | [Annals of Combinatorics](https://arxiv.org/abs/1405.1765) |
| [Stanton十一项W正性](https://github.com/Aurantium-47/stanton-eleven-entry-w-positivity) | 未定年 / 未定年 | — / — | [未标日期的作者手稿](https://www-users.cse.umn.edu/~stant001/PAPERS/macmahon.pdf) |
| [单位平移后的无界振荡](https://github.com/Aurantium-47/unit-translation-coefficient-oscillation) | 2000 / 2000 | 26 / 26 | [SIMU技术报告（年份经后文书目佐证）](https://sites.math.rutgers.edu/~bte14/Articles/Gnk/Gnk.pdf) |
| [Hoggatt行和矩分类](https://github.com/Aurantium-47/hoggatt-row-sum-moments) | 2026 / 2026 | 0 / 0 | [arXiv](https://arxiv.org/abs/2607.01582) |
| [Narayana格点和](https://github.com/Aurantium-47/narayana-polytope-counterexamples) | 2021 / 2023 | 5 / 3 | [Fertilitopes / arXiv固定版](https://arxiv.org/abs/2102.11836) |
| [Peak与X-descent增长率谱](https://github.com/Aurantium-47/peak-and-x-descent-growth-rates) | 2024 / 2025 | 2 / 1 | [European Journal of Combinatorics](https://doi.org/10.1016/j.ejc.2025.104246) |
| [固定长度fertility反例](https://github.com/Aurantium-47/fixed-length-fertility-counterexample) | 2024 / 2024 | 2 / 2 | [arXiv](https://arxiv.org/abs/2408.05378) |
| [Clique-join支配多项式](https://github.com/Aurantium-47/clique-join-domination-polynomials) | 2025 / 2025 | 1 / 1 | [Journal of Combinatorial Mathematics and Combinatorial Computing](https://doi.org/10.61091/jcmcc126-19) |

## 文献与前人的积累

当前书目包含**24条问题来源＋35条相关研究及工具背景，共59条记录**；排除OEIS后是58份研究文献，覆盖百余个作者署名（101个去重姓名字符串）。这是已经整理到的文献网络，作者和文章的全球总数没有穷尽。

直接承接的前人成果包括：Machacek的Howroyd可被3整除分支；Peak多项式的既有正性研究；Catalan行列式的小参数及邻近偏移公式；Hurwitz的大genus主阶框架。Flajolet、Sokal、Selberg积分综述等属于工具或背景，不能算作此前对同一猜想的失败尝试。

## 文章和会议的层次

原题出处横跨专业期刊、预印本、会议材料和OEIS。SCI分区可以介绍来源环境，但数学成果的价值还要看命题范围、方法和可推广性。

| 期刊 | 与本项目的关系 | 中科院分区 | JCR与其他分区 | 出处 |
| --- | --- | --- | --- | --- |
| Applied Mathematics and Computation | 化学图原题 | 2025大类数学2区；应用数学2区 | Q1；公开索引，应用数学 | [公开记录](https://sci.justscience.cn/details.html?id=3903&sci=1) |
| AIMS Mathematics | 循环图原题 | 2025大类数学3区 | Q1；2024–25公开索引 | [公开记录](https://www.klxksci.com/sci/15468.html) |
| Experimental Mathematics | Peak原题；q-rook论文 | 2025大类数学3区（公开索引） | JCR-JIF 2025 Q3；SJR 2025 Q1 | [公开记录](https://www.iit.comillas.edu/publicacion/info_revista/en/980/Experimental_Mathematics) |
| Journal of Pure and Applied Algebra | 数值半群原题 | 2025大类数学3区 | 分类／年份映射待确认 | [公开记录](https://www.iikx.com/sci/mathematics/14724.html) |
| Electronic Journal of Combinatorics | Hardinian原题、Catalan相关研究 | 2025大类数学3区；小类数学／应用数学4区 | 公开索引Q2／Q3；分类映射待确认 | [公开记录](https://sci.justscience.cn/details.html?id=7296&sci=1) |
| The Ramanujan Journal | gap-five原题；Hankel工具论文 | 2025大类数学3区 | 页面标2026 Q2；数学SCIE | [公开记录](https://www.iikx.com/sci/mathematics/16674.html) |
| Journal of Combinatorial Theory, Series A | Peak后续正性论文 | 2025大类数学3区 | 本次未确认JCR版次 | [公开记录](https://www.xueshu.com/sci/44907/) |

Experimental Mathematics的中科院2025大类3区另见[公开分区表](https://www.sfabiao.com/sci/10586458/)。该刊大学记录同时列出2025 JCR Q3和SJR Q1，正说明“Q几”必须说清体系。

其他原题期刊还包括Canadian Journal of Mathematics、Journal of Graph Theory、Algebraic Combinatorics、Annals of Combinatorics、European Journal of Combinatorics、Publicationes Mathematicae Debrecen和JCMCC。本轮未确认其同年度同学科的完整分区，逐项保留原刊名与DOI，不填猜测数字。arXiv、OEIS、作者手稿不赋予SCI分区。

后续研究中，Peak正性发表于JCTA；Hankel相关成果发表于Discrete Mathematics、Ramanujan Journal与EJC；Baxter矩性质发表于Journal of Mathematical Analysis and Applications；Hurwitz近期框架部分仍为arXiv。

Howroyd后续论文发表于**LAGOS 2021的Procedia Computer Science会议论文集**。Hardinian矩形数组工作是**ISSAC 2024海报摘要**，刊于ACM Communications in Computer Algebra；讲述时保留海报轨道，不写成ISSAC完整研究论文。Lecture Hall来源为Osaka格点多面体研讨会相关材料。这里不编造CCF等级。[Machacek原文信息](https://arxiv.org/abs/2010.11112) · [Hardinian后续条目](https://doi.org/10.1145/3717582.3717589)

## 8组扩展成果

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

此处一个项目最多计一组。更强结论若已作为本项目主问题回答，就不再重复增加“扩展组”数；反例、形式化和一篇文字稿也不拆成三个项目。

## 重要性和难度：用三个排序更有用

以下是基于当前证明结构的编辑判断，不是数学界公认的难度榜，也不把刊物分区当作难度分数。

**方法的连接与复用潜力：** Lecture Hall → 最终无限对数凹性 → Hurwitz参数族 → q-rook嵌套乘积差 → 数值半群端点结构。依据是能否从一个问题提炼出可迁移的结构或工具。Hardinian待总装完成后再纳入这条排序。

**本批次完成交付的技术复杂度：** Hardinian已完成模块 → K6链证书 → Lecture Hall → 五点装填／循环图构造。前者有较长的解析估计、系数结构和形式化依赖链；K6则偏重有限状态证书工程。它们测的是本项目交付复杂度，不能等同历史问题本身有多难。

**代表案例的阅读顺序：** Howroyd → Fence反例 → K6链 → 化学图 → Lecture Hall。分别对应“8年前的问题”“一个轨道推翻断言”“450顶点和千万状态”“所有规模”“从猜想到新结构”。第一次展示选3–5个，比罗列24个陌生名字更有记忆点。

## 还能继续分析的维度

- **一般性：** 单实例、无限族、全参数分别展示，避免用数量掩盖范围。
- **证据方式：** 文字证明、穷举证书、精确算术、Lean内核检查的覆盖比例。
- **扩展密度：** 8／24，约33%；衡量从原问题形成新成果组的比例。
- **否定性发现：** 7／24项目含反例或否定证书，展示发现错误断言的能力。
- **成本结构：** 核验与形式化开发合计92.57任务小时，约占本地任务时间57%；主要成本在把结论做扎实。
- **执行集中度：** Hardinian占已保存云运行次数约54%、时长约54%，说明平均值被复杂项目拉高。
- **待补数据：** 真正逐项目的端到端耗时、引用次数与作者身份消歧、当前优先权检索覆盖率。没有可靠数据前，不展示“效率提升多少倍”或“超过多少数学家”。

完整项目清单见[README](README.md)，计量方法见[统计方法](METHODS.md)，逐条出处见[文献目录](SOURCES.md)。

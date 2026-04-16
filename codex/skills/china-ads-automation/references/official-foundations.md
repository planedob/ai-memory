# Official Foundations

Use this file when the user asks to learn投放基础 instead of directly operating an account.

This file stays close to public official materials. Where a platform does not expose detailed public buying manuals, I mark the conclusion as an inference from official product positioning, open platform docs, or investor relations disclosures.

## 1. Universal basics

Across domestic paid channels, the minimum valid投放模型 is:
- business goal
- conversion event
- budget
- bidding logic
- creative supply
- data feedback

If one of these is missing, optimization gets noisy.

### Business goal

Use one primary goal per campaign cluster:
- 成交
- 留资
- 到店核销
- 激活
- 私域沉淀

Mixed goals usually weaken delivery.

### Conversion event

The platform will optimize toward the signal you give it.

Good signals:
- paid order
- valid lead
- verified arrival
- activated user

Weak signals:
- page view
- button click
- low-quality form submit

### Budget

Budget is not only a finance limit. It is also a learning constraint.

Too low:
- the system cannot gather enough data
- automation becomes unstable

Too high:
- the platform can overspend into weak traffic before you catch it

Default rule:
- use a test budget large enough to buy data
- increase in steps, not jumps

### Bidding

Public official materials across platforms consistently point to three broad layers:
- traffic pricing or payment basis: CPM / CPC / optimized display pricing
- manual or target-based bidding
- smart bidding or托管 delivery

The more downstream and verified the conversion signal, the more safely you can use smart bidding.

## 2. Budget-setting defaults

These are execution defaults, not platform promises.

### Cold start budget

For a new campaign or ad group:
- set a budget that can buy meaningful sample size within 1-3 days
- do not judge too early if spend is still tiny
- do not split too many campaigns before one path has enough data

### Scale budget

When the campaign is already stable:
- increase budget in small steps, often 10% to 20%
- keep a cooldown window
- do not change budget, bid, audience, and creative all at once

### Stop-loss budget

Always define:
- max daily budget
- max acceptable CPA or min acceptable ROAS
- minimum spend before judgment
- whether the action is auto-pause or notify only

## 3. 巨量引擎 / 抖音 / 今日头条

### What the official materials clearly show

Public help text defines:
- budget as the planned spend for a specified delivery period
- bid as the maximum price you are willing to pay in竞价广告 for one click, with actual cost often below the set bid

Official product pages also show that巨量 has:
- lead capture tools
- landing page builders
- conversion-oriented tools
- diagnostics
- experiment tools
- open APIs for automated marketing

Official help and case materials also show:
- the platform separates 投前准备 / 投中管理 / 投后分析
- there are tools for standard delivery and automated delivery
- experiments should have enough budget, reasonable bids, and sufficient overlapping time
- the platform supports multi-goal conversion such as leads, store promotion, account promotion, live-room引流, ecommerce, and more

### What this means operationally

巨量 is a content-distribution-first system with strong conversion tooling.

Safe beginner logic:
- start from one clear goal
- use enough budget for learning
- lean on native diagnostics and experiment tools
- keep creative production strong because the platform gives you many content-side tools

Budget logic:
- if the campaign cannot spend, first inspect creative competitiveness and traffic fit
- if it spends fast but quality is poor, inspect the conversion event and callback quality
- when scaling, widen only one major variable at a time

Strong inference from official materials:
- 巨量 is especially suitable for teams that can feed the system frequent new creatives and better downstream conversion feedback

## 4. 快手磁力引擎

### What the official materials clearly show

From快手官方 and investor disclosures:
- 快手 positions itself as a short-video and live content community with massive daily usage
- AI is deeply integrated into content creation, recommendation, and commercial tools
- smart marketing solutions such as `Universal Auto X`, `全站推广`, and `智能托管` have become a large share of merchant marketing spend
- AIGC creative consumption and AI-assisted merchant operation have grown materially

### What this means operationally

快手’s public official story is very clear: the platform wants merchants to use more automation, more托管, and more AI-generated creative.

Safe beginner logic:
- do not start from heavy manual micro-tuning
- first understand whether you are doing short-video conversion, live conversion, or shelf-style ecommerce promotion
- use the platform’s simpler smart products early if your account is small
- review creative-native fit and commercial signal quality before forcing bid changes

Budget logic:
- if using全站推广 or智能托管, budget caps and business-side guardrails matter more than manual出价 tweaks
- keep staged budget ramps because automation can find spend faster than a human can react

Inference from official materials:
- 快手 is structurally stronger when short video, live interaction, and ecommerce or lead conversion work together rather than in isolation

## 5. 小红书

### What the public official materials clearly show

Public official ad-buying manuals are much less open than巨量.

What the official open platform docs do clearly show:
- integration follows a sandbox -> test -> production workflow
- items and creative-linked product entities go through audit states such as 编辑中, 待审核, 已审核, 审核不通过
- inventory and商品状态 must stay accurate, and incorrect asset formatting can silently prevent front-end display

### What this means operationally

Even though the public ad manual is limited, the official open docs strongly imply that小红书 is stricter about asset quality, review state, and merchandise consistency than many advertisers assume.

Safe beginner logic:
- assume审核和素材规范 are part of delivery logic, not just compliance overhead
- budget should be conservative until note style, product page, and comment feedback are validated
- measure not only click and conversion, but also whether content feels native enough to survive in the feed

Budget logic:
- start smaller than on giant feed-buying platforms
- spend more time validating note angle and landing consistency before scaling

Inference from official materials:
- 小红书 is usually not a pure “buy traffic harder” channel; it behaves more like a content-and-commerce coordination system where native fit is central

## 6. 支付宝

### What the official materials clearly show

Public支付宝 merchant marketing materials emphasize:
- merchants can create marketing tasks
- ecosystem partners can promote them through multiple channels
- settlement can be based on effective coupon or rights claiming and redemption
- merchant value is framed as trackable, measurable growth and pay-for-performance style cooperation

### What this means operationally

支付宝 public materials point to a transaction or task-based ecosystem rather than a classic broad-feed ad system.

Safe beginner logic:
- think in terms of task distribution,权益发放,核销, and mini-program or merchant conversion
- keep budgets close to business outcome windows such as claim, arrival, or redemption
- care more about closed-loop verification than about surface traffic numbers

Budget logic:
- budget against redeemable supply and merchant capacity
- do not over-fund if the downstream核销 path is weak

Inference from official materials:
- 支付宝 paid growth is closer to “performance distribution inside a transaction ecosystem” than to open-feed traffic buying

## 7. 美团

### What the official materials clearly show

Public美团 merchant ad manuals are not very open, but美团技术团队 has publicly documented the platform’s ad logic:
- brand and store can both fund the same product promotion
- the platform models this as multi-party budget coordination
- ad allocation involves public/private domain coordination
- different billing points and multiple budget owners are core parts of the design

### What this means operationally

美团 is not only a media-buying system. It is tightly tied to store operations, product availability, and local intent.

Safe beginner logic:
- never read ad efficiency without store readiness
- budget by store capacity, business hours, and redeemable inventory
- optimize around order quality, verification, or store-level results rather than surface CTR alone

Budget logic:
- use geo and daypart discipline
- align spend with operational readiness
- if stores differ meaningfully, avoid pooling all budget blindly

Inference from official materials:
- 美团投放 is closer to local-demand allocation than to pure content-platform arbitrage

## 8. A safer default playbook

If the user is new and no account data exists yet, use this starter path:

1. Pick one platform and one conversion goal.
2. Launch one exploration structure, not a giant account tree.
3. Set a budget that can buy 1-3 days of meaningful data.
4. Prepare multiple creative angles before launch.
5. Define stop-loss and scale-up rules before spending.
6. Check whether the downstream system can verify real conversion quality.
7. Scale only after the feedback loop is trusted.

## Official sources

- 巨量引擎智能平台与工具总览: https://www.oceanengine.com/platform
- 巨量帮助「广告创建与投放」摘要: https://support.oceanengine.com/support/content/130495
- 巨量帮助「投放工具矩阵」: https://support.oceanengine.com/support/content/130546
- 巨量帮助「AB实验工具」: https://support.oceanengine.com/support/content/130503
- 巨量引擎关于自动化与多目标转化的官方介绍: https://www.oceanengine.com/news/production/416
- 快手官网「关于快手」: https://www.kuaishou.com/about/
- 快手 2024Q2 业绩披露: https://ir.kuaishou.com/zh-hans/news-releases/news-release-details/kuaishoukejifabu2024niandierjidujizhongqiweijingshenhecaiwuyeji/
- 快手 2024 全年业绩披露: https://ir.kuaishou.com/zh-hans/news-releases/news-release-details/kuaishou-technology-announces-fourth-quarter-and-full-year-2024
- 快手 2025Q1 / Q2 关于全站推广与智能托管披露: https://ir.kuaishou.com/zh-hans/news-releases/news-release-details/kuaishoukejifabu2025niandiyijiduweijingshenhecaiwuyeji and https://ir.kuaishou.com/zh-hans/news-releases/news-release-details-156/
- 小红书开放平台接入流程: https://school.xiaohongshu.com/en/open/quick-start/workflow.html
- 小红书商品/创意审核状态: https://school.xiaohongshu.com/en/open/product/product-status.html
- 小红书库存同步: https://school.xiaohongshu.com/en/open/inventory/sync.html
- 支付宝口碑客/营销推广: https://render.alipay.com/p/z/koubeike/index.html
- 美团技术团队「联合营销生态下的广告机制设计与实践」: https://tech.meituan.com/2025/08/08/advertising-mechanism-design-and-practice-in-meituan.html

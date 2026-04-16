# Templates

Use these templates as delivery defaults when the user asks for execution help instead of theory.

## Daily diagnosis memo

Use this structure for a same-day action note:

```md
# 投放日报

日期：
平台：
目标：
核心转化：

## 今日结论
- Stop:
- Scale:
- Watch:
- Fix:

## 关键数据
- 花费：
- 转化量：
- CPA / ROAS：
- CTR：
- CVR：
- 频次：

## 异常
- 追踪异常：
- 素材疲劳：
- 时段异常：
- 落地页异常：

## 明日动作
- 动作1：
- 动作2：
- 动作3：
```

## Weekly review

Use this when the user needs a tighter operating review:

```md
# 投放周复盘

周期：
平台：
业务目标：

## 本周结果
- 最有效的 campaign / ad group / 素材：
- 最低效的 campaign / ad group / 素材：
- 最大浪费来源：
- 最大增长机会：

## 归因与数据质量
- 回传是否稳定：
- 线索/订单质量是否变化：
- 是否存在重复归因或延迟：

## 创意分析
- 本周新增素材数：
- 跑赢控制组的角度：
- 需要停更的角度：
- 下周要补测的变量：

## 账户动作
- 保持：
- 放量：
- 降本：
- 重建：
```

## Stop-loss rule spec

```md
# 自动止损规则

对象层级：campaign / ad group / ad
触发指标：CPA / ROAS / spend with zero conversion
观察窗口：6h / 12h / 24h
最小样本：花费 >= X 或 点击 >= Y
执行动作：pause / notify only
冷却时间：X 小时
例外条件：新品探索 / 学习期 / 回传异常时只告警不暂停
```

## Scale-up rule spec

```md
# 自动放量规则

对象层级：campaign / ad group
触发条件：
- 花费达到预算上限的 80% 以上
- CPA <= 目标 CPA 或 ROAS >= 目标 ROAS
- 连续 N 个窗口稳定

执行动作：
- 预算 +10% / +15% / +20%

约束：
- 每日最多触发 1 次
- 连续 2 次放量失败则冻结
- 不跨越业务侧产能上限
```

## Creative testing matrix

Use this simple matrix for domestic feed channels:

```md
# 创意测试矩阵

目标平台：
目标人群：
转化动作：

| Hook | Audience Angle | Offer | Format | Landing Variant | Status |
| ---- | -------------- | ----- | ------ | --------------- | ------ |
| 痛点切入 | 新客 | 首单优惠 | 口播短视频 | A | planned |
| 效果展示 | 高意向 | 限时福利 | 图文/轮播 | A | planned |
| 场景代入 | 老客召回 | 套餐对比 | 达人风素材 | B | planned |
```

## Platform defaults

When the user has little structure, default to:
- 巨量 / 快手: creative throughput first, bid tuning second
- 小红书: native note fit and comment quality first
- 支付宝 / 美团: conversion quality and merchant/store readiness first

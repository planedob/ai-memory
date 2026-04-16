---
name: china-ads-automation
description: Use when the user wants to plan, review, automate, or operationalize paid acquisition on mainland China ad platforms such as 巨量引擎/头条抖音, 快手磁力引擎, 小红书聚光, 支付宝数字推广, and 美团本地推广. Covers campaign structure, creative testing, account hygiene, rule-based optimization, reporting, and building safe semi-automated workflows instead of risky blind full automation.
---

# China Ads Automation

Use this skill for domestic paid media execution where the real goal is not "会不会点后台", but to turn ad buying into a repeatable operating system.

This skill is optimized for:
- 巨量引擎 / 抖音 / 今日头条效果投放
- 快手磁力引擎
- 小红书聚光与种草协同
- 支付宝数字推广
- 美团餐饮/本地生活推广

Do not use this skill for:
- a pure brand-only media brief with no performance target
- overseas channels such as Meta or Google
- blind "all-in full automation" requests where no guardrails, conversion feedback, or manual approval path exist

## What this skill does

Use this skill to:
- design a scalable campaign/account structure
- define what can be automated and what must remain human-approved
- generate creative testing plans and ad copy batches
- turn platform-specific tactics into rules, checklists, and SOPs
- review existing投放账户 for waste, pacing, attribution, or creative fatigue
- prepare a local skill, script, or dashboard spec for continued execution

## Core operating principle

The strongest domestic投放 teams do not rely on one magic AI autopilot. Their winning setup usually combines:
- platform-native automation for bidding and exploration
- strict account structure and naming discipline
- fast creative iteration
- conversion callback / business signal quality
- rule-based guardrails for budget, CPA, ROAS, frequency, and pacing
- human review for high-cost or policy-sensitive actions

Default stance:
- automate repetitive judgment
- gate irreversible actions
- keep attribution and data definitions stable

## Workflow

### 1. Classify the business model first

Before touching campaigns, identify which commercial loop you are serving:
- 电商成交
- 表单获客
- 到店核销
- 团购/券包购买
- APP拉新或激活
- 私域导流

This choice determines:
- the conversion event
- the bidding strategy
- the acceptable lag window
- the creative angle
- the reporting cadence

If the user does not know, infer from the landing path and payment action.

### 2. Lock the conversion truth source

Never optimize from vague signals like "感觉线索质量不行". Pick one primary optimization signal:
- 支付成功
- 有效留资
- 到店核销
- 激活且次留
- 团购下单

Then map:
- source system
- callback path
- dedupe rule
- update delay
- revenue / quality fields

If the callback or归因 is weak, slow down automation and keep tighter manual review.

### 3. Choose the right automation layer

There are three safe automation layers:

1. Platform-native automation
- smart bidding
- audience expansion
- placement expansion
- automated creative assembly

2. Rule-based account operations
- pause when CPA breaches threshold
- raise budget when spend is capped and ROAS stays above target
- alert on pacing anomalies, frequency spikes, or conversion outages

3. Semi-automated creative and reporting workflows
- generate new hooks and titles
- refresh underperforming creatives
- produce daily diagnosis and action list

Do not jump to layer 2 or 3 if layer 1 inputs are still broken.

### 4. Build campaigns for exploration and control

Use a simple default split:
- exploration campaigns: broad signals, new creatives, learning budget
- scaling campaigns: proven assets, tighter guardrails, stable budget
- defense campaigns: brand terms, remarketing, retargeting, shop/store intent

Avoid over-fragmentation. If the account is small, fewer campaigns with cleaner data beat complex trees.

### 5. Run creative as a system

For domestic information-flow platforms, creative velocity often matters more than micro-tuning bids.

Default creative matrix:
- 3 hooks
- 3 audience angles
- 2 offer framings
- 2 visual structures

Track separately:
- thumb-stop / click attraction
- landing conversion
- comment quality / complaint signals
- downstream order or lead quality

Cut creatives for the real bottleneck they create, not just CTR.

### 6. Add guardrails before any auto-action

Any auto-action needs:
- exact trigger metric
- evaluation window
- minimum spend / sample size
- cooldown period
- upper and lower limit
- rollback path

Example guardrails:
- pause ad set only if spend > 2x target CPA and conversions = 0 within the last 24h
- increase budget by 15% only if spend hits 80% of cap and ROAS stays above target for 2 consecutive windows
- alert, do not auto-pause, when conversion volume drops suddenly but tracking health is uncertain

### 7. Report actions, not just metrics

Every review should end with:
- what to cut
- what to scale
- what to retest
- what tracking risk exists

Prefer an action memo over a raw table dump.

## Platform heuristics

Read [references/platforms.md](references/platforms.md) when you need:
- platform-specific operating differences
- what to automate first on each channel
- common failure modes by platform

Read [references/official-foundations.md](references/official-foundations.md) when you need:
- a source-backed introduction to paid media basics
- budget and bidding fundamentals
- how the major domestic platforms differ in delivery logic
- a safer default setup before touching any live account

## Winning patterns

Read [references/patterns.md](references/patterns.md) when you need:
- common traits from successful performance projects
- how strong teams move from manual buying to semi-automation
- diagnosis patterns for learning-limited, high-cost, or low-quality accounts

## Bundled resources

Use [references/templates.md](references/templates.md) when you need:
- a daily media diagnosis template
- a weekly review template
- rule specs for stop-loss and scale-up
- a creative testing matrix for domestic feeds

Use [scripts/media_diagnosis.py](scripts/media_diagnosis.py) when the user can provide exported ad data as CSV and wants:
- a quick action memo
- automatic outlier tagging
- simple stop / scale / watch recommendations

## Output requirements

When using this skill, prefer delivering one of these concrete outputs:
- campaign architecture
- automation rules spec
- creative testing matrix
- daily/weekly media diagnosis memo
- operator SOP for a specific platform
- local skill or script plan for the user's workflow

## Red lines

Do not automate these without explicit approval:
- payment, recharge, invoicing, or contract actions
- mass budget changes across many campaigns
- account permission changes
- policy-sensitive category launches
- deletion of campaigns, ads, audiences, or data sources

If the user asks for direct browser operation:
- keep high-risk changes in confirm-first mode
- prefer draft / paused state before launch
- log every action in plain language

## Validation checklist

Before finishing, verify:
- the business goal and conversion event match
- attribution assumptions are stated
- the proposed automation has thresholds and cooldowns
- budget actions have caps
- creative iteration is part of the plan
- platform-specific constraints have been acknowledged

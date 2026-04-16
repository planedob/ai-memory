---
name: liucheng-fuzhi
description: Use when the user wants to clone a viral interactive website, keep the core mechanic, change the UI, ship fast, wire in sharing, ads, private-traffic capture, analytics, and turn the whole execution into a repeatable growth workflow template.
---

# Liucheng Fuzhi

Use this skill for "热点站复刻 + 增长闭环 + 模板沉淀" tasks.

The goal is not just to reproduce a page. The goal is to turn one hot project into a reusable pipeline:
- clone the core interaction,
- redesign the UI,
- deploy fast,
- add sharing and capture,
- track the right metrics,
- save the workflow so the next hot topic ships faster.

## When to use

Use this skill when the user asks for any of these:
- 做一个和某个热点测试站、工具站、生成器站功能差不多的网站
- 改 UI，但保留原始玩法或结果逻辑
- 直接上线到 Cloudflare Pages / Workers / 静态托管
- 补广告位、私域入口、分享文案、海报下载、埋点
- 把这套执行流程整理成 SOP、模板或 skill

Do not use this skill for:
- a pure backend-heavy product
- a feature that has no viral/distribution loop
- a task that is only copywriting with no web implementation

## Core workflow

### 1. Lock the clone boundary

Before coding, identify four things:
- **Core mechanic**: quiz, generator, calculator, ranking, etc.
- **Must-match behavior**: scoring, state transitions, result logic, hidden branches
- **Can-change layer**: visual style, copy tone, layout, card structure, CTA placement
- **Deployment target**: usually static hosting first, serverless only if necessary

If the reference site is live, inspect it first and extract:
- page structure,
- question/data schema,
- result calculation method,
- share surfaces,
- monetization surfaces.

### 2. Build for fast deployment

Prefer a static-first structure unless the product truly needs a backend.

Good default:
- `index.html`
- `styles.css`
- `app.js`
- `data.js`
- optional static assets

Reasons:
- easiest to upload to Cloudflare Pages / direct static hosting,
- low ops overhead,
- fastest path from clone to上线,
- simplest to templatize for future reuse.

### 3. Change the visual language, not the mechanic

Keep the conversion-critical logic the same.

Usually safe to change:
- typography,
- color system,
- section order,
- card layout,
- CTA treatments,
- illustration/cover style,
- copy tone.

Usually unsafe to change too early:
- scoring rules,
- hidden trigger logic,
- number of required actions before result,
- result classification thresholds.

### 4. Add the growth loop before calling it done

A hot site is incomplete until it includes:
- **sharing**: copyable result text, native share when available, link copy
- **asset export**: lightweight poster or screenshot-friendly result module
- **private traffic capture**: CTA area for group,公众号,微信, landing page, or next test
- **ad inventory**: at least homepage and result-page slots
- **analytics hooks**: page view, start, complete, result view, share click, CTA click

If third-party accounts are missing, still implement the structure and leave config switches/placeholders.

### 5. Add the replication SOP into the site or repo

When appropriate, include a visible operations section containing:
- launch checklist,
- distribution channels,
- KPI checklist,
- what to replace tomorrow,
- what to copy for the next project.

This reduces context loss and makes the project self-documenting.

### 6. Close with deployment reality

Always verify what can be completed now versus what depends on the user:
- domain binding,
- Cloudflare auth,
- ad network approval,
- analytics account IDs,
- private-community links.

Implement everything that does not require the user's credentials.
For gated services, leave:
- clear config keys,
- placeholder UI,
- minimal next-day checklist.

## Output requirements

When using this skill, prefer delivering:
- a working website, not just a plan,
- deployment-ready structure,
- clear placeholders for missing services,
- one reusable workflow summary,
- one concise list of what the user must fill later.

## Validation checklist

Before finishing, verify:
- the site loads,
- the core mechanic works,
- result logic still computes,
- share actions do not throw syntax/runtime errors,
- config placeholders are obvious,
- the site can be redeployed without repo archaeology.

## Reference file

Read [references/workflow.md](references/workflow.md) when you need:
- the standard 5-step replication model,
- the minimal config checklist,
- KPI guidance,
- deploy and distribution heuristics,
- a reusable delivery template.

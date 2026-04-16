#!/usr/bin/env python3
"""
Create a simple action memo from exported ad data.

Expected CSV columns:
- name
- spend
- impressions
- clicks
- conversions
- revenue

Optional columns:
- ctr
- cvr
- cpa
- roas
- frequency
- platform

Usage:
  python3 media_diagnosis.py data.csv
  python3 media_diagnosis.py data.csv --target-cpa 80
  python3 media_diagnosis.py data.csv --target-roas 2.5
"""

from __future__ import annotations

import argparse
import csv
import math
import sys
from pathlib import Path


def as_float(value: str | None) -> float:
    if value is None:
        return 0.0
    text = str(value).strip().replace(",", "")
    if not text:
        return 0.0
    try:
        return float(text)
    except ValueError:
        return 0.0


def safe_div(a: float, b: float) -> float:
    return a / b if b else 0.0


def row_metrics(row: dict[str, str]) -> dict[str, float | str]:
    spend = as_float(row.get("spend"))
    impressions = as_float(row.get("impressions"))
    clicks = as_float(row.get("clicks"))
    conversions = as_float(row.get("conversions"))
    revenue = as_float(row.get("revenue"))
    ctr = as_float(row.get("ctr")) or safe_div(clicks, impressions)
    cvr = as_float(row.get("cvr")) or safe_div(conversions, clicks)
    cpa = as_float(row.get("cpa")) or safe_div(spend, conversions)
    roas = as_float(row.get("roas")) or safe_div(revenue, spend)
    frequency = as_float(row.get("frequency"))
    return {
        "name": row.get("name", "").strip() or "Unnamed",
        "platform": row.get("platform", "").strip(),
        "spend": spend,
        "impressions": impressions,
        "clicks": clicks,
        "conversions": conversions,
        "revenue": revenue,
        "ctr": ctr,
        "cvr": cvr,
        "cpa": cpa,
        "roas": roas,
        "frequency": frequency,
    }


def classify(
    item: dict[str, float | str],
    target_cpa: float | None,
    target_roas: float | None,
    min_spend: float,
) -> tuple[str, str]:
    spend = float(item["spend"])
    conversions = float(item["conversions"])
    cpa = float(item["cpa"])
    roas = float(item["roas"])
    ctr = float(item["ctr"])
    cvr = float(item["cvr"])
    frequency = float(item["frequency"])

    if spend < min_spend:
        return "watch", "sample too small"

    if conversions == 0 and spend >= min_spend:
        return "stop", "spent enough with zero conversion"

    if target_cpa and cpa and cpa > target_cpa * 1.3:
        return "stop", f"CPA {cpa:.2f} above threshold"

    if target_roas and roas and roas < target_roas * 0.7:
        return "stop", f"ROAS {roas:.2f} below threshold"

    if target_cpa and cpa and cpa <= target_cpa * 0.85:
        return "scale", f"CPA {cpa:.2f} safely below target"

    if target_roas and roas and roas >= target_roas * 1.15:
        return "scale", f"ROAS {roas:.2f} above target"

    if ctr < 0.005:
        return "watch", "weak click attraction"

    if cvr < 0.02:
        return "watch", "weak post-click conversion"

    if frequency >= 3 and conversions <= 1:
        return "watch", "possible fatigue or narrow audience"

    return "watch", "stable but not yet strong enough to scale"


def load_rows(path: Path) -> list[dict[str, float | str]]:
    with path.open("r", encoding="utf-8-sig", newline="") as f:
        reader = csv.DictReader(f)
        required = {"name", "spend", "impressions", "clicks", "conversions", "revenue"}
        missing = required.difference(reader.fieldnames or [])
        if missing:
            raise SystemExit(f"Missing required columns: {', '.join(sorted(missing))}")
        return [row_metrics(row) for row in reader]


def summarize(rows: list[dict[str, float | str]]) -> dict[str, float]:
    spend = sum(float(r["spend"]) for r in rows)
    conversions = sum(float(r["conversions"]) for r in rows)
    revenue = sum(float(r["revenue"]) for r in rows)
    clicks = sum(float(r["clicks"]) for r in rows)
    impressions = sum(float(r["impressions"]) for r in rows)
    return {
        "spend": spend,
        "conversions": conversions,
        "revenue": revenue,
        "ctr": safe_div(clicks, impressions),
        "cvr": safe_div(conversions, clicks),
        "cpa": safe_div(spend, conversions),
        "roas": safe_div(revenue, spend),
    }


def render(rows: list[dict[str, float | str]], decisions: list[tuple[str, str]]) -> str:
    totals = summarize(rows)
    groups: dict[str, list[str]] = {"stop": [], "scale": [], "watch": []}
    for row, (label, reason) in zip(rows, decisions):
        groups[label].append(f"- {row['name']}: {reason}")

    lines = [
        "# 投放诊断",
        "",
        "## 总览",
        f"- 花费: {totals['spend']:.2f}",
        f"- 转化量: {totals['conversions']:.2f}",
        f"- CPA: {totals['cpa']:.2f}",
        f"- ROAS: {totals['roas']:.2f}",
        f"- CTR: {totals['ctr']:.2%}",
        f"- CVR: {totals['cvr']:.2%}",
        "",
        "## Stop",
    ]
    lines.extend(groups["stop"] or ["- none"])
    lines.extend(["", "## Scale"])
    lines.extend(groups["scale"] or ["- none"])
    lines.extend(["", "## Watch"])
    lines.extend(groups["watch"] or ["- none"])
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("csv_path", type=Path)
    parser.add_argument("--target-cpa", type=float, default=None)
    parser.add_argument("--target-roas", type=float, default=None)
    parser.add_argument("--min-spend", type=float, default=100.0)
    args = parser.parse_args()

    rows = load_rows(args.csv_path)
    decisions = [
        classify(row, args.target_cpa, args.target_roas, args.min_spend) for row in rows
    ]
    print(render(rows, decisions))
    return 0


if __name__ == "__main__":
    sys.exit(main())

# codex-skills

- time: 2026-04-16
- source: agent
- type: project
- confidence: high
- tags: [project, codex, github, tooling]

## Goal

把用户积累的 Codex skills 收敛到 GitHub 仓库里，形成一个可跨设备恢复的单独区域。

## Home

主目录放在 `codex/`，其中：

- `codex/skills/` 保存 skill 本体
- `codex/plugins/` 保存本地插件包装
- `codex/install-skills.sh` 负责恢复到本机 `~/.codex/skills`

## Current Assets

- `china-ads-automation`
- `game-creative-market-expert`
- `liucheng-fuzhi`
- `logo-generator`
- `plugins/logo-generator`

## Usage

在任意设备 clone 仓库后执行：

```bash
./codex/install-skills.sh
```

然后重启 Codex。

## Notes

- 系统自带 skills 不存这里
- 插件入口的 marketplace 注册仍然是本地配置，仓库里只保留插件目录和注册条目模板

<!-- PROJECT_SUMMARY_START -->
## Recent Event Summary
- 2026-04-16T16:21:28+08:00 | codex [behavior]: start archiving local Codex skills into repo-backed codex/skills for cross-device sync
- 2026-04-16T16:22:39+08:00 | codex [behavior]: archive local Codex skills and plugin wrapper for cross-device restore
<!-- PROJECT_SUMMARY_END -->

<!-- ROUTED_EVENTS_START -->
## Routed Events
- 2026-04-16T16:21:28+08:00 | codex [behavior]: start archiving local Codex skills into repo-backed codex/skills for cross-device sync
- 2026-04-16T16:22:39+08:00 | codex [behavior]: archive local Codex skills and plugin wrapper for cross-device restore
<!-- ROUTED_EVENTS_END -->

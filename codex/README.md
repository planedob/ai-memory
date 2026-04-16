# Codex Assets

这个目录专门存放可跨设备同步的 Codex 资产。

## 目录

- `skills/`: 可直接同步到 `~/.codex/skills/` 的 skills
- `plugins/`: 本地插件包装
- `install-skills.sh`: 一键把仓库里的 skills 安装到当前设备

## 当前收录

- `china-ads-automation`
- `game-creative-market-expert`
- `liucheng-fuzhi`
- `logo-generator`

## 跨设备使用

1. 在新设备 clone 这个仓库
2. 运行：

```bash
./codex/install-skills.sh
```

3. 重启 Codex

## 可选：恢复本地插件入口

仓库里还保留了 `plugins/logo-generator`。如果想把它恢复成“技能和应用”里的本地插件入口：

1. 复制插件目录到 `~/plugins/logo-generator`
2. 把 `plugins/logo-generator-marketplace-entry.json` 里的条目加入 `~/.agents/plugins/marketplace.json`
3. 重启 Codex

## 说明

- 这里只同步你主动沉淀进仓库的 assets，不会自动把所有本机临时状态都推上去
- `.system` 目录下的系统 skills 不归档到这里
- 不要把 API key、token、私钥写进这些 skill 目录

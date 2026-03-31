# GitHub Setup

## 当前状态

- 本地 Git 已初始化
- 本机已有 SSH 公钥
- 这把 key 还没有加入 GitHub，所以当前无法 push

## 你需要做的事

1. 打开 GitHub
2. 进入 `Settings -> SSH and GPG keys`
3. 新建一个 SSH key
4. 把本机公钥粘进去

本机公钥文件位置：

- `~/.ssh/id_ed25519.pub`

## 推荐建仓方式

在 GitHub 新建一个私有仓库，例如：

- `ai-memory`
- `second-brain`
- `agent-memory`

不要勾选自动生成 README，因为本地已经有了。

## 添加远程仓库

示例：

```bash
cd /Users/dc/ai-memory
git remote add origin git@github.com:<your-name>/ai-memory.git
```

或改用脚本：

```bash
cd /Users/dc/ai-memory
./scripts/set-remote.sh git@github.com:<your-name>/ai-memory.git
```

## 首次提交与推送

先设置 Git 身份：

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

然后：

```bash
cd /Users/dc/ai-memory
git add .
git commit -m "Initialize AI memory repo"
git branch -M main
git push -u origin main
```

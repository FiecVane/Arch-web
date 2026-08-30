#!/usr/bin/env bash
# 一键同步脚本：提交本地改动 -> 拉取远端最新代码 -> 推送到 GitHub
# 用法：直接运行  bash sync.sh
set -e
cd "$(dirname "$0")"

echo "==> [1/3] 提交本地改动..."
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "sync: $(date '+%Y-%m-%d %H:%M')"
else
    echo "    没有本地改动，跳过提交"
fi

echo "==> [2/3] 拉取远端最新代码..."
git pull --rebase origin main

echo "==> [3/3] 推送到 GitHub..."
git push origin main

echo "==> 同步完成 ✔"

#!/bin/zsh

# 현재 날짜 가져오기 (예: 2026-03-20)
TODAY=$(date "+%Y-%m-%d")

# Git 명령어 실행
git add .
git commit -m "$TODAY"
git push origin main

echo "🚀 $TODAY 날짜로 푸시 완료!"

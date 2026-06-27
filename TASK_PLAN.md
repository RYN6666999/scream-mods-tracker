# Scream Code 修改追蹤系統

## 目標
追蹤「原始 scream-code v0.5.13 vs Ryan 自訂版本」的差異，產出兩份文件：

| 輸出 | 用途 | 目標位置 |
|------|------|---------|
| **personal-fork/** | Ryan 個人 fork 完整記錄 | GitHub repo RYN6666999/scream-fork |
| **contribution/** | 可 upstream 給 LIUTod/scream-code 的建議 | GitHub PR |

## 原始 scream-code
- repo: https://github.com/LIUTod/scream-code
- 版本: 0.5.13
- 安裝: npm global via Homebrew → `/opt/homebrew/lib/node_modules/scream-code/`
- 無內建 AGENTS.md、無內建 skills、純 terminal AI agent

## Loop 機制
- `track-scream-mods/` skill：手動觸發更新追蹤
- cron job：每週一 09:00 自動檢查
- 每次執行：diff 當前狀態 vs baseline → 更新兩份文件

## 階段

- [x] Phase 0: 建立目錄結構
- [x] Phase 1: 寫追蹤腳本 track.sh
- [x] Phase 2: 寫追蹤技能 SKILL.md
- [x] Phase 3: 建立個人 Fork 文件
- [x] Phase 4: 建立貢獻 PR 文件
- [x] Phase 5: 設定 cron job
- [x] Phase 6: 初始化 baseline 快照 (2026-06-19)
- [x] Phase 7: 2026-06-27 大更新 — Base44 啟發的全球升級
- [x] Phase 8: 2026-06-27 — 建立 RYN6666999/scream-fork repo + 推送程式碼
  - P1: SKILL.md 狀態感知 + anti-hallucination (agentos, template-batch)
  - P2: Plugin marketplace 格式 (.claude-plugin/)
  - P3: Auto-sync pipeline (sync-agentos-skill.yml)
  - P4: AGENTS.md + CLAUDE.md 補完
  - P5: Troubleshooter skill 建立
  - P6: 跨 Skill Interface 協定
  - P7: CI/CD Agent Review workflow
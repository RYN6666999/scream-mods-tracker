# Contribution — Scream Code 上游建議

給 LIUTod/scream-code 的貢獻建議。由追蹤腳本自動產生。

## Reference Fork

所有 PR 的實作參考可在 [RYN6666999/scream-fork](https://github.com/RYN6666999/scream-fork) 找到。

## PR 候選清單

| # | 主題 | 類型 | 狀態 | 參考實作 |
|---|------|------|------|---------|
| 1 | caveman-ponytail skill 整合 | 功能 | draft | `~/.agents/skills/caveman-ponytail/SKILL.md` |
| 2 | 中文優化 — 碎片化輸出風格 | 功能 | draft | 同上（caveman-ponytail 內含） |
| 3 | SKILL.md 標準化模板 | 架構 | draft | [`scream-fork/skill-template.md`](https://github.com/RYN6666999/scream-fork/blob/main/skill-template.md) |
| 4 | AGENTS.md 格式建議 | 架構 | draft | [`scream-fork/AGENTS.md`](https://github.com/RYN6666999/scream-fork/blob/main/AGENTS.md) |
| 5 | 內建 troubleshooter skill | 功能 | draft | [`scream-fork/skills/troubleshooter/SKILL.md`](https://github.com/RYN6666999/scream-fork/blob/main/skills/troubleshooter/SKILL.md) |
| 6 | Plugin marketplace 格式 | 架構 | draft | [`scream-fork/claude-plugin/`](https://github.com/RYN6666999/scream-fork/tree/main/claude-plugin) |

詳細內容見各檔案 。

## 貢獻原則

- 只建議對 scream-code 通用有意義的修改
- 不要包含 Ryan 個人設定（API key、專案路徑）
- 不要包含第三方 marketplace plugins
- 每個 PR 獨立、可選擇性合併

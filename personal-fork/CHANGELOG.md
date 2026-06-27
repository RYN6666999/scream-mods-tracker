# Changelog — Scream Code 自訂版本

追蹤 scream-code v0.5.13 原始版 → Ryan 自訂版的所有變更。

## 2026-06-19 — 初始追蹤建立

### 新增技能（7）
- caveman-ponytail
- claude-code-bash-patterns
- codebase-analysis
- debug
- git-workflow
- planning-with-files
- test-driven-development
- track-scream-mods

### 已安裝 plugin（4）
- caveman
- claude-plugins-official
- cloudflare
- ponytail

### 自訂指令
- abb.md

### 活躍專案（18）
- -Users-ryan
- -Users-ryan--claude-worktrees-nanoclaw-mystifying-goldstine
- -Users-ryan--claude-worktrees-nanoclaw-sleepy-nightingale
- -Users-ryan-agent-sandbox
- -Users-ryan-ComfyUI
- -Users-ryan-gbrain
- -Users-ryan-gbrain--claude-worktrees-compassionate-tu-125a92
- -Users-ryan-gbrain--claude-worktrees-exciting-lichterman-2785f0
- -Users-ryan-gbrain--claude-worktrees-hopeful-swanson-4ffd48
- -Users-ryan-gbrain--claude-worktrees-interesting-dijkstra-d61762
- -Users-ryan-gbrain--claude-worktrees-modest-jones-85d224
- -Users-ryan-gbrain--claude-worktrees-vigorous-ride-b584cc
- -Users-ryan-Library
- -Users-ryan-meta-agent
- -Users-ryan-nanoclaw
- -Users-ryan-nanoclaw-nanoclaw
- -Users-ryan-project-golem

## 2026-06-27 — Phase 9：Vibe Coding Radar 全做（4 工具 + 1 skill）

### 安裝
- `codebase-memory-mcp` v0.8.1 — 程式碼知識圖譜（158 語言、14 MCP tools、<1ms 查詢）
- `agentsview` v0.34.5 — Coding Agent 會話分析（20+ agent 支援、token 成本、activity heatmap）
- `OpenCLI` v1.8.4 — 100+ 站點 CLI adapters（小紅書/B站/知乎/Twitter）
- 以上均已自動配置 MCP server / CLI 路徑

### 新增 Project Skill
- `skill-security` — NVIDIA SkillSpector 啟發的安全掃描器（4 類 16 模式 + 風險評分 + Baseline）
- AGENTS.md 新增「系統工具」章節

### fdd-crm 首次索引
- codebase-memory-mcp 已索引 fdd-crm：924 nodes、2499 edges、73 files、611ms
- agentsview 已啟動在 localhost:8080

---

## 2026-06-27 — Vibe Coding Radar 啟發升級（caveman-ponytail v4.0.0）

### 新增（3 項，來自 headroom 52k★）
- **Input Compression** — content-aware type routing（JSON/code/log/diff/CSV/plain），搭配 detection heuristic + AdaptiveSizer（資訊飽和檢測）
- **CCR (Compress-Cache-Retrieve)** — 壓縮捨棄的內容存 hash 到 `~/.scream-code/ccr/`，可召回，session 結束自動清理
- **CacheAligner** — system prompt 穩定性檢測，動態內容移出 system prompt 保護 KV cache

### 新增（2 項，來自 radar.lyihub.com/skills.html）
- **Common Rationalizations 表** — 加到 skill-template + agentos + template-batch + troubleshooter
- **Description 改純觸發條件** — 實證發現 description 摘要流程會讓 agent 不讀完整 SKILL.md

### 新增參考來源
- AGENTS.md 掛載 Vibe Coding 雷達參考鏈結
- caveman-ponytail sources 新增 headroom + radar.lyihub.com

---

## 2026-06-27 — Phase 8：Personal Fork 推送至 GitHub

### 新增
- `RYN6666999/scream-fork` repo 已建立並推送
- AGENTS.md / 3 project skills / claude-plugin / config.toml.example / skill-template.md / improvement-plan 已上線
- plugin.json / marketplace.json 已補完（homepage + repository）

### 同步更新
- `.scream-code/.claude-plugin/plugin.json`（補完 URL）
- `.scream-code/.claude-plugin/marketplace.json`（補完 URL）
- `scream-mods-tracker/TASK_PLAN.md`（加 Phase 8）

---

## 2026-06-27 — Base44 啟發的全域升級（Phase 1-3）

### 新增專案級 Skill（3）
- `agentos`（升級：進場檢查 + anti-hallucination + interface）
- `template-batch`（升級：進場檢查 + anti-hallucination + interface）
- `troubleshooter`（新建：標準化排查流程）

### 新增基礎建設
- `.claude-plugin/plugin.json` + `marketplace.json` — Plugin marketplace 格式
- `AGENTS.md` — 寫給 AI 開發者看的架構總覽
- `skill-template.md` — 新 Skill 模板（進場檢查 / anti-hallucination / interface）
- `improvement-plan-scream-code.md` — 完整提升計畫

### 新增自動化 (agent-sandbox)
- `CLAUDE.md` — 技術規格 + 架構圖 + 開發指令
- `.github/workflows/claude-code-review.yml` — PR 自動 AI 審查
- `.github/workflows/sync-agentos-skill.yml` — 發版自動更新 SKILL.md
- `.scream-code/skill-sources/agentos/SKILL.md` — Skill source of truth

### 跨 Skill Interface 互通網路
```
agentos ── skill/agentos/status ──→ template-batch, troubleshooter, agentos-bridge
template-batch ── skill/template-batch/last-run ──→ agentos
agentos-bridge ── shared/status-from-* ──→ agentos
```

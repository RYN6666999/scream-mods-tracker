# PR-003: SKILL.md 標準化模板 — 進場檢查 + Anti-hallucination + Interface

## 動機

Scream Code 的 Skill 系統缺乏統一的結構約定，導致 AI agent 使用 skill 時：
- 不知道第一步該做什麼
- 容易用錯 API / 命令名稱
- 不同 skill 之間無法互通狀態

引入三區塊模板可顯著改善 agent 使用 skill 的正確率與效率。

## 建議實作

在 scream-code 內建一個 skill 開發指南，規範每個 SKILL.md 應包含：

### 三區塊標準

```markdown
## ⚡ 進場檢查（Immediate Action）
定義 AI agent 進入 skill 後「必須」做的第一件事。
例如：檢查檔案存在 → 決定走 A/B 路徑。

## ⚠️ Anti-hallucination：常見錯誤
列出這個 skill 範圍內 AI 最容易搞錯的 API/命令/做法。
表格格式：❌ 錯的 vs ✅ 對的。

## 🔄 Skill Interface
定義這個 skill 輸入/輸出哪些腦庫 key，
讓不同 skill 可以互通。
```

## 需要的變更

1. 建立 `SKILL_TEMPLATE.md` 作為官方模板
2. 在 `AGENTS.md` 或文件說明中引用模板
3. 不強制既有 skill 升級（向後相容）

## 不應包含的內容

- 不指定特定腦庫 key 命名（保留給專案自訂）
- 不限制 skill 的擴充區塊（三區塊是最低要求，可加額外內容）

## 參考實作

- 模板檔案：[`scream-fork/skill-template.md`](https://github.com/RYN6666999/scream-fork/blob/main/skill-template.md)
- 實作範例（三支 project skill 皆遵循此模板）：
  - [`scream-fork/skills/agentos/SKILL.md`](https://github.com/RYN6666999/scream-fork/blob/main/skills/agentos/SKILL.md)
  - [`scream-fork/skills/template-batch/SKILL.md`](https://github.com/RYN6666999/scream-fork/blob/main/skills/template-batch/SKILL.md)
  - [`scream-fork/skills/troubleshooter/SKILL.md`](https://github.com/RYN6666999/scream-fork/blob/main/skills/troubleshooter/SKILL.md)

## 狀態

draft | 可合併至 scream-code v0.6.0
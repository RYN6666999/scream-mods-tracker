# PR-004: AGENTS.md 格式建議 — AI 開發者入口文件

## 動機

Scream Code 專案中 AI agent 接手時缺乏統一的「開發者入口」。目前依賴 `README.md`（寫給人看的），但 AI 需要的資訊不同：
- Tech stack / 架構圖
- 開發命令
- Rules（不可踩的紅線）
- 可用的 skills / 工具

## 建議實作

在 scream-code 內建 `AGENTS.md` 格式規格，建議每個專案包含：

### 建議結構

```markdown
# 專案名稱

## 這是什麼
一句話說明專案角色。

## Tech Stack
關鍵技術與版本。

## 架構
目錄樹 + 模組說明。

## Development Commands
安裝 / 測試 / 建置 / 部署命令。

## Rules
AI agent 必須遵守的規則（紅線、約定）。

## Available Skills
這個專案可用的 skill 列表。
```

## 需要的變更

1. 建立 `AGENTS.md` 官方規格文件
2. 在 `scream create` 模板中加入 `AGENTS.md`
3. 在文件說明中推廣此格式

## 狀態

draft | 可合併至 scream-code v0.6.0
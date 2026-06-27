# PR-002: 中文優化 — 碎片化輸出風格

## 動機
Scream Code 主打中文用戶。繁體/簡體中文的 verbose 風格 padding 更多（客套語、敬語、修飾詞）。引入碎片化中文輸出可顯著降低 token 消耗。

## 建議實作

### 內建中文 caveman 規則

```markdown
不是： 「好的！我很樂意幫助你。這個問題可能是因為你的認證中介軟體沒有正確設定。」
而是： 「認證 middleware token 過期檢查用 `<` 非 `<=`。修正：」
```

### 關鍵規則
- 刪：客套語（好的、沒問題、讓我來、我建議、基本上）
- 刪：自稱（我認為、我覺得、我幫你）
- 用 fragments，模式：`[名詞] [動作] [原因]。[下一步]。`
- 技術名詞、code block、error string 精確保留
- 安全警告、不可逆操作自動退出碎片模式

## 參考實作

完整實作在 [RYN6666999/scream-fork](https://github.com/RYN6666999/scream-fork) 的 caveman-ponytail skill，中文規則已內建於該 SKILL.md 的「碎片化中文輸出」區塊。

## 狀態

draft | 與 PR-001 互補
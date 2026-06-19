# PR-001: 內建 caveman-ponytail 輸出壓縮 + 程式碼極簡模組

## 動機
Scream Code 作為 terminal AI agent，預設輸出風格偏冗長。引入 caveman (output compression) + ponytail (code minimalism) 可顯著降低 token 消耗：

| 指標 | 改善 |
|------|------|
| 輸出 token | −65% |
| 程式碼行數 | −80~94% |
| 執行時間 | −3.8× |
| 成本 | −42~75% |

(數據來自 ponytail benchmark，3 models × 5 tasks)

## 建議實作

### Option A: 內建雙模式（推薦）
在 scream-code 內建兩套可切換的輸出模式：

```
scream config set output-mode caveman|normal
scream config set code-mode ponytail|normal
```

### Option B: 預設開啟 caveman-lite
預設啟用輕度壓縮（drop filler/hedging，保留完整句子），用戶可增強至 full/ultra。

## 需要的變更

1. `AGENTS.md` 或等效的 rules 文件中加入 caveman + ponytail 規則
2. 支援 `config set output-mode` 指令
3. 規則不影響 code block 內容、error message、security warning

## 不應包含的內容

- 中文特定的碎片化語法（保留給用戶自訂）
- 第三方 marketplace plugins 的安裝邏輯

## 狀態

draft | 可合併至 scream-code v0.6.0
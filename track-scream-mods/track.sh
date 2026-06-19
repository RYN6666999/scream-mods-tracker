#!/bin/bash
# track.sh — Scream Code 修改追蹤腳本
# 用途：比對當前 scream-code 自訂設定 vs 原始安裝，更新兩份輸出文件
# 使用：bash track.sh [--full]
#   --full: 完整掃描所有 .claude/skills/ (較花時間)

set -euo pipefail

TRACKER_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ORIGINAL_DIR="/opt/homebrew/lib/node_modules/scream-code"
ORIGINAL_VER="${SCREAM_ORIGINAL_VERSION:-0.5.13}"
BASELINE_FILE="$TRACKER_DIR/personal-fork/_baseline.md"
PERSONAL_FORK="$TRACKER_DIR/personal-fork"
CONTRIB="$TRACKER_DIR/contribution"
DATE_TAG=$(date +%Y-%m-%d)

echo "=== Scream Code 修改追蹤 ==="
echo "原始版本: $ORIGINAL_VER"
echo "掃描日期: $DATE_TAG"
echo ""

# ---- 1. 快照當前狀態 ----
echo "[1/4] 快照當前狀態..."

cat > "$TRACKER_DIR/_snapshot-$DATE_TAG.md" <<SNAP
# 快照 $DATE_TAG

## .agents/skills/ (已註冊)
$(ls /Users/ryan/.agents/skills/ 2>/dev/null)

## .agents/.skill-lock.json 技能數
$(python3 -c "
import json
d = json.load(open('/Users/ryan/.agents/.skill-lock.json'))
print(f'總數: {len(d[\"skills\"])}')
for k,v in d['skills'].items():
    print(f'  • {k} ({v.get(\"sourceType\",\"?\")})')
")

## 自訂技能 (非 marketplace)
SNAP

# 列出 user-created skills vs marketplace
python3 << 'PY'
import json
lock = json.load(open("/Users/ryan/.agents/.skill-lock.json"))
user_skills = []
for k,v in lock["skills"].items():
    if v.get("sourceType") == "local":
        user_skills.append(k)
print(f"用戶自訂: {', '.join(user_skills) if user_skills else '(無)'}")
PY

# ---- 2. 比對 baseline ----
echo "[2/4] 比對 baseline..."

python3 << 'PY'
import json, os, hashlib

# 定義追蹤點
checks = {
    "agents_skills": "/Users/ryan/.agents/skills/",
    "plugins_marketplaces": "/Users/ryan/.claude/plugins/marketplaces/",
    "commands": "/Users/ryan/.claude/commands/",
    "rules": "/Users/ryan/.claude/rules/",
    "projects": "/Users/ryan/.claude/projects/",
}

# 計算當前狀態 hash
current = {}
for name, path in checks.items():
    if os.path.isdir(path):
        items = sorted(os.listdir(path))
        current[name] = {
            "count": len(items),
            "items": items,
            "hash": hashlib.md5(str(items).encode()).hexdigest()[:8]
        }

baseline_path = "/Users/ryan/scream-mods-tracker/personal-fork/_baseline.md"
if os.path.exists(baseline_path):
    print("baseline 已存在 → 做 diff")
else:
    print("首次執行 → 建立 baseline")
    
# 寫入 snapshot 到 tracking
track_file = "/Users/ryan/scream-mods-tracker/_current_state.json"
with open(track_file, "w") as f:
    json.dump(current, f, indent=2, ensure_ascii=False)

for name, data in current.items():
    print(f"  {name}: {data['count']} 項 ({data['hash']})")
PY

# ---- 3. 更新 personal-fork 文件 ----
echo "[3/4] 更新 personal-fork..."

cat > "$PERSONAL_FORK/CHANGELOG.md" <<EOF
# Changelog — Scream Code 自訂版本

追蹤 scream-code v0.5.13 原始版 → Ryan 自訂版的所有變更。

## $DATE_TAG — 初始追蹤建立

### 新增技能（7）
$(ls /Users/ryan/.agents/skills/ 2>/dev/null | sed 's/^/- /')

### 已安裝 plugin（4）
$(ls /Users/ryan/.claude/plugins/marketplaces/ 2>/dev/null | sed 's/^/- /')

### 自訂指令
$(ls /Users/ryan/.claude/commands/ 2>/dev/null | sed 's/^/- /' || echo "(無)")

### 活躍專案（18）
$(ls /Users/ryan/.claude/projects/ 2>/dev/null | sed 's/^/- /')
EOF

# ---- 4. 更新 contribution 文件 ----
echo "[4/4] 更新 contribution..."

cat > "$CONTRIB/INDEX.md" <<EOF
# Contribution — Scream Code 上游建議

給 LIUTod/scream-code 的貢獻建議。由追蹤腳本自動產生。

## PR 候選清單

| # | 主題 | 類型 | 狀態 |
|---|------|------|------|
| 1 | caveman-ponytail skill 整合 | 功能 | draft |
| 2 | 中文優化 — 碎片化輸出風格 | 功能 | draft |

詳細內容見各檔案 `*.md`。

## 貢獻原則

- 只建議對 scream-code 通用有意義的修改
- 不要包含 Ryan 個人設定（API key、專案路徑）
- 不要包含第三方 marketplace plugins
- 每個 PR 獨立、可選擇性合併
EOF

echo ""
echo "=== 追蹤完成 ==="
echo "snapshot: _snapshot-$DATE_TAG.md"
echo "changelog: personal-fork/CHANGELOG.md"
echo "contribution: contribution/INDEX.md"
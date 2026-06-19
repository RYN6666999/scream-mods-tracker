# Scream Code — Ryan's Fork

Base: `scream-code` v0.5.13 by LIUTod
Fork: Ryan @RYN6666999
Tracked from: 2026-06-19

## What's different

| Area | Original | Ryan's Fork |
|------|----------|-------------|
| Skills | 0 built-in | 7 registered (`caveman-ponytail`, `debug`, `planning-with-files`, etc.) |
| Plugins | 0 | 4 marketplace (caveman, ponytail, cloudflare, claude-plugins-official) |
| Commands | 0 | 1 (`abb.md`) |
| Projects | 0 | 18 (nanoclaw, agent-sandbox, gbrain, LB-\*, etc.) |
| Rules | 0 | `common/` |
| Output style | full prose | caveman compression (fragments, no filler) |
| Code style | standard | ponytail ladder (YAGNI → stdlib → native → min) |
| Third-party integrations | 0 | nanoclaw Telegram bot, AgentOS, LifeBuilder ecosystem |

## Key additions

### Skill: caveman-ponytail (user-created)
Merges two open-source philosophies:
- **Caveman** (JuliusBrussee) — output token compression ~65%
- **Ponytail** (DietrichGebert) — code minimalism 80-94%
- Plus Scream Code-specific extensions (parallel tool calls, WolfPack, anchor validation)

### Skill: track-scream-mods (user-created)
Long-running change tracker. Auto-checks weekly via cron.

### Plugins installed
- `caveman` — output compression
- `ponytail` — lazy senior dev mode
- `cloudflare` — Cloudflare integration
- `claude-plugins-official` — official plugin set

## Projects managed by this agent

- `nanoclaw` — Telegram AI assistant (gemini/grok multi-tier)
- `agent-sandbox` — AgentOS Maker/Checker framework
- `LB-arcanum/numen/nexus/nuntius` — LifeBuilder ecosystem
- `super-engine` — Web LLM driver
- `mcp-hub-mvp` — MCP hub server
- `life-builder31491` — Infinite Mandalart PM
- `fdd-crm/reception` — 房多多 CRM
- `meta-agent`, `HMM` — experimental

## Auto-tracking

This repo auto-updates via:
1. `track-scream-mods` skill (manual: invoke skill)
2. Cron job every Monday 09:00 (auto: `track.sh`)
3. Snapshots saved to `_snapshot-*.md`

See `CHANGELOG.md` for history.
# Runtime Integration

## Claude Code
Install the `.claude/` adapter and merge `CLAUDE.md.fragment` into the project's existing `CLAUDE.md`. The adapter includes the project skill, specialized subagents, and cross-platform destructive-command guard hooks. Hook settings are deliberately supplied as fragments because existing project or managed controls must not be overwritten.

## Codex
Install `.agents/skills/ai-engineering-os/`, merge `AGENTS.md.fragment` into repository `AGENTS.md`, and use `PLANS.md` for long-running execution plans. For independent review, use a separate Codex agent/thread/worktree or a human reviewer.

## Install
Windows PowerShell:
```powershell
./scripts/install-runtime.ps1 -Runtime both -ProjectPath C:\path\to\repo
```
macOS/Linux:
```bash
./scripts/install-runtime.sh both /path/to/repo
```
Optional durable state:
```bash
python scripts/bootstrap-state.py /path/to/repo
```

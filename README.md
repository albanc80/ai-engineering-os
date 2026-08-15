# AI Engineering Operating System v2.0

A vendor-neutral, risk-calibrated engineering operating model with native runtime adapters for Claude Code and Codex.

## What v2 adds
- Claude Code project skill and specialized subagents
- Claude Code PowerShell/Bash destructive-command guard hooks
- Codex repo skill under `.agents/skills`
- Codex `AGENTS.md` operating-policy fragment and `PLANS.md`
- runtime-neutral workflow state contract
- Windows and POSIX installers
- machine-readable `.ai-engineering/state.json` bootstrap
- baseline skill eval cases

## Architecture
`Request -> Risk Route -> Repository Grounding -> Specification -> Architecture -> Adversarial Challenge -> Task Decomposition -> Implementation -> Independent Review -> Verification -> Release Gate`

Routes: FAST for localized/reversible work; STANDARD for features/integrations/cross-module changes; ENTERPRISE for autonomy, sensitive data, critical systems, major migrations, security/compliance, or high blast radius.

## Runtime model
- `SKILL.md` = canonical methodology
- `CLAUDE.md` / `AGENTS.md` = durable repository guidance
- skills = workflow activation
- subagents / separate agents = specialized or independent contexts
- hooks / sandbox / approvals = deterministic enforcement
- `.ai-engineering/` = durable artifacts and workflow state

## Install
Windows:
```powershell
./scripts/install-runtime.ps1 -Runtime both -ProjectPath C:\path\to\repo
```
macOS/Linux:
```bash
./scripts/install-runtime.sh both /path/to/repo
```
The installers append marked guidance rather than replacing existing `CLAUDE.md` or `AGENTS.md`. Claude hook settings are not auto-merged because existing settings may contain team or managed controls.

Optional durable workflow state:
```bash
python scripts/bootstrap-state.py /path/to/repo
```

## Governance
The coding agent is an execution runtime, not the sole product, architecture, security, or evaluation authority. STANDARD and ENTERPRISE changes require independent review. ENTERPRISE work defaults to human architecture, security, and release gates.

## License
Apache-2.0. See [LICENSE](LICENSE).

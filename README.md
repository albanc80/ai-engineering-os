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

## Acknowledgments
This project was inspired by **Maryam Miradi, PhD** and her post
[*How to Use Claude Code Like a Senior AI Engineer*](https://www.linkedin.com/posts/maryammiradi_how-to-use-claude-code-like-a-senior-activity-7493382359824875520-1gxU),
which argues that "coding is the last step, not the first" and lays out a
specification-driven workflow — requirements, principles, tool research,
architecture review, and adversarial challenge — before any code is generated.

That framing is the seed of this operating model: the risk route, the
repository-grounding and specification stages, and the adversarial-challenge and
independent-review gates all trace back to it. Thank you for putting the idea
into words, and for the reminder that the coding agent is the execution runtime,
not the architecture, security, or evaluation authority.

**Where this repository diverges.** Her post chains several separate tools, and
those tools overlap heavily — each ships its own planning step, its own
specification format, and its own review pass, so running them in sequence means
doing the same work three or four times under different names. This repository
takes the opposite approach: one pass over that stack, keeping only the piece
each tool does best, and dropping every duplicate stage. The result is a single
non-repetitive workflow with one specification format, one artifact location
(`.ai-engineering/`), and one set of gates — usable as-is rather than assembled
from overlapping parts.

Any errors or opinions in this repository are its author's, not hers.

## License
Apache-2.0. See [LICENSE](LICENSE).

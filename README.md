# AI Engineering Operating System v2.0

A vendor-neutral, risk-calibrated engineering operating model with native runtime adapters for Claude Code and Codex.

It answers one question: what has to be true before a coding agent is allowed to
implement? Specification, architecture, and adversarial review come first; code
generation is the last step, not the first.

## What's in it
- a canonical methodology (`SKILL.md`) that installs as a skill in either runtime
- specialized agent definitions for analysis, architecture, implementation,
  testing, security, adversarial review, and release
- review rubrics and artifact templates (spec, ADR, architecture, constitution,
  task, verification report)
- destructive-command guard hooks for Claude Code, PowerShell and Bash
- a runtime-neutral workflow state contract, with `.ai-engineering/state.json`
  as the machine-readable state
- one-command installers for Windows and POSIX
- baseline eval cases for the skill

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

### Where this repository diverges

Her post chains several frameworks in sequence. Stacked as-is they overlap —
each ships its own planning step, specification format, and review pass, so
running them end to end repeats the same work under different names.

This repository is a synthesis instead: one reusable skill that takes the single
thing each framework does best and drops the duplicated stages.

| Source | What is kept |
|---|---|
| BMAD | problem framing and product architecture |
| Spec Kit | specifications and the engineering constitution |
| GSD | context management and decomposition |
| gstack | independent / adversarial engineering review |
| Superpowers | TDD and disciplined implementation |
| Claude Code / Codex | execution runtime |

On top of that layer: risk-based workflow routing, repository grounding, quality
gates, specialized agents, and explicit human approval boundaries.

The methodology is deliberately not tied to one vendor. It targets any
Agent-Skills-compatible environment — Claude Code, Codex, and others — since
Claude Skills follow the open [Agent Skills standard](https://docs.anthropic.com/en/docs/claude-code/skills),
with some proprietary extensions on top.

### The enforced principle

No agent gets permission to implement until it can answer:

```
WHAT are we solving?
WHY does it matter?
WHAT are the acceptance criteria?
WHAT constraints apply?
WHAT already exists?
HOW will we implement it?
HOW will we prove it works?
WHAT can go wrong?
```

Only then:

```
→ CODE
```

This keeps the useful idea behind the original workflow while avoiding the
framework-stacking problem.

Any errors or opinions in this repository are its author's, not hers.

## License
Apache-2.0. See [LICENSE](LICENSE).

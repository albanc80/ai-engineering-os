# AI Engineering Operating System — repository guidance

This repository *is* the methodology. `SKILL.md` is canonical; everything else is
a template, rubric, agent definition, or runtime adapter that must stay consistent
with it.

## Working rules
- Edit `SKILL.md` first, then propagate to the runtime copies under
  `runtime/claude-code/.claude/skills/` and `runtime/codex/.agents/skills/`.
  Each runtime copy is the canonical file verbatim plus one trailing
  `## <Runtime> Runtime Adapter` section. Changing the canonical body without
  re-propagating is a defect; verify with
  `diff SKILL.md runtime/codex/.agents/skills/ai-engineering-os/SKILL.md`
  (the only difference should be the adapter section).
- Keep top-level `agents/`, `rubrics/`, `templates/`, `hooks/` vendor-neutral.
  Runtime-specific syntax belongs under `runtime/<runtime>/`.
- Bump `VERSION` for any change to the methodology or the runtime contract.
- After changing an installer, smoke-test it into a throwaway directory before
  committing.

## Layout
| Path | Role |
|---|---|
| `SKILL.md` | canonical methodology |
| `agents/`, `rubrics/`, `templates/` | vendor-neutral role, review, and artifact definitions |
| `runtime/claude-code/`, `runtime/codex/` | runtime adapters installed into consumer repos |
| `runtime/shared/WORKFLOW-CONTRACT.md` | runtime-neutral state contract |
| `scripts/` | installers and `.ai-engineering/state.json` bootstrap |
| `evals/evals.json` | baseline skill eval cases |

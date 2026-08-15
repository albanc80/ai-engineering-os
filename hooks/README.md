# Deterministic Control Hooks

Use hooks, CI jobs, branch rules, or equivalent deterministic controls for rules that should not depend on an LLM remembering them.

Recommended control points:

## Before tool/command execution
- block destructive commands unless explicitly approved;
- block writes outside allowed paths;
- prevent secrets from being printed or committed;
- constrain agent tools by role.

## After file changes
- run formatter;
- run lint/static analysis;
- run type checks for affected modules;
- detect accidental secret inclusion.

## Before task completion
- run task-specific tests;
- verify acceptance criteria have evidence;
- reject completion if verification is missing.

## Before merge/release
- require independent review for STANDARD/ENTERPRISE changes;
- require security approval for high-risk changes;
- validate migration and rollback;
- require release-readiness decision.

Implementation syntax depends on the coding runtime and CI platform. Keep this folder vendor-neutral unless the user requests a Claude Code-, Codex-, GitHub-, GitLab-, Azure DevOps-, or other platform-specific adapter.

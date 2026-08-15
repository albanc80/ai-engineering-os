#!/usr/bin/env bash
set -euo pipefail
runtime="${1:-}"
project="${2:-}"
if [[ ! "$runtime" =~ ^(claude|codex|both)$ ]] || [[ -z "$project" ]]; then
  echo "Usage: $0 <claude|codex|both> <project-path>" >&2; exit 2
fi
root="$(cd "$project" && pwd)"
package="$(cd "$(dirname "$0")/.." && pwd)"
append_fragment(){ local target="$1" fragment="$2" marker='<!-- AI-ENGINEERING-OS -->'; if [[ -f "$target" ]]; then grep -Fq "$marker" "$target" || { printf '\n\n%s\n' "$marker" >> "$target"; cat "$fragment" >> "$target"; }; else { printf '%s\n' "$marker"; cat "$fragment"; } > "$target"; fi; }
if [[ "$runtime" == claude || "$runtime" == both ]]; then
  mkdir -p "$root/.claude"
  cp -R "$package/runtime/claude-code/.claude/skills" "$root/.claude/"
  cp -R "$package/runtime/claude-code/.claude/agents" "$root/.claude/"
  cp -R "$package/runtime/claude-code/.claude/hooks" "$root/.claude/"
  append_fragment "$root/CLAUDE.md" "$package/runtime/claude-code/CLAUDE.md.fragment"
  echo "Claude Code adapter installed. Merge the appropriate settings.fragment.*.json into .claude/settings.json deliberately."
fi
if [[ "$runtime" == codex || "$runtime" == both ]]; then
  mkdir -p "$root/.agents"
  cp -R "$package/runtime/codex/.agents/skills" "$root/.agents/"
  append_fragment "$root/AGENTS.md" "$package/runtime/codex/AGENTS.md.fragment"
  [[ -f "$root/PLANS.md" ]] || cp "$package/runtime/codex/PLANS.md" "$root/PLANS.md"
  echo "Codex adapter installed."
fi
mkdir -p "$root/.ai-engineering"
echo "AI Engineering OS runtime integration completed for $runtime at $root"

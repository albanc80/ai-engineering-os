#!/usr/bin/env bash
set -euo pipefail
input="$(cat)"
command="$(printf '%s' "$input" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("command",""))')"
if printf '%s' "$command" | grep -Eqi 'rm[[:space:]]+-rf[[:space:]]+|git[[:space:]]+reset[[:space:]]+--hard|git[[:space:]]+clean[[:space:]]+-[^ ]*f|git[[:space:]]+push.*--force|DROP[[:space:]]+(DATABASE|SCHEMA|TABLE)|TRUNCATE[[:space:]]+TABLE'; then
  python3 - <<'PY'
import json
print(json.dumps({"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"AI Engineering OS: destructive/high-blast-radius command blocked. Obtain explicit human approval and execute manually or adjust the governed policy."}}))
PY
else
  exit 0
fi

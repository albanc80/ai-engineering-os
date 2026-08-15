$inputJson = [Console]::In.ReadToEnd() | ConvertFrom-Json
$command = [string]$inputJson.tool_input.command
$patterns = @(
  'Remove-Item\s+.*-Recurse.*-Force',
  'rm\s+-rf\s+',
  'git\s+reset\s+--hard',
  'git\s+clean\s+-[a-zA-Z]*f',
  'git\s+push\s+.*--force',
  'DROP\s+(DATABASE|SCHEMA|TABLE)',
  'TRUNCATE\s+TABLE'
)
$blocked = $false
foreach ($p in $patterns) { if ($command -match $p) { $blocked = $true; break } }
if ($blocked) {
  @{
    hookSpecificOutput = @{
      hookEventName = 'PreToolUse'
      permissionDecision = 'deny'
      permissionDecisionReason = 'AI Engineering OS: destructive/high-blast-radius command blocked. Obtain explicit human approval and execute manually or adjust the governed policy.'
    }
  } | ConvertTo-Json -Depth 6
} else { exit 0 }

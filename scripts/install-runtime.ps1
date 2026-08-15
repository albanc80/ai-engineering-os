param(
  [Parameter(Mandatory=$true)][ValidateSet('claude','codex','both')][string]$Runtime,
  [Parameter(Mandatory=$true)][string]$ProjectPath
)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path $ProjectPath).Path
$package = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
function Merge-TextFragment($target, $fragment, $marker) {
  $content = Get-Content $fragment -Raw
  if (Test-Path $target) {
    $existing = Get-Content $target -Raw
    if ($existing -notmatch [regex]::Escape($marker)) { Add-Content $target "`n`n$marker`n$content" }
  } else { Set-Content $target "$marker`n$content" }
}
if ($Runtime -in @('claude','both')) {
  $src = Join-Path $package 'runtime/claude-code/.claude'
  $dst = Join-Path $root '.claude'
  New-Item -ItemType Directory -Force $dst | Out-Null
  Copy-Item (Join-Path $src 'skills') $dst -Recurse -Force
  Copy-Item (Join-Path $src 'agents') $dst -Recurse -Force
  Copy-Item (Join-Path $src 'hooks') $dst -Recurse -Force
  Merge-TextFragment (Join-Path $root 'CLAUDE.md') (Join-Path $package 'runtime/claude-code/CLAUDE.md.fragment') '<!-- AI-ENGINEERING-OS -->'
  Write-Host 'Claude Code adapter installed. Merge the appropriate settings.fragment.*.json hooks into .claude/settings.json deliberately; installer does not overwrite settings.'
}
if ($Runtime -in @('codex','both')) {
  $src = Join-Path $package 'runtime/codex/.agents'
  $dst = Join-Path $root '.agents'
  New-Item -ItemType Directory -Force $dst | Out-Null
  Copy-Item (Join-Path $src 'skills') $dst -Recurse -Force
  Merge-TextFragment (Join-Path $root 'AGENTS.md') (Join-Path $package 'runtime/codex/AGENTS.md.fragment') '<!-- AI-ENGINEERING-OS -->'
  if (-not (Test-Path (Join-Path $root 'PLANS.md'))) { Copy-Item (Join-Path $package 'runtime/codex/PLANS.md') (Join-Path $root 'PLANS.md') }
  Write-Host 'Codex adapter installed.'
}
New-Item -ItemType Directory -Force (Join-Path $root '.ai-engineering') | Out-Null
Write-Host "AI Engineering OS runtime integration completed for $Runtime at $root"

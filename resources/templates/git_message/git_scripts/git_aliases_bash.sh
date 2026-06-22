#!/bin/bash
set -euo pipefail

if ! command -v git >/dev/null 2>&1; then
  printf '%s\n' "ERROR: git doesn't installed on the system" >&2
fi

declare -A aliases=(
  [br]="branch"
  [p]="push"
  [m]="merge"
  [lg]="log"
  [df]="diff"
  [stx]="stash"
  [rb]="rebase"
  [rs]="reset"
  [cfg]="config"
)

for k in "${!aliases[@]}"; do
  git config --global "alias.${k}" "${aliases[$k]}"
done

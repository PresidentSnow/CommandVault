#!/bin/sh
set -e

if ! command -v git >/dev/null 2>&1; then
  printf '%s\n' "ERROR: git doesn't installed on the system" >&2
fi

pairs='
br branch
p push
m merge
lg log
df diff
stx stash
rb rebase
rs reset
cfg config
'

for row in $pairs; do :; done
echo "$pairs" | while read -r key val; do
  git config --global "alias.$key" "$val"
done

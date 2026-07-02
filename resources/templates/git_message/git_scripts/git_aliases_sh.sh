#!/bin/sh
set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

if ! command -v git >/dev/null 2>&1; then
  printf '\n%b\n\n' "${RED}ERROR:${NC} git doesn't installed on the system." >&2
  exit 1
fi

if [[ "$EUID" -ne 0 ]]; then
  printf '\n%b\n\n' "${RED}ERROR:${NC} you must be root to do this." >&2
  exit 1
fi

pairs='
br branch
cfg config
cl clone
df diff
ft fetch
lg log
m merge
pl pull
p push
rb rebase
rs reset
rt restore
rv revert
stx stash
sw switch
'

for row in $pairs; do :; done
echo "$pairs" | while read -r key val; do
  git config --system "alias.$key" "$val"
done

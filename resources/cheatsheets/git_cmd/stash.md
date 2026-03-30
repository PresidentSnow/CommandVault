# STASH CMD

## Help

* git help stash

## List and show

* git stash (stx) list: list the modifications stashed.
* git stash (stx) show: inspects the modifications stashed.
  * git stash (stx) show -u | --include-untracked | --only-untracked

## Remove/delete and clean

* git stash (stx) drop: remove/delete an specific stash.
  * git stash (stx) drop -q | --quiet
* git stash (stx) clear: clear all modifications stashed.

## Apply and extract

* git stash (stx) pop
  * git stash (stx) pop -q | --quiet
* git stash (stx) apply
  * git stash (stx) apply -q | --quiet

## Save changes

* git stash (stx) push -p | --patch
* git stash (stx) push -m | --message: save with a message
* git stash (stx) push -k | --keep-index: don't touch the index
* git stash (stx) push -u | --include-untracked
* git stash (stx) push -a | --all (include also ignored)

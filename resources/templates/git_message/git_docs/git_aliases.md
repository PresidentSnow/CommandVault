# GIT CONFIG

* **ORIGINAL DATE:** 2026/02/02

* alias.lg=log
* alias.df=diff
* alias.ft=fetch
* alias.p=push
* alias.tg=tag
* alias.m=merge
* alias.sw=switch
* alias.pl=pull
* alias.ci=commit
* alias.cl=clone
* alias.rv=revert
* alias.rt=restore
* alias.rs=reset
* alias.rb=rebase
* alias.rmt=remote
* alias.stx=stash
* alias.cfg=config
* alias.br=branch
* alias.st=status
* alias.co=checkout
* user.name=[username]
* user.mail=[mail]@gmail.com
* core.editor=code
* init.defaultbranch=main
* color.ui=true

## To set up this, execute

* git config --global core.editor "code --wait"

* git config --local alias.ci commit

* git config --system alias.sw switch

## For undo one of them

* git config --unset alias.ci (for example)

* git config --global --unset alias.co

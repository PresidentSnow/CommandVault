# GIT DIFF

## SEE THE DIFFERENCE IN COMMITS BETWEEN BRANCHES

* Assuming that the branches are *main* and *testing*.

* Commits on *testing* that are not in *main*:  git log --oneline main..testing

* Commits on *main* that are not in *testing*: git log --oneline testing..main

* All commits that are in either but not shared (shows both sides): git log --oneline --left-right --cherry-pick main...testing

* Visual graph of the relationship: git log --graph --oneline main...testing

* The difference between ".." and "...":
  * main..testing means: reachable from *testing* but not from *main* (testing-only).
  * main...testing means: all commits reachable from either side, excluding commits reachable from both.

## VIEW THE DIFF IN AN SPECIFIC FILE

* git diff -- path/to/file
* git diff --staged -- path/to/file
* git diff HEAD -- /path/to/file

# Git

## Configuration

```bash
git config --global user.email "me@example.com"
git config --global user.name "MyName"
```

## Discard uncommited changes

```bash
git reset --hard HEAD
```

## Rename master branch to main

```
# rename local master
git branch --move master main
# create new remote main branch
git push --set-upstream origin main
# delete remote master
git push origin --delete master
```

If master delete fails, may need to redefine default branch on remote hosting platform.

## Restore single file

```
git restore <filename>
```

## Squash all commits on branch

```
git checkout development_branch
git reset --soft main
git add --all
git commit -m "Genius, first try effort"
```

# Git

## Configuration

```bash
git config --global user.email "me@example.com"
git config --global user.name "MyName"
```

## Discard uncommitted changes

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

## Shallow Clone Specific Branch/Tag/SHA/HEAD

Clone only works with tag/branch but not commit id, so have to use this workaround, which does all three.
The server has to be configured with `uploadpack.allowReachableSHA1InWant=true`, to query on SHA -GitHub currently enables this.
Taken from [StackOverflow](https://stackoverflow.com/questions/31278902/how-to-shallow-clone-a-specific-commit-with-depth-1/43136160#43136160)

```shell
git init
git remote add origin <url>
git fetch --depth 1 origin <sha1>
git checkout FETCH_HEAD
```

## Private Github Access

~/.ssh/config
```
Host github.com
    HostName github.com
    User sweet_username
    IdentityFile ~/.ssh/github_private_keyfile
    PreferredAuthentications publickey
```

Confirm SSH is working: `ssh -T git@github.com`

Future clones: `ssh://git@github.com/repo/repo.git`

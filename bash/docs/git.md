# GIT

### Git hooks
#### 1. Predefined events
* applypatch-msg
* commit-msg
* post-update
* pre-applypatch
* pre-commit
* pre-merge-commit
* pre-push
* pre-rebase
* prepare-commit-msg
* update

#### 2. Example ( print last commit before push )
Change directory to git hooks folder:
```
cd /path/to/your/repo/.git/hooks
```

Create new file:
```
touch pre-push
chmod +x pre-push
```

`pre-push` content:
```
#!/bin/sh

# Get the last commit message
last_commit_message=$(git log -1 --pretty=format:"%h - %s")

# Print the last commit message
echo "Last commit before push: $last_commit_message"

# Continue with the push
exit 0
```

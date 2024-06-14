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

### Codecommit [ git-remote-codecommit ]
#### 1. Installation
Unix:
```
sudo pip install git-remote-codecommit
```

Window:
```
pip install --user git-remote-codecommit
```
 
#### 2. Download codecommit repository
Same region as profile configuration:
```
git clone codecommit://MyDemoRepo my-demo-repo
```

Different region as profile configuration:
```
git clone codecommit::ap-northeast-1://MyDemoRepo my-demo-repo
```

With profile configuration:
```
git clone codecommit://CodeCommitProfile@MyDemoRepo my-demo-repo
```

### Git merge tools
#### 1. vimdiff
* Git's default merge tool, using the command-line interface.
* Simple and effective for straightforward merges.

#### 2. meld
A graphical tool that provides a three-way comparison and merging.
Available on Linux and Windows.

#### 3. kdiff3
* A cross-platform tool that supports three-way merges.
* Provides a graphical interface for resolving conflicts.

#### 4. diffmerge
* A visual file comparison and merge tool.
* Cross-platform and integrates well with Git

#### 5. p4merge
* A merge tool from Perforce, providing a graphical interface.
* Free and supports complex merging scenarios.

#### 6. tortoisegitmerge
* Part of the TortoiseGit suite, provides a graphical merge tool for Windows.
* Intuitive interface for resolving conflicts

#### 7. araxis
* A professional merge and comparison tool, available on Windows and macOS.
* Paid software with advanced features

#### 8. bc
* A powerful comparison tool that supports file and directory comparisons.
* Available on Windows, macOS, and Linux (requires a license).

#### 9. opendiff
* A graphical merge tool for macOS, part of the Xcode developer tools.
* Integrates well with the macOS environment

#### 10. emerge
* An Emacs-based merge tool for users who prefer Emacs.
* Provides a text-based interface within Emacs


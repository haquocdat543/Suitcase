# GIT DELTA

### 1. Installation
### 2. Configuration

$HOME/.gitconfig
```
[init]
    defaultBranch = master
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    side-by-side = true
    line-numbers = true
```

lazygit:
```
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
```

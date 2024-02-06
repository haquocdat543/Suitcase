# Suitcase
This is my toolbox for speed up workloads
## 1. Linux

###   1. Bash alias
Install bash aliases ( k8s, ansible, git, terraform, docker,... )

```
alias up1='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/scripts/alias.sh )'
up1
```

You can view my [aliases](https://github.com/haquocdat543/Suitcase/blob/main/bash/configs/.bashrc)
###   2. Vim
Vim configuration file:
```
alias up2='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/scripts/vimconfig.sh )'
up2
```

You can view my [.vimrc](https://github.com/haquocdat543/Suitcase/blob/main/bash/configs/.vimrc), [init.vim](https://github.com/haquocdat543/Suitcase/blob/main/bash/configs/init.vim), [init.lua](https://github.com/haquocdat543/Suitcase/blob/main/bash/configs/init.lua)

##   3. Tmux
```
alias up3='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/scripts/tmuxconfig.sh )'
up3
```
You can view my [.tmux.conf](https://github.com/haquocdat543/Suitcase/blob/main/bash/configs/.tmux.conf)


##   4. Emacs
```
alias up4='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/scripts/emacsconfig.sh )'
up4
```
You can view my [init.el](https://github.com/haquocdat543/Suitcase/blob/main/bash/configs/init.el)

##   2. Windows
```
curl -L -o %USERPROFILE%/Desktop/setup.bat https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/setup.bat
```
After execute, run setup.bat on `Desktop`
##   3. Snippets
These snippets use `Vim Ultisnips` plugin

You can view my [Snippets](https://github.com/haquocdat543/Suitcase/blob/main/snippets)
* all.snippets : miscellaneous
* yaml.snippets : k8s, ansible, helm
* tf.snippets : terraform
* tex.snippets : Latex
* markdown.snippets : Markdown file ( `*.md` )
* sh.snippets : bash shell
* ...
## 4. Scripts
You can view all of my [bash scripts](https://github.com/haquocdat543/Suitcase/blob/main/bash/commands)

It include scripts to install ( lazygit, k9s, nvim, python, ansible, k8s,...) and other functional scripts
## 5. Install common tools
After install `bash aliases`
```
upsss ; iness
```

## 5. Destroy
To destroy all. Run:
```
dall
```

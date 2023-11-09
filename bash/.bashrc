### User specific aliases and functions

alias rm='rm -f'
alias cp='cp -rf'
alias mv='mv -f'

### Tmux command

alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmr='tmux rename-session -t'
alias tmn='tmux new -s'
alias tmk='tmux kill-session -t'
alias tms='tmux source ~/.tmux.conf'

### Emacs command
alias em='emacs'
alias emq='emacs -q'
alias emel='emacs -q ~/init.el'

### Linux command

alias mb='make build'
alias ps11='export PS1="\e[0;36m\u@\h \W\$\e[0m"'
alias ps12='export PS1="\u@\H >"  \u: haquocdat, \H: aws, @: $'
alias upn='plug ; yg ; yn ; cm ; sn'
alias ups='plug ; yg ; yn ; gceh ; gcnh ; cm ; sn ; ed400 ; up2 ; rv ; up3 ; rtm'
alias doom='git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs ; ~/.config/emacs/bin/doom install'
alias proj='nigv ; vue create frontend ; cd frontend ; axios ; md src/services ; md src/routes ; mv src/components/HelloWorld.vue src/components/winners.vue ; touch src/routes/index.js ; touch src/services/Api.js ; touch src/services/winners.js ; cd - ; md server ; md server/src ; md server/src/models ; md server/src/routes ; cd server ; touch src/app.js ; touch src/models/winners.js ; touch src/routes/winners.js ; npmi ; mevn ; cd -'
alias proj2='nigv ; vue create frontend ; cd frontend ; axios ; md src/services ; md src/routes ; mv src/components/HelloWorld.vue src/components/winners.vue ; touch src/routes/index.js ; touch src/services/Api.js ; touch src/services/winners.js ; cd - ; md server ; md server/src ; md server/src/models ; md server/src/routes ; cd server ; touch src/app.js ; touch src/models/winners.js ; touch src/routes/winners.js ; npmi ; pevn ; cd -'
alias m='make'
alias vuecf='vue create frontend'
alias virm='vi README.md'
alias vimc='vi main.c'
alias ll='ls -la'
alias lr='ll ~'
alias lll='ll /'
alias lp='netstat -lnp'
alias fk='fuser -k'
alias lbk='ll ~/preconfig/backup'
alias cdl='cd /'
alias cdcm='cd ~/Suitcase/bash/commands'
alias cddoc='cd ~/Suitcase/bash/docs'
alias cdsb='cd ~/Suitcase/bash'
alias cdsn='cd ~/Suitcase/snippets'
alias lh='ll /home'
alias cdh='cd /home'
alias cdb='cd /bin'
alias letc='ll /etc'

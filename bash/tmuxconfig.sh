#!/bin/bash
yum install -y tmux
apt install -y tmux
if [ ! -d ~/.tmux ]
then
	mkdir ~/.tmux
fi
if [ ! -d ~/.tmux/plugins ]
then
	mkdir ~/.tmux/plugins
fi
if [ ! -f ~/.tmux/plugins/tpm ]
then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

### This is configuration for .tmux file
## If the run.sh file in preconfig folder exist. Delete
if [ -f ~/preconfig/tmux.sh ]
then
	rm ~/preconfig/tmux.sh
fi
## If the .tmux file in preconfig folder exist. Delete
if [ -f ~/preconfig/.tmux.conf ]
then
	rm ~/preconfig/.tmux.conf
fi
## Write content to run.sh file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/tmux.sh
#!/bin/bash

## If pretmux already exist. Delete it
if [ -f ~/preconfig/pretmux ]
then
	rm ~/preconfig/pretmux
fi

## If .tmux in root foleder does not exist. Create it
if [ ! -f ~/.tmux.conf ]
then
	touch ~/.tmux.conf
fi

## If .tmux.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/.tmux.conf.backup ]
then
	cp ~/.tmux.conf ~/preconfig/backup/.tmux.conf.backup 
fi
## move .tmux to pretmux file in preconfig folder
mv ~/.tmux.conf ~/preconfig/pretmux

## move .tmux in preconfig folder to root folder
mv ~/preconfig/.tmux.conf ~/.tmux.conf

EOF
## Write content to .tmux file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/.tmux.conf
bind-key a command-prompt -p "window name:" "new-window; rename-window '%%'"
bind-key v command-prompt -p "session name:" "new-session; rename-session '%%'"
set -g default-terminal 'screen-256color'
set -g base-index 1

unbind r
bind r source-file ~/.tmux.conf

setw -g mode-keys vi
bind-key h select-pane -L
bind-key l select-pane -R
bind-key k select-pane -U
bind-key j select-pane -D

set -g history-limit 1000000
set -g renumber-windows on
set -g detach-on-destroy off
set -g set-clipboard on

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'dracula/tmux'
set -g @plugin 'sainnhe/tmux-fzf'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'
# set -g @plugin "janoamaral/tokyo-night-tmux"

set -g @dracula-show-powerline true
set -g @dracula-fixed-location "SaiGon"
set -g @dracula-plugins "weather"
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session

run '~/.tmux/plugins/tpm/tpm'

EOF

clear

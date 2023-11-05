#!/bin/bash
ytm
ai tmux
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

unbind r
bind r source-file ~/.tmux.conf

set -g prefix C-s

setw -g mode-keys vi
bind-key h select-pane -L
bind-key l select-pane -R
bind-key k select-pane -U
bind-key j select-pane -D

set -g @plugin 'tmux-plug/tpm'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'dracula/tmux'

set -g @dracula-show-powerline true
set -g @dracula-fixed-location "SaiGon"
set -g @dracula-plugins "weather"
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session
set -g status-position top

run '~/.tmux/plugins/tpm/tpm'

EOF

clear

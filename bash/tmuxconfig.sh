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
set -g status-left "#[fg=blue,bold,bg=#1e1e2e]  #S  "
set -g status-right "#[fg=#b4befe,bold,bg=#1e1e2e]%a %Y-%m-%d 󱑒 %l:%M %p"
set -ga status-right "#(\$HOME/.config/tmux/scripts/cal.sh)"
set -g status-justify left
set -g status-left-length 200    # increase length (from 10)
set -g status-right-length 200    # increase length (from 10)
set -g status-position top       # macOS / darwin style
set -g status-style 'bg=#1e1e2e' # transparent
set -g window-status-current-format '#[fg=magenta,bg=#1e1e2e]*#I #W#{?window_zoomed_flag,(),} '
set -g window-status-format '#[fg=gray,bg=#1e1e2e] #I #W'
set -g window-status-last-style 'fg=white,bg=black'
set -g default-terminal "\${TERM}"
set -g message-command-style bg=default,fg=yellow
set -g message-style bg=default,fg=yellow
set -g mode-style bg=default,fg=yellow
setw -g mode-keys vi
set -g pane-active-border-style 'fg=magenta,bg=default'
set -g pane-border-style 'fg=brightblack,bg=default'

set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
set -g @fzf-url-history-limit '2000'
set -g @t-bind 'K'
set -g @t-fzf-find-binding 'ctrl-l:change-prompt(  )+reload(fd -H -d 2 -t d -E .Trash . ~)'
set -g @t-fzf-prompt '  '
set -g @tmux-last-color on
set -g @tmux-last-pager 'less -r'
set -g @tmux-last-pager 'less'
set -g @tmux-last-prompt-pattern ' '
set -g @tmux-nerd-font-window-name-shell-icon ''
set -g @tmux-nerd-font-window-name-show-name false

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'christoomey/vim-tmux-navigator'
# set -g @plugin 'dracula/tmux'
set -g @plugin 'sainnhe/tmux-fzf'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'
# set -g @plugin "janoamaral/tokyo-night-tmux"

# set -g @dracula-show-powerline true
# set -g @dracula-fixed-location "SaiGon"
# set -g @dracula-plugins "weather"
# set -g @dracula-show-flags true
# set -g @dracula-show-left-icon session

run '~/.tmux/plugins/tpm/tpm'

EOF

clear

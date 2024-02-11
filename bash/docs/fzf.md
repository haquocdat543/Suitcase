## Preview
Add following command to `.bashrc`
```
export FZF_CTRL_T_OPTS="--preview='bat --theme=Dracula --style=numbers --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias pf="fzf ${FZF_CTRL_T_OPTS}"
```



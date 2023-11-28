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
alias mn='cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo'
alias mb='make build'
alias mi='sudo make install'
alias ps11='export PS1="\e[0;36m\u@\h \W\$\e[0m"'
alias ps12='export PS1="\u@\H >"  \u: haquocdat, \H: aws, @: $'
alias upn='plug ; yg ; yn ; cm ; sn'
alias upu='. ~/preconfig/Suitcase/bash/commands/copySuitcase.sh'
alias ups='plug ; yn ; gceh ; gcnh ; cm ; sn ; ed400 ; up2 ; rv ; up3 ; rtm'
alias upss='plug ; yn ; gceh ; gcnh ; cm ; sn ; ed400 ; up2 ; rv ; up3 ; rtm ; invim ; ipip ; ipynvim ; plug2 ; up5 ; rnv '
alias upsss='plug ; yn ; gceh ; gcnh ; cm ; sn ; ed400 ; up2 ; rv ; up3 ; rtm ; invim ; ipip ; ipynvim ; plug2 ; up5 ; rnv ; up6 ; swl'
alias doom='git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs ; ~/.config/emacs/bin/doom install'
alias spacemacs='git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d'
alias proj='nigv ; vue create frontend ; cd frontend ; axios ; md src/services ; md src/routes ; mv src/components/HelloWorld.vue src/components/winners.vue ; touch src/routes/index.js ; touch src/services/Api.js ; touch src/services/winners.js ; cd - ; md server ; md server/src ; md server/src/models ; md server/src/routes ; cd server ; touch src/app.js ; touch src/models/winners.js ; touch src/routes/winners.js ; npmi ; mevn ; cd -'
alias proj2='nigv ; vue create frontend ; cd frontend ; axios ; md src/services ; md src/routes ; mv src/components/HelloWorld.vue src/components/winners.vue ; touch src/routes/index.js ; touch src/services/Api.js ; touch src/services/winners.js ; cd - ; md server ; md server/src ; md server/src/models ; md server/src/routes ; cd server ; touch src/app.js ; touch src/models/winners.js ; touch src/routes/winners.js ; npmi ; pevn ; cd -'
alias m='make'
alias vuecf='vue create frontend'
alias virm='vi README.md'
alias vimc='vi main.c'
alias ll='ls -la'
alias lr='ll ~'
alias lll='ll /'
alias llg='. ~/preconfig/Suitcase/bash/commands/llg.sh'
alias lp='netstat -lnp'
alias fk='fuser -k'
alias lbk='ll ~/preconfig/backup'
alias cdl='cd /'
alias cdcm='cd ~/Suitcase/bash/commands'
alias cddoc='cd ~/Suitcase/bash/docs'
alias cdsb='cd ~/Suitcase/bash'
alias cdcn='cd ~/.config/nvim'
alias cdp='cd ~/preconfig'
alias cdpr='cd ~/preconfig'
alias cdsn='cd ~/Suitcase/snippets'
alias cdw='cd ~/Suitcase/windows'
alias lh='ll /home'
alias cdh='cd /home'
alias cdb='cd /bin'
alias cdbin='cd /usr/local/bin'
alias letc='ll /etc'
alias cdetc='cd /etc'
alias cdpcfg='cd ~/preconfig'
alias lbin='ll /usr/local/bin'
alias lrp='ll /etc/yum.repos.d'
alias cdrp='cd /etc/yum.repos.d'
alias md='mkdir'
alias rf='rm -rf'
alias rfa='rm -rf *'
alias rfaa='rm -rf * .*'
alias rm='rm -f'
alias rma='rm -f *'
alias rmaa='rm -f * *.'
alias tarx='tar -xvzf'
alias hoi='hostname -i'
alias hos='hostname -s'
alias hs='hostnamectl status'
alias exp='openssl x509 -noout -text -in'
alias etcdbk='ECTDCTL_API=3 etcdctl'
alias histf='export HISTTIMEFORMAT="%F %T "'
alias hi='history'
alias dhis='rm ~/.bash_history'
alias hz='hi | tail -n 10'
alias h2='hi | tail -n 20'
alias cl='clear'
alias cb='cd -' 
alias cq='cd ..' 
alias cq2='cd ../..' 
alias cq3='cd ../../..' 
alias ..='cd ..'
alias ...='cd ../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'
alias vi="vi"
alias vnv="vi ~/.config/nvim/init.vim"
alias vil="vi ~/.config/nvim/init.lua"
alias vilk="vi ~/Suitcase/bash/link.txt"
alias plug2="sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
alias plug="curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
alias packer="git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
alias plugin2='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
alias plugin='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
alias eag='. ~/preconfig/Suitcase/bash/commands/eag.sh'
alias ag='ag --hidden'
alias viz='vi ~/.zshrc'
alias val='vi ~/.bashrc'
alias vac='vi ~/Suitcase/windows/alias.cmd'
alias vws='vi ~/Suitcase/windows/setup.bat'
alias vicp='vi ./docker-compose.yaml'
alias vidk='vi ./Dockerfile'
alias vbbk='vi ~/preconfig/backup/.bashrc.backup'
alias vvbk='vi ~/preconfig/backup/.vimrc.backup'
alias vtbk='vi ~/preconfig/backup/.tmux.conf.backup'
alias vrc='vi ~/.vimrc'
alias vtm='vi ~/.tmux.conf'
alias viy='vi *.yaml'
alias vee='vi ~/init.el'
alias va='vi ~/Suitcase/bash/.bashrc'
alias vipj='vi package.json'
alias vdel='vi delete.sh'
alias vdel2='vi delete2.sh'
alias vdel3='vi delete3.sh'
alias vvc='vi ~/Suitcase/bash/.vimrc'
alias vnc='vi ~/Suitcase/bash/init.vim'
alias vtc='vi ~/Suitcase/bash/.tmux.conf'
alias swl='.  ~/preconfig/Suitcase/bash/commands/switch.sh'
alias vlc='vi ~/Suitcase/bash/init.lua'
alias vec='vi init.el'
alias vrcu='vi ~/preconfig/.vimrc'
alias vrco='vi ~/preconfig/previmrc'
alias vtmu='vi ~/preconfig/.tmux.conf'
alias vtmo='vi ~/preconfig/pretmux'
alias veeu='vi ~/preconfig/init.el'
alias veeo='vi ~/preconfig/preinitel'
alias viid='vi ~/.ssh/id_ed25519'
alias vrsa='vi ~/.ssh/id_rsa'
alias viah='vi /etc/ansible/hosts'
alias viacf='vi /etc/ansible/ansible.cfg'
alias visu='vi /etc/sudoers'
alias asudo='. ~/preconfig/Suitcase/bash/commands/addSudoers.sh'
alias vissh='vi /etc/ssh/sshd_config'
alias ssha='eval $(ssh-agent) && ssh-add'
alias vmc='vi ./main.c'
alias vmf='vi ./Makefile'
alias vimt='vi main.tf'
alias viva='vi variables.tf'
alias ed400='c400 ~/.ssh/id_ed25519'
alias eb='exec bash'
alias cos='cat /etc/os-release'
alias catak='cat ~/.ssh/authorized_keys'
alias rsapr='cat ~/.ssh/id_rsa'
alias rsapu='cat ~/.ssh/id_rsa.pub'
alias cpass='cat /etc/passwd'
alias lssh='ll /root/.ssh'
alias rn='route -n'
alias ir='ip route'
alias ex='exit'
alias 25519del='rm -f  ~/.ssh/id_ed25519*'
alias 25519gen='ssh-keygen -t ed25519 -C'
alias 25519pu='cat ~/.ssh/id_ed25519.pub'
alias 25519pr='cat ~/.ssh/id_ed25519'
alias kg='ssh-keygen'
alias kgrsa='ssh-keygen -t rsa'
alias sshci='. ~/preconfig/Suitcase/bash/commands/sshCopyId.sh'
alias rv='. ~/preconfig/run.sh'
alias rnv='. ~/preconfig/nvim.sh'
alias rnl='. ~/preconfig/lua.sh'
alias rtm='. ~/preconfig/tmux.sh'
alias rem='. ~/preconfig/emacs.sh'
alias sn='. ~/preconfig/commands/snippets.sh'
alias rr='. ~/.bashrc'
alias b0='cp -f ~/.bashrc ~/.bashrc~'
alias b1='rm ~/.bashrc'
alias b2='cp -f  ~/.bashrc~ ~/.bashrc'
alias cdssh='cd /root/.ssh'
alias c400='chmod 400'
alias c200='chmod 200'
alias c300='chmod 300'
alias c600='chmod 600'
alias c700='chmod 700'
alias c500='chmod 500'
alias c100='chmod 100'
alias c777='chmod 777'
alias upz='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/zsh.sh )'
alias up1='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/alias.sh )'
alias up2='. ~/preconfig/Suitcase/bash/vimconfig.sh'
alias up3='. ~/preconfig/Suitcase/bash/tmuxconfig.sh'
alias up4='. ~/preconfig/Suitcase/bash/emacsconfig.sh'
alias up5='. ~/preconfig/Suitcase/bash/nvimconfig.sh'
alias up6='. ~/preconfig/Suitcase/bash/luaconfig.sh'
alias s6s='swl ; up6 ; swl'
alias dall='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/delete.sh)'
alias dall2='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/delete2.sh)'
alias dall3='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/delete3.sh)'
alias mu='. ~/preconfig/Suitcase/bash/master-ubuntu.sh'
alias mc='. ~/preconfig/Suitcase/bash/master-ubuntu.sh'
alias wu='. ~/preconfig/Suitcase/bash/master-ubuntu.sh'
alias wc='. ~/preconfig/Suitcase/bash/master-ubuntu.sh'
alias mnode='. ~/preconfig/Suitcase/bash/k8s-ami.sh'


### Documentation
alias dock8s='vi -r ~/preconfig/Suitcase/bash/docs/dock8s.md'

### Installation
alias igo='. ~/preconfig/Suitcase/bash/commands/goInstall.sh'
alias ifzf='git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ;~/.fzf/install'
alias ieksctl='. ~/preconfig/Suitcase/bash/commands/eksctlInstall.sh'
alias ikubectl='. ~/preconfig/Suitcase/bash/commands/kubectlInstall.sh'
alias ilg='. ~/preconfig/Suitcase/bash/commands/lazygit.sh'
alias ilk='. ~/preconfig/Suitcase/bash/commands/lazykubernetes.sh'
alias ild='. ~/preconfig/Suitcase/bash/commands/lazydocker.sh'
alias ik9s='. ~/preconfig/Suitcase/bash/commands/k9s.sh'
alias iag='. ~/preconfig/Suitcase/bash/commands/agInstall.sh'
alias invim='. ~/preconfig/Suitcase/bash/commands/nvimInstall.sh'
alias ipip='cd ; wget https://bootstrap.pypa.io/get-pip.py ; python3 get-pip.py ; cb'
alias ipynvim='python3 -m pip install --upgrade pynvim'
alias ikubectl='. ~/preconfig/Suitcase/bash/commands/kubectl.sh'
alias irg='. ~/preconfig/Suitcase/bash/commands/ripgrep.sh'
alias ibrew='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
alias icargo='curl https://sh.rustup.rs -sSf | sh ; source "\$HOME/.cargo/env"'
alias icabal='. ~/preconfig/Suitcase/bash/commands/cabalInstall.sh'
alias ikustomize='. ~/preconfig/Suitcase/bash/commands/kustomizeInstall.sh'
alias ikus='. ~/preconfig/Suitcase/bash/commands/kustomizeInstall.sh'
alias yzsh='yum install -y zsh'
alias iohmyzsh='sudo curl -L http://install.ohmyz.sh | sh'
alias izellij='. ~/preconfig/Suitcase/bash/commands/zellijInstall.sh'
alias ihelm='. ~/preconfig/Suitcase/bash/commands/helmInstall.sh'
alias ikitty='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias o1='cd ; git clone https://github.com/gpakosz/.tmux.git ; ln -s -f .tmux/.tmux.conf ; cp .tmux/.tmux.conf.local .'
alias idk='yd ; sd ; ed'

alias lg='lazygit'
alias ldk='lazydocker'
alias lk='lazykubernetes'
alias lnpm='lazynpm'
alias lcli='lazycli'

### AWS command
alias a2c='aws configure'
alias a2cl='aws configure list'
alias a2ec2ti='aws ec2 terminate-instances --instance-ids'
alias a2ec2tic='aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running --output text)'
alias a2ec2li='aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running --output text'
alias a2ec2di='aws ec2 describe-instances'
alias a2s3lb='aws s3api list-buckets'
alias a2s3cb='aws s3api create-bucket --bucket'
alias a2s3db='aws s3api delete-bucket --bucket'
alias a2clmd='. ~/preconfig/Suitcase/bash/commands/clmDeploy.sh'
alias a2clmds='aws cloudformation delete-stack --stack-name'
alias a2clmli='aws cloudformation describe-stacks'
alias a2clmo='aws cloudformation describe-stacks --query Stacks[].Outputs[*].[OutputKey,OutputValue] --output text'
alias a2eksuk='aws eks update-kubeconfig --name'
alias a2rdsci='. ~/preconfig/Suitcase/bash/commands/rds.sh'
alias a2rdsdi='aws rds delete-db-instance --db-instance-identifier'
alias a2rdsli='aws rds describe-db-instances'
alias a2rdslii='aws rds describe-db-instances | grep DBInstanceIdentifier'
alias a2eccc='. ~/preconfig/Suitcase/bash/commands/elasticache.sh'
alias a2ecli='aws elasticache describe-cache-clusters'
alias a2ecdc='aws elasticache delete-cache-cluster --cache-cluster-id'
alias a2iamlr='aws iam list-roles'
alias a2iamlp='aws iam list-policies'
alias a2iamls='aws iam list-users'
alias a2iamlg='aws iam list-groups'
alias a2lmdgf='aws lambda list-functions'
alias a2lmddf='aws lambda delete-function --function-name'
alias a2apigks='aws apigateway get-api-keys'
alias a2apigk='aws apigateway get-api-key --api-key'
alias a2ddblt='aws dynamodb list-tables'
alias a2ddbdt='aws dynamodb delete-table --table-name'
alias a2ccmlr='aws codecommit list-repositories'
alias a2ccmdr='aws codecommit delete-repository --repository-name'
alias a2cblp='aws codebuild list-projects'
alias a2cbdp='aws codebuild delete-project --project-name'
alias a2cdla='aws codedeploy list-applications'
alias a2cdld='aws codedeploy list-deployments'
alias a2cdda='aws codedeploy delete-application --application-name'
alias a2cpllp='aws codepipeline list-pipelines'
alias a2cpldp='aws codepipeline delete-pipeline --name'

### Github  command
alias ghal='gh auth login'
alias ghrl='gh repo list'
alias ghrc='gh repo create'
alias ghrv='gh repo view'
alias ghre='gh repo edit'

### Git command

alias vd='vimdiff'
alias gd='git diff'
alias gds='git diff --staged'
alias gi='git init'
alias gcl='git clone'
alias gcls='. ~/preconfig/Suitcase/bash/commands/githubSshClone.sh'
alias gclh='. ~/preconfig/Suitcase/bash/commands/githubHttpClone.sh'
alias gcld='git clone --depth 1'
alias gT='git clone git@github.com:haquocdat543/Terraform.git ~/Terraform'
alias gS='git clone git@github.com:haquocdat543/Suitcase.git ~/Suitcase'
alias gA='git clone git@github.com:haquocdat543/ArgoCD.git ~/ArgoCD'
alias gL='git clone https://github.com/arismelachroinos/lscript.git ~/lscript'
alias gN='git clone https://github.com/Elteoremadebeethoven/nvim-config.git'
alias gnn='rm -rf ~/.config/nvim ; git clone https://github.com/Elteoremadebeethoven/nvim-config.git ~/.config/nvim'
alias gc='git commit -m'
alias gC='git commit -a'
alias gcu='git commit -m "Update"'
alias gt='git tag'
alias gta='git tag -a'
alias gtd='git tag -d'
## if you want to push all tags to repo use: git push <remote> <branch> --tags
## if you want to delete all tags to repo use: git push --delete <remote> <branch> --tags && git tag -d --tags
alias gs='git status'
alias ga='git add'
alias ga.='git add .'
alias gai='git add --ignore-removal .'
alias gaa='git add -A'
alias gap='git add --patch'
alias gac='gaa ; gc'
alias gau='git add -u'
alias gcp='git cherry-pick'
alias g1='git reset --soft HEAD~1'
alias g0='git reset --hard HEAD~1'
alias g2='git reset --'
alias g2a='git reset -- .'
alias g3='git restore --'
alias g4='git restore --source=HEAD'
alias g4a='git restore --source=HEAD .'
alias g5='git restore --source='
alias grv='git revert'
alias g6='git revert HEAD'
alias gct='git rev-list --count'
alias gca='git rev-list --count --all'
alias gco='git count-objects'
alias gcov='git count-objects -v'
alias gb='git branch'
alias gba='git branch -a'
alias gbm='git branch -M'
alias gbr='git branch move'
alias gbd='git branch -D'
alias gsw='git switch'
alias gcb='git checkout -b'
alias gck='git checkout'
alias gm='git merge'
alias grb='git rebase'
alias gl='git log'
alias glo='git log --oneline'
alias glo10='git log -n 10 --oneline'
alias gl10='git log -n 10'
alias glog='git log --oneline --graph'
alias glop="git log --graph --abbrev-commit --decorate --color --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ai%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%n'"
alias gp='git push'
alias gpu='git push -u'
alias gpod='git push origin --delete'
alias gpom='git push origin main'
alias gpomf='git push origin main -f'
alias scpkube='. ~/preconfig/Suitcase/bash/commands/scpkube.sh'
alias scpssh='. ~/preconfig/Suitcase/bash/commands/scpssh.sh'
alias cproot='. ~/preconfig/Suitcase/bash/commands/copyroot.sh'
alias gall='. ~/preconfig/Suitcase/bash/gitconfig/gitPushOriginMain.sh'
alias cmd='. ~/preconfig/Suitcase/bash/commands/cmd.sh'
alias cnt='. ~/preconfig/Suitcase/bash/commands/connect.sh'
alias nven='. ~/preconfig/Suitcase/bash/vimconfig/nvimen.sh'
alias ven='. ~/preconfig/Suitcase/bash/vimconfig/vimen.sh'
alias gr='git remote'
alias gpl='git pull'
alias gplom='git pull origin main'
alias gf='git fetch'
alias gra='git remote add'
alias gsl='git stash list'
alias gss='git stash save'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gssh='git stash show'
alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwp='git worktree prune'
alias gsma='git submodule add'
alias gsmu='git submodule update'
alias grm='git rm'
alias gcn='git config --global user.name'
alias gce='git config --global user.email'
alias gcprt='git config pull.rebase true'
alias gcprf='git config pull.rebase false'
alias gcpfo='git config pull.ff only'
alias gcnh='git config --global user.name "haquocdat543"'
alias gceh='git config --global user.email "wwwdatha543@gmail.com"'

### Ansible command
alias a1='ansible'
alias a1p='ansible-playbook'
alias a1pi='ansible-playbook -i'
alias a1cf='ansible-config'
alias a1cs='ansible-console'
alias an='ansible'
alias anp='ansible-playbook'
alias anpi='ansible-playbook -i'
alias ancf='ansible-config'
alias ancs='ansible-console'

### Vagrant command
alias vgi='vagrant init'
alias vgu='vagrant up'
alias vgd='vagrant destroy'
alias vgss='vagrant ssh'
alias vgsc='vagrant ssh-config'
alias vgs='vagrant status'

### Terraform command
alias tfc='. ~/preconfig/Suitcase/bash/commands/clean.sh'
alias tfi='terraform init'
alias tfs='terraform show'
alias tfp='terraform plan'
alias tfim='terraform import'
alias tflg='terraform login'
alias tfr='terraform refresh'
alias tfro='terraform apply -refresh-only'
alias tfa='terraform apply'
alias tfd='terraform deploy'
alias tfwl='terraform workspace list'
alias tfws='terraform workspace select'
alias tfwn='terraform workspace new'
alias tfaa='terraform apply --auto-approve'
alias tfda='terraform destroy --auto-approve'

### Docker command

alias do='docker'
alias dcp='docker-compose'
alias dl='docker logs'
alias dlg='docker login'
alias dnl='docker network ls'
alias dnc='docker network create'
alias dncn='docker network connect'
alias dpsn='docker ps -a -q'
alias dps='docker ps -a'
alias dc='docker commit'
alias dload='docker load -i'
alias dsave='docker save --output'
alias dvl='docker volume ls'
alias dvc='docker volume create'
alias dvr='docker volume rm'
alias dr='docker run'
alias drit='docker run -it'
alias dritrm='docker run -it --rm'
alias da='docker attach'
alias de='docker exec -it'
alias drm='docker rm -f'
alias dm='docker image'
alias dms='docker images'
alias dmr='docker image rm'
alias dpl='docker pull'
alias ds='docker search'
alias dnls='docker node ls'
alias dsps='docker service ps'
alias dsl='docker service ls'
alias dstl='docker stack ls'
alias dsc='docker service create'
alias dsr='docker service rm'
alias dsu='docker service update'
alias dstd='docker stack deploy -c'
alias dstdcp='docker stack deploy -c docker-compose.yaml'
alias dstr='docker stack rm'
alias db='docker build -f Dockerfile . -t'
alias dt='docker tag'
alias dlg='docker login'
alias dp='docker push'
alias dswi='docker swarm init --advertise-addr='
alias djm='docker swarm join-token manager'
alias djw='docker swarm join-token worker'

### Kubectl command
alias k='kubectl'
alias kp='kubectl proxy'
alias kl='kubectl label'
alias ks='kubectl scale'
alias kc='kubectl create'
alias ktn='kubectl taint node'
alias kco='kubectl cordon'
alias kuco='kubectl uncordon'
alias kdrain='kubectl drain'
alias kgtaint='kubectl describe node | grep Taint'
alias kgall='kubectl get all'
alias des='describe'
alias de='delete'
alias km='kubeadm'
alias kmtc='kubeadm token create'
alias kmjw='kubeadm token create --print-join-command'
alias kmcp='. ~/preconfig/Suitcase/bash/controlplaneCertificate/controlplaneCertificate.sh'
alias kmuc='kubeadm init phase upload-certs --upload-certs'
alias kx='kubectl exec -it'
alias kq='kubectl describe quota'
alias kgp='kubectl get pod'
alias kgn='kubectl get node'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kgcm='kubectl get configmap'
alias kgrc='kubectl get rc'
alias kgrs='kubectl get rs'
alias kgsts='kubectl get sts'
alias kgds='kubectl get ds'
alias kgsc='kubectl get secret'
alias kgc='kubectl get storageclasses'
alias kgpv='kubectl get pv'
alias kgpvc='kubectl get pvc'
alias kgr='kubectl get role'
alias kgrb='kubectl get rolebindings'
alias kgcr='kubectl get clusterroles'
alias kgcb='kubectl get clusterrolebindings'
alias kgi='kubectl get ingress'
alias kgr='kubectl get role'
alias kgnp='kubectl get networkpolicies'
alias kgsa='kubectl get serviceaccount'
alias kgpsp='kubectl get podsecuritypolicies'

alias kdesp='kubectl describe pod'
alias kdesn='kubectl describe node'
alias kdess='kubectl describe svc'
alias kdesd='kubectl describe deploy'
alias kdescm='kubectl describe configmap'
alias kdesrc='kubectl describe rc'
alias kdesrs='kubectl describe rs'
alias kdessts='kubectl describe sts'
alias kdesds='kubectl describe ds'
alias kdessc='kubectl describe secret'
alias kdesc='kubectl describe storageclasses'
alias kdespv='kubectl describe pv'
alias kdespvc='kubectl describe pvc'
alias kdesr='kubectl describe role'
alias kdesrb='kubectl describe rolebindings'
alias kdescr='kubectl describe clusterroles'
alias kdescb='kubectl describe clusterrolebindings'
alias kdesi='kubectl describe ingress'
alias kdesr='kubectl describe role'
alias kdesnp='kubectl describe networkpolicies'
alias kdessa='kubectl describe serviceaccount'
alias kdespsp='kubectl describe podsecuritypolicies'

alias kdp='kubectl delete pod'
alias kdn='kubectl delete node'
alias kds='kubectl delete svc'
alias kdd='kubectl delete deploy'
alias kdcm='kubectl delete configmap'
alias kdrc='kubectl delete rc'
alias kdrs='kubectl delete rs'
alias kdsts='kubectl delete sts'
alias kdds='kubectl delete ds'
alias kdsc='kubectl delete secret'
alias kdc='kubectl delete storageclasses'
alias kdpv='kubectl delete pv'
alias kdpvc='kubectl delete pvc'
alias kdr='kubectl delete role'
alias kdrb='kubectl delete rolebindings'
alias kdcr='kubectl delete clusterroles'
alias kdcb='kubectl delete clusterrolebindings'
alias kdi='kubectl delete ingress'
alias kdr='kubectl delete role'
alias kdnp='kubectl delete networkpolicies'
alias kdsa='kubectl delete serviceaccount'
alias kdpsp='kubectl delete podsecuritypolicy'

alias kpsci='. ~/preconfig/Suitcase/bash/servicePatch/clusterIP.sh'
alias kpslb='. ~/preconfig/Suitcase/bash/servicePatch/loadBalancer.sh'
alias kpsnp='. ~/preconfig/Suitcase/bash/servicePatch/nodePort.sh'
alias kpp='kubectl patch pod'
alias kpn='kubectl patch node'
alias kps='kubectl patch svc'
alias kpd='kubectl patch deploy'
alias kpcm='kubectl patch configmap'
alias kprc='kubectl patch rc'
alias kprs='kubectl patch rs'
alias kpsts='kubectl patch sts'
alias kpds='kubectl patch ds'
alias kpsc='kubectl patch secret'
alias kpc='kubectl patch storageclasses'
alias kppv='kubectl patch pv'
alias kppvc='kubectl patch pvc'
alias kpr='kubectl patch role'
alias kprb='kubectl patch rolebindings'
alias kpcr='kubectl patch clusterroles'
alias kpcb='kubectl patch clusterrolebindings'
alias kpi='kubectl patch ingress'
alias kpr='kubectl patch role'
alias kpnp='kubectl patch networkpolicies'
alias kpsa='kubectl patch serviceaccount'
alias kppsp='kubectl patch podsecuritypolicy'

alias kep='kubectl edit pod'
alias ken='kubectl edit node'
alias kes='kubectl edit svc'
alias ked='kubectl edit deploy'
alias kecm='kubectl edit configmap'
alias kerc='kubectl edit rc'
alias kers='kubectl edit rs'
alias kests='kubectl edit sts'
alias keds='kubectl edit ds'
alias kesc='kubectl edit secret'
alias kec='kubectl edit storageclass'
alias kepv='kubectl edit pv'
alias kepvc='kubectl edit pvc'
alias ker='kubectl edit role'
alias kerb='kubectl edit rolebindings'
alias kecr='kubectl edit clusterroles'
alias kecb='kubectl edit clusterrolebindings'
alias kei='kubectl edit ingress'
alias ker='kubectl edit role'
alias kenp='kubectl edit networkpolicy'
alias kesa='kubectl edit serviceaccount'
alias kepsp='kubectl edit podsecuritypolicy'

alias kge='kubectl get event'
alias ktn='kubectl taint node'

alias klg='kubectl logs'
alias kn='kubectl config set-context --current --namespace'
alias kgns='kubectl get namespace'
alias kgct='kubectl config get-contexts'
alias kr='kubectl run --dry-run=client -oyaml --image'
alias ka='kubectl apply -f'
alias kd='kubectl delete -f'

### Link command
alias lns='ln -s'
alias lnfs='ln -f -s'

### Helm command
alias hmra='helm repo add'
alias hmru='helm repo update'
alias hmi='helm install'
alias hmu='helm upgrade'

### Cron command
alias cre='crontab -e'
alias crl='crontab -l'
alias crr='crontab -r'

### Pip command
alias pi='pip install'
alias pians='pip install ansible'

### brew command
alias bi='brew install'

### user and group
alias ua='useradd'
alias pw='passwd'

### Other command
alias addas='. ~/preconfig/Suitcase/bash/commands/addAutoSuggest.sh'
alias addzsh='. ~/preconfig/Suitcase/bash/commands/addZshSource.sh'
alias setzsh='chsh -s $(which zsh)'
alias setbash='chsh -s $(which bash)'
alias s1='sudo su -'
alias s2='su - ec2-user'
alias yi='yum install -y'
alias ni='npm install'
alias nr='npm run'
alias nigy='npm install -g yarn'
alias nigv='ni -g @vue/cli'
alias yagav='yarn global add @vue/cli'
alias npmi='npm init -y'
alias mevn='npm install express mongoose body-parser cors --save'
alias pevn='npm install express pg body-parser cors --save'
alias axios='npm install axios --save'
alias npms='npm start'
alias npman='npm add -D nodemon'
alias npmnm='nodemon app.js'
alias yas='yarn serve'
alias yab='yarn build'
alias nrs='npm run serve'
alias nrb='npm run build'
alias yacc='yarn cache clean -f'
alias ncc='npm cache clean -f'
alias rfya='rm -rf node-modules package-lock.json'
alias yarnall='yacc && rfya && yarn && yas'
alias npmall='ncc && rfya && ni && nrs'
alias yu='yum update -y'
alias ai='apt install -y'
alias au='apt update -y'
alias se='systemctl enable'
alias ss='systemctl start'
alias srs='systemctl restart'
alias sst='systemctl status'
alias sd='systemctl disable'
alias yyu='yi yum-utils'
alias ymat='yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
alias ymagh='yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo'
alias yma='yum-config-manager --add-repo'
alias yme='yum-config-manager --enable'
alias darp='dnf config-manager --add-repo'
alias ynv='yum install -y neovim'
alias yt='yum install terraform -y'
alias ytm='yum install tmux -y'
alias yem='yum install emacs -y'
alias yd='yum install docker -y'
alias ylib2='sudo dnf -y install ninja-build cmake gcc make unzip gettext curl'
alias ylib='yum -y install pkgconfig automake gcc zlib-devel pcre-devel xz-devel'
alias ytool='yum -y groupinstall "Development Tools"'
alias yn='yum install nodejs -y'
alias ynpm='yum install npm -y' 
alias yg='yum install git -y'
alias yr='yum remove -y'
alias yu='yum update -y'
alias ygi='yum groupinstall -y'
alias ygr='yum groupremove -y'
alias ygu='yum groupupdate -y'
alias ygcc='yi gcc'
alias ycron='yum install -y cronie ; service crond start ; chkconfig cron on'
alias ad='ai docker.io'
alias ag='ai git'
alias agcc='ai gcc'
alias snd='snap install docker'
alias ed='systemctl enable docker'
alias sd='systemctl start docker'
alias chx='sudo chmod +x'
alias chxdc='sudo chmod +x /usr/local/bin/docker-compose'
alias idc='sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'

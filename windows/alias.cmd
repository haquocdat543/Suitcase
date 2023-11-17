@echo off

:: Temporary system path at cmd startup

set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"
@echo off

:: Temporary system path at cmd startup

set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"

:: Add to path by command

DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

:: Commands
DOSKEY a2c=aws configure
DOSKEY a2cl=aws configure list
DOSKEY a2ec2ti=aws ec2 terminate-instances --instance-ids
DOSKEY a2ec2tic=aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --query Reservations[*].Instances[*].[InstanceId] --filters Name=instance-state-name,Values=running --output text)
DOSKEY a2ec2li=aws ec2 describe-instances --query Reservations[*].Instances[*].[InstanceId] --filters Name=instance-state-name,Values=running --output text
DOSKEY a2ec2di=aws ec2 describe-instances
DOSKEY a2s3lb=aws s3api list-buckets
DOSKEY a2s3cb=aws s3api create-bucket --bucket
DOSKEY a2s3db=aws s3api delete-bucket --bucket
DOSKEY a2clmd=. ~/preconfig/commands/clmDeploy.sh
DOSKEY a2clmds=aws cloudformation delete-stack --stack-name
DOSKEY a2clmdes=aws cloudformation describe-stacks
DOSKEY a2clmo=aws cloudformation describe-stacks --query Stacks[].Outputs[*].[OutputKey,OutputValue] --output text
DOSKEY a2eksuk=aws eks update-kubeconfig --name

DOSKEY regbk=reg export HKCU %USERPROFILE%\preconfig\regbackup.reg /y
DOSKEY cddo=cd %USERPROFILE%\Downloads
DOSKEY cdde=cd %USERPROFILE%\Desktop
DOSKEY up1=curl -L -o %USERPROFILE%/Desktop/setup.bat https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/setup.bat
DOSKEY up2=%USERPROFILE%\Desktop\setup.bat
DOSKEY ups=up1 && up2 && plug
DOSKEY plug=curl -L -o %USERPROFILE%/vimfiles/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
DOSKEY cnt=%USERPROFILE%\Desktop\connect.bat
DOSKEY val=nvim %USERPROFILE%\alias.cmd
DOSKEY vrc=nvim %USERPROFILE%\init.vim
DOSKEY vtm=nvim %USERPROFILE%\.tmux.conf
DOSKEY cci=choco install 
DOSKEY ccg=choco install git -a
DOSKEY ccv=choco install neovim -a
DOSKEY cct=choco install tmux -a
DOSKEY cq=cd ..
DOSKEY md=mkdir
DOSKEY rm=rmdir
DOSKEY cl=cls
DOSKEY ls=dir /B $*
DOSKEY ll=dir 
DOSKEY atr=attrib -r
DOSKEY att=attrib
DOSKEY sublime=sublime_text $*
DOSKEY viid=nvim %USERPROFILE%\.ssh\id_ed25519

DOSKEY gi=git init
DOSKEY gcl=git clone
DOSKEY gT=git clone git@github.com:haquocdat543/Terraform.git
DOSKEY gS=git clone git@github.com:haquocdat543/Suitcase.git
DOSKEY gA=git clone git@github.com:haquocdat543/ArgoCD.git
DOSKEY gL=git clone https://github.com/arismelachroinos/lscript.git
DOSKEY gc=git commit -m
DOSKEY gcu=git commit -m "Update"
DOSKEY gt=git tag
DOSKEY gta=git tag -a
DOSKEY gtd=git tag -d
DOSKEY gs=git status
DOSKEY ga=git add
DOSKEY gaa=git add .
DOSKEY g1=git reset --soft HEAD~1
DOSKEY g0=git reset --hard HEAD~1
DOSKEY g2=git reset --
DOSKEY g3=git restore --
DOSKEY g4=git restore --source=HEAD
DOSKEY g5=git restore --source=
DOSKEY grv=git revert
DOSKEY g6=git revert HEAD
DOSKEY gct=git rev-list --count
DOSKEY gca=git rev-list --count --all
DOSKEY gco=git count-objects
DOSKEY gcov=git count-objects -v
DOSKEY gb=git branch
DOSKEY gbm=git branch -M
DOSKEY gbd=git branch -D
DOSKEY gsw=git switch
DOSKEY gcb=git checkout -b
DOSKEY gck=git checkout
DOSKEY gm=git merge
DOSKEY grb=git rebase
DOSKEY gl=git log
DOSKEY glo=git log --oneline
DOSKEY glo10=git log -n 10 --oneline
DOSKEY gl10=git log -n 10
DOSKEY glog=git log --oneline --graph
DOSKEY gp=git push
DOSKEY gpom=git push origin main
DOSKEY gpomf=git push origin main -f
DOSKEY gr=git remote
DOSKEY gpl=git pull
DOSKEY gplom=git pull origin main
DOSKEY gf=git fetch
DOSKEY gra=git remote add
DOSKEY gsl=git stash list
DOSKEY gss=git stash save
DOSKEY gsa=git stash save
DOSKEY gsd=git stash drop
DOSKEY gssh=git stash show
DOSKEY gwa=git worktree add
DOSKEY gsma=git submodule add
DOSKEY gcn=git config --global user.name
DOSKEY gce=git config --global user.email
DOSKEY gcprt=git config pull.rebase true
DOSKEY gcprf=git config pull.rebase false
DOSKEY gcpfo=git config pull.ff only
DOSKEY gcnh=git config --global user.name "haquocdat543"
DOSKEY gceh=git config --global user.email "wwwdatha543@gmail.com"
    ::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
DOSKEY gsp="C:\Program Files (x86)\Sketchpad5\GSP505en.exe"
DOSKEY DOSKEY=notepad %USERPROFILE%\Dropbox\DOSKEY.cmd

:: Common directories

DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"
DOSKEY research=cd %USERPROFILE%\Dropbox\Research\


:: Add to path by command

DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

:: Commands

DOSKEY cddo=cd %USERPROFILE%\Downloads
DOSKEY cdde=cd %USERPROFILE%\Desktop
DOSKEY up1=curl -L -o %USERPROFILE%/Desktop/setup.bat https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/setup.bat
DOSKEY up2=%USERPROFILE%\Desktop\setup.bat
DOSKEY ups=up1 && up2 && plug
DOSKEY plug=curl -L -o %USERPROFILE%/nvimfiles/autoload/plug.nvim https://raw.githubusercontent.com/junegunn/nvim-plug/master/plug.nvim
DOSKEY cnt=%USERPROFILE%\Desktop\connect.bat
DOSKEY val=nvim %USERPROFILE%\alias.cmd
DOSKEY vrc=nvim %USERPROFILE%\init.vim
DOSKEY vtm=nvim %USERPROFILE%\.tmux.conf
DOSKEY cci=choco install
DOSKEY ccg=choco install git -a
DOSKEY ccv=choco install nvim -a
DOSKEY cct=choco install tmux -a
DOSKEY cq=cd ..
DOSKEY md=mkdir
DOSKEY rm=rmdir
DOSKEY cl=cls
DOSKEY ls=dir /B $*
DOSKEY sublime=sublime_text $*  
DOSKEY viid=nvim %USERPROFILE%\.ssh\id_ed25519

DOSKEY gi=git init
DOSKEY gcl=git clone
DOSKEY gT=git clone git@github.com:haquocdat543/Terraform.git
DOSKEY gS=git clone git@github.com:haquocdat543/Suitcase.git
DOSKEY gA=git clone git@github.com:haquocdat543/ArgoCD.git
DOSKEY gL=git clone https://github.com/arismelachroinos/lscript.git
DOSKEY gc=git commit -m
DOSKEY gcu=git commit -m "Update"
DOSKEY gt=git tag
DOSKEY gta=git tag -a
DOSKEY gtd=git tag -d
DOSKEY gs=git status
DOSKEY ga=git add
DOSKEY gaa=git add .
DOSKEY g1=git reset --soft HEAD~1
DOSKEY g0=git reset --hard HEAD~1
DOSKEY g2=git reset --
DOSKEY g3=git restore --
DOSKEY g4=git restore --source=HEAD
DOSKEY g5=git restore --source=
DOSKEY grv=git revert
DOSKEY g6=git revert HEAD
DOSKEY gct=git rev-list --count
DOSKEY gca=git rev-list --count --all
DOSKEY gco=git count-objects
DOSKEY gcov=git count-objects -v
DOSKEY gb=git branch
DOSKEY gbm=git branch -M
DOSKEY gbd=git branch -D
DOSKEY gsw=git switch
DOSKEY gcb=git checkout -b
DOSKEY gck=git checkout
DOSKEY gm=git merge
DOSKEY grb=git rebase
DOSKEY gl=git log
DOSKEY glo=git log --oneline
DOSKEY glo10=git log -n 10 --oneline
DOSKEY gl10=git log -n 10
DOSKEY glog=git log --oneline --graph
DOSKEY gp=git push
DOSKEY gpom=git push origin main
DOSKEY gpomf=git push origin main -f
DOSKEY gr=git remote
DOSKEY gpl=git pull
DOSKEY gplom=git pull origin main
DOSKEY gf=git fetch
DOSKEY gra=git remote add
DOSKEY gsl=git stash list
DOSKEY gss=git stash save
DOSKEY gsa=git stash save
DOSKEY gsd=git stash drop
DOSKEY gssh=git stash show
DOSKEY gwa=git worktree add
DOSKEY gsma=git submodule add
DOSKEY gcn=git config --global user.name
DOSKEY gce=git config --global user.email
DOSKEY gcprt=git config pull.rebase true
DOSKEY gcprf=git config pull.rebase false
DOSKEY gcpfo=git config pull.ff only
DOSKEY gcnh=git config --global user.name "haquocdat543"
DOSKEY gceh=git config --global user.email "wwwdatha543@gmail.com"
    ::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
DOSKEY gsp="C:\Program Files (x86)\Sketchpad5\GSP505en.exe"
DOSKEY DOSKEY=notepad %USERPROFILE%\Dropbox\DOSKEY.cmd

:: Common directories

DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"
DOSKEY research=cd %USERPROFILE%\Dropbox\Research\


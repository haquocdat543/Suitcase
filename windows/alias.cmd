@echo off

:: Temporary system path at cmd startup

set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"

:: Add to path by command

DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

:: Commands

DOSKEY cddo=cd C:\Users\Admin\Downloads
DOSKEY cdde=cd C:\Users\Admin\Desktop
DOSKEY up1=curl -L -o %USERPROFILE%/Desktop/setup.bat https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/setup.bat
DOSKEY up2=C:\Users\Admin\Desktop\setup.bat
DOSKEY ups=up1 && up2 && plug
DOSKEY plug=curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
DOSKEY cnt=C:\Users\Admin\Desktop\connect.bat
DOSKEY val=vim %USERPROFILE%\alias.cmd
DOSKEY vrc=vim %USERPROFILE%\.vimrc
DOSKEY vtm=vim %USERPROFILE%\.tmux.conf
DOSKEY ccg=choco install git -y
DOSKEY ccv=choco install vim -y
DOSKEY cct=choco install tmux -y
DOSKEY cq=cd ..
DOSKEY cd=cd C:\Users\Admin
DOSKEY md=mkdir
DOSKEY rm=rmdir
DOSKEY cl=cls
DOSKEY ls=dir /B $*
DOSKEY gi=git init
DOSKEY gaa=git add .
DOSKEY gs=git status
DOSKEY gc=git commit -m
DOSKEY sublime=sublime_text $*  
DOSKEY viid=vim %USERPROFILE%\.ssh\id_ed25519

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


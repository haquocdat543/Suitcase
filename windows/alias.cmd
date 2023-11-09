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
    ::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
DOSKEY gsp="C:\Program Files (x86)\Sketchpad5\GSP505en.exe"
DOSKEY alias=notepad %USERPROFILE%\Dropbox\alias.cmd

:: Common directories

DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"
DOSKEY research=cd %USERPROFILE%\Dropbox\Research\


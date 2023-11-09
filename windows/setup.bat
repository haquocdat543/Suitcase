curl -L -o %USERPROFILE%/.reg https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/.reg
curl -L -o %USERPROFILE%/alias.cmd https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/alias.cmd
curl -L -o %USERPROFILE%/.vimrc https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/.vimrc
curl -L -o %USERPROFILE%/.tmux.conf https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/.tmux.conf
curl -L -o %USERPROFILE%/Desktop/connect.bat https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/connect.bat
curl -L -o %USERPROFILE%/Desktop/install.ps1 https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/install.ps1
curl -L -o %USERPROFILE%/Desktop/powershell.txt https://raw.githubusercontent.com/haquocdat543/Suitcase/main/windows/powershell.txt
IF exist %USERPROFILE%/preconfig ( md %USERPROFILE%/preconfig )
%USERPROFILE%/.reg

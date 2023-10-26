#!/bin/bash

### This is configuration for .vimrc file
## If the run.sh file in preconfig folder exist. Delete
if [ -f ~/preconfig/run.sh ]
then
	rm ~/preconfig/run.sh
fi
## If the .vimrc file in preconfig folder exist. Delete
if [ -f ~/preconfig/.vimrc ]
then
	rm ~/preconfig/.vimrc
fi
## Write content to run.sh file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/run.sh
#!/bin/bash

## If previmrc already exist. Delete it
if [ -f ~/preconfig/previmrc ]
then
	rm ~/preconfig/previmrc
fi

## If .vimrc in root foleder does not exist. Create it
if [ ! -f ~/.vimrc ]
then
	touch ~/.vimrc
fi

## If .vimrc.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/.vimrc.backup ]
then
	cp ~/.vimrc ~/preconfig/backup/.vimrc.backup 
fi
## move .vimrc to previmrc file in preconfig folder
mv ~/.vimrc ~/preconfig/previmrc

## move .vimrc in preconfig folder to root folder
mv ~/preconfig/.vimrc ~/.vimrc

EOF
## Write content to .vimrc file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/.vimrc

set history=200
set paste
set pastetoggle=<F3>
set wrap
set number
set ruler
set showcmd
set showmode
set wildmenu
set laststatus=2

call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" call vundle#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsEditSplit="vertical"

colorscheme dracula

map ,t :ter<CR>
map ,i :PluginInstall<CR>
map <C-b> :set backup<CR>
map <C-h> :noh<CR>
map <C-q> :q!<CR>
map <C-c> :%s/
map <C-i> :PlugInstall<CR>
map <C-p> :Files<CR>
map <C-s> :UltiSnipsEdit<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <Left> :echoe 'use h key instead'<CR>
nnoremap <Right> :echoe 'use l key instead'<CR>
nnoremap <Up> :echoe 'use k key instead'<CR>
nnoremap <Down> :echoe 'use j key instead'<CR>

EOF

clear

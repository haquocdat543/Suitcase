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
set wrap
set number
set relativenumber
set ruler
set showcmd
set showmode
set wildmenu
set laststatus=2
set pastetoggle=<F2>
set pastetoggle=<C-w>

call plug#begin()
Plug 'ryanoasis/vim-devicons'
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
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
Plug 'dinhhuy258/git.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'honza/vim-snippets'
call plug#end()

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" call vundle#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/preconfig/snippets']

colorscheme dracula

map ,t :ter<CR>
map ,gb :Git blame<CR>
map <C-b> :set backup<CR>
map <C-h> :noh<CR>
map <C-q>1 :q!<CR>
map <C-q>2 :wq!<CR>
map <C-c>a :%s/
map <C-c>1 :%s/
map <C-c>2 :.s/
map <C-c>3 :.,0s/
map <C-c>4 :.,\$s/
map <C-c>5 :.,.-
map <C-c>6 :.,.+
map <C-i>1 :PlugInstall<CR>
map <C-i>2 :PluginInstall<CR>
map <C-p>1 :Files<CR>
map <C-p>2 :Rg<CR>
map <C-x> :<C-p><CR>
map <C-s> :UltiSnipsEdit<CR>
map <F9> :FloatermNew<CR>

nnoremap ,n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <Left> :echoe 'use h key instead'<CR>
nnoremap <Right> :echoe 'use l key instead'<CR>
nnoremap <Up> :echoe 'use k key instead'<CR>
nnoremap <Down> :echoe 'use j key instead'<CR>

EOF

clear

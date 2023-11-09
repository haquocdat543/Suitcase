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
set pastetoggle=<C-e>

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
map <C-p>3 :Buffer<CR>
map <C-p>4 :FloatermNew<CR>
map <C-x> :<C-p><CR>
map <C-a> :UltiSnipsEdit<CR>
map <A-w> :w!<CR>
map <A-e> :e

nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-t>1 :tabnew 
nnoremap <C-t>2 :tabo<CR>

nnoremap <Left> :echoe 'use h key instead'<CR>
nnoremap <Right> :echoe 'use l key instead'<CR>
nnoremap <Up> :echoe 'use k key instead'<CR>
nnoremap <Down> :echoe 'use j key instead'<CR>

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
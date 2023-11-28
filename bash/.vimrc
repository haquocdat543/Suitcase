let mapleader = " "
set viminfo='100,<1000,s100,h
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
Plug 'vim-airline/vim-airline' " Status bar
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
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
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
let g:UltiSnipsSnippetDirectories=['~/preconfig/Suitcase/snippets']

let g:dracula_italic = 0
colorscheme dracula

map ,tt :ter<CR>
map ,gb :Git blame<CR>
map <C-b>b :set backup<CR>
map <C-h>h :noh<CR>
map <C-q>1 :q!<CR>
map <C-q>2 :wq!<CR>
map <C-c>a :%s/
map <C-c>1 :%s/
map <C-c>2 :.s/
map <C-c>3 :.,0s/
map <C-c>4 :.,$s/
map <C-c>5 :.,.-
map <C-c>6 :.,.+
map <leader>ii :PlugInstall<CR>
map <leader>in :PluginInstall<CR>
map <C-p>1 :Files<CR>
map <C-p>2 :Rg<CR>
map <C-p>3 :Buffer<CR>
map <C-p>4 :FloatermNew<CR>
map <C-x>1 :<C-p><CR>
map <A-a>a :UltiSnipsEdit<CR>
map <A-w>w :w!<CR>
map <A-n>n :n<CR>
map <A-p>p :p<CR>
map <A-e>e :e
map <C-s>s :sav

nnoremap <A-f>f :NERDTreeToggle<CR>
nnoremap <C-t>1 :tabnew 
nnoremap <C-t>2 :tabo<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <Left> :echoe 'use h key instead'<CR>
nnoremap <Right> :echoe 'use l key instead'<CR>
nnoremap <Up> :echoe 'use k key instead'<CR>
nnoremap <Down> :echoe 'use j key instead'<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffer<CR> 
nnoremap <leader>fh :FloatermNew<CR> 
nnoremap <leader>nn :set nopaste<CR> 
nnoremap <leader>nm :set paste<CR> 
nnoremap ZZ :wq!<CR> 
nnoremap ZQ :q!<CR> 
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

let mapleader = " "
set clipboard=unnamed
set viminfo='100,<1000000,s100000,h
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
Plug 'easymotion/vim-easymotion'
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
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * NERDTree | wincmd p
" Close Vim if NERDTree is the only buffer remaining
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/preconfig/Suitcase/snippets']
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.8
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']

let g:dracula_italic = 0
colorscheme dracula

map ,tt :ter<CR>
map ,gb :Git blame<CR>
map ,ya <Esc>gg"*yG
map <C-b>b :set backup<CR>
map <C-h>h :noh<CR>
map <C-q>1 :q!<CR>
map <C-q>2 :wq!<CR>
nnoremap <Leader>rc :%s///g<Left><Left>
map <C-c>a :%s///g<Left><Left><Left>
map <C-c>1 :%s///g<Left><Left><Left>
map <C-c>2 :.s///g<Left><Left><Left>
map <C-c>3 :.,0s///g<Left><Left><Left>
map <C-c>4 :.,$s///g<Left><Left><Left>
map <C-c>5 :.,.-s///g<Left><Left><Left><Left>
map <C-c>6 :.,.+s///g<Left><Left><Left><Left>
map <leader>ii :PlugInstall<CR>
map <leader>in :PluginInstall<CR>
map <C-p>1 :Files<CR>
map <C-p>2 :Rg<CR>
map <C-p>3 :Buffer<CR>
map <C-p>4 :FloatermNew<CR>
map <C-x>1 :<C-p><CR>
map <leader>aa :UltiSnipsEdit<CR>
map <leader>ww :w!<CR>
map <leader>ee :e
map <C-s>s :sav
map <C-a>a :Snippets<CR>
nmap te :tabedit
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w
nmap sx :close<CR>
nmap sw <C-w>w
nmap sh <C-w>h
nmap sj <C-w>j
nmap sk <C-w>k
nmap sl <C-w>l

nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tc :NERDTreeFocus<CR>
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
nnoremap <leader>ft :FloatermNew<CR> 
nnoremap <leader>nn :set nopaste<CR> 
nnoremap <leader>nm :set paste<CR> 
nnoremap ZZ :wq!<CR> 
nnoremap ZQ :q!<CR> 
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>
noremap x "_x
noremap X "_x
noremap <Del> "_x
map <Leader>ev :tabnew $MYVIMRC<CR>
map <Leader>ea :tabnew ~/.bashrc<CR>
map <Leader>cr :tabnew ~/.aws/credentials<CR>
map <Leader>cf :tabnew ~/.aws/config<CR>
nnoremap <Leader>r1 :exe '%s/${' . @m . '}/' . @n . '/g'<CR>
nnoremap <Leader>r2 :exe '%s/$(' . @m . ')/' . @n . '/g'<CR>

nmap <Leader>el yypC
nmap <Leader>eL yyPC

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

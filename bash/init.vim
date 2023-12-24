let mapleader = " "
set viminfo='100,<1000000,s100000,h
set history=200
set bg=dark
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
set pastetoggle=<A-s>

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
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
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
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.8
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']

let g:dracula_italic = 0
colorscheme gruvbox

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
map <C-x> :<C-p><CR>
map <C-a>a :UltiSnipsEdit<CR>
map <A-w>w :w!<CR>
map <A-n>n :n<CR>
map <A-p>p :p<CR>
map <C-s>s :sav
map <leader>nn :set nopaste<CR>
map <leader>nm :set paste<CR>
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

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
nnoremap <leader>ft :FloatermNew<CR> 
nnoremap <leader>gb :G branch<CR>
nnoremap <leader>gB :G branch 
nnoremap <leader>gs :G status<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gC :G checkout 
nnoremap <leader>gm :G merge 
nnoremap <leader>ga :G add 
nnoremap <leader>gA :G add .<CR> 
nnoremap <leader>gp :G pull<CR> 
nnoremap <leader>gP :G push<CR> 
nnoremap ZZ :wq!<CR> 
nnoremap ZQ :q!<CR> 
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>
noremap x "_x
noremap X "_x
noremap <Del> "_x
map <Leader>ev :tabnew $MYVIMRC<CR>
nnoremap <Leader>rc :%s///g<Left><Left>

"Git gutter 
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

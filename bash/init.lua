vim.cmd('autocmd!')

vim.g.mapleader = ' '
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.history = 200
vim.opt.background = 'dark'
vim.opt.paste = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.laststatus = 2
vim.opt.cursorline = true

local keymap = vim.keymap

keymap.set('n','+','<C-a>')
keymap.set('n','-','<C-x>')
keymap.set('n','<C-a>','gg<M-v>G')
keymap.set('n','<leader>ii',':PackerInstall<CR>')
keymap.set('n','<leader>ff',':Files<CR>')
keymap.set('n','<leader>fg',':Rg<CR>')
keymap.set('n','<leader>fb',':Buffers<CR>')
keymap.set('n','<leader>ft',':FloatermNew<CR>')
keymap.set('n','<leader>nn',':set nopaste<CR>')
keymap.set('n','<leader>nm',':set paste<CR>')
keymap.set('n','<leader>gs',':G status<CR>')
keymap.set('n','<leader>ga',':G add ')
keymap.set('n','<leader>gA',':G add .<CR>')
keymap.set('n','<leader>gc',':G commit<CR>')
keymap.set('n','<leader>gC',':G checkout ')
keymap.set('n','<leader>gb',':G branch<CR>')
keymap.set('n','<leader>gB',':G branch ')
keymap.set('n','<leader>gm',':G merge ')
keymap.set('n','<leader>gp',':G pull<CR>')
keymap.set('n','<leader>gp',':G push<CR>')
keymap.set('n',',tt',':ter<CR>')
keymap.set('n',',gb',':Git blame<CR>')
keymap.set('n','<C-b>b',':set backup<CR>')
keymap.set('n','<C-h>h',':noh<CR>')
keymap.set('n','<C-q>q',':q!<CR>')
keymap.set('n','<C-q>w',':wq!<CR>')
keymap.set('n','<C-c>1',':%s/')
keymap.set('n','<C-c>2',':.,.s/')
keymap.set('n','<C-c>3',':.,0s/')
keymap.set('n','<C-c>4',':.,$s/')
keymap.set('n','<C-c>5',':.,.-')
keymap.set('n','<C-c>6',':.,.+')
keymap.set('n','<C-x>','<C-p><CR>')
keymap.set('n','<C-a>a',':UltiSnipsEdit<CR>')
keymap.set('n','<A-w>w',':w!<CR>')
keymap.set('n','<A-n>n',':n<CR>')
keymap.set('n','<A-p>p',':p<CR>')
keymap.set('v','//','y/\V<C-R>=escape(@",'/\')<CR><CR>')
keymap.set('n','<A-f>f',':NERDTreeToggle<CR>')
keymap.set('n','<C-t>1',':tabnew ')
keymap.set('n','<C-t>2',':tabo<CR>')

keymap.set('n','te',':tabedit ')
keymap.set('n','ss',':split<CR><C-w>w')
keymap.set('n','sv',':vsplit<CR><C-w>w')
keymap.set('n','sh','<C-w>h')
keymap.set('n','sj','<C-w>j')
keymap.set('n','sk','<C-w>k')
keymap.set('n','sl','<C-w>l')

local status, packer = pcall(require, 'packer')
if (not status) then
   print('Packer is not installed')
   return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'ryanoasis/vim-devicons'
   use 'ellisonleao/gruvbox.nvim'
   use { 'junegunn/fzf', run = ":call fzf#install()" }
   use { 'junegunn/fzf.vim' }
   use 'easymotion/vim-easymotion'
   use {
   'nvim-tree/nvim-tree.lua',
   requires = {
    'nvim-tree/nvim-web-devicons', -- optional
     },
   }
   use 'vim-airline/vim-airline' 
   use 'voldikss/vim-floaterm'
   use 'SirVer/ultisnips'
   use 'dinhhuy258/git.nvim'
   use 'tpope/vim-fugitive'
   use 'airblade/vim-gitgutter'
end)

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[let g:UltiSnipsExpandTrigger="<tab>"]])
vim.cmd([[let g:UltiSnipsListSnippets="<c-y>"]])
vim.cmd([[let g:UltiSnipsJumpForwardTrigger="<c-m>"]])
vim.cmd([[let g:UltiSnipsJumpBackwardTrigger="<c-n>"]])
vim.cmd([[let g:UltiSnipsEditSplit="vertical"]])
vim.cmd([[let g:UltiSnipsSnippetDirectories=['~/preconfig/snippets'] ]])
vim.cmf([[let g:floaterm_position = 'topright']])
vim.cmf([[let g:floaterm_width = 0.6]])
vim.cmf([[let g:floaterm_height = 0.8]])
vim.cmf([[let g:floaterm_title = 'Terminal $1/$2']])
vim.cmf([[let g:floaterm_wintype = 'float']])
vim.cmf([[let g:floaterm_rootmarkers = ['.pro'] ]])
vim.cmd([[let g:airline_theme='gruvbox']])

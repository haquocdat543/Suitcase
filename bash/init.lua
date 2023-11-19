-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed
 
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
keymap.set('n','<leader>is',':PackerSync<CR>')
keymap.set('n','<leader>ff',':Files<CR>')
keymap.set('n','<leader>fg',':Rg<CR>')
keymap.set('n','<leader>fb',':Buffers<CR>')
keymap.set('n','<leader>ft',':FloatermNew<CR>')
keymap.set('n','<leader>nn',':set nopaste<CR>')
keymap.set('n','<leader>nm',':set paste<CR>')
keymap.set('n','<leader>mm',':Mason<CR>')
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
keymap.set('n','<A-f>f',':NERDTreeToggle<CR>')
keymap.set('n','<leader>to',':tabnew ')
keymap.set('n','<leader>tx',':tabclose<CR>')
keymap.set('n','<leader>tn',':tabn<CR>')
keymap.set('n','<leader>tp',':tabp<CR>')

keymap.set('n','te',':tabedit ')
keymap.set('n','ss',':split<CR><C-w>w')
keymap.set('n','sv',':vsplit<CR><C-w>w')
keymap.set('n','sx',':close<CR>')
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
   use 'voldikss/vim-floaterm'
   use 'SirVer/ultisnips'
   use 'dinhhuy258/git.nvim'
   use 'tpope/vim-fugitive'
   use 'airblade/vim-gitgutter'
   use 'preservim/nerdtree'
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'L3MON4D3/LuaSnip'
   use 'saadparwaiz1/cmp_luasnip'
   use 'rafamadriz/friendly-snippets'
   use 'nvim-lualine/lualine.nvim'
   use 'williamboman/mason.nvim' 
   use 'williamboman/mason-lspconfig.nvim' 
   use 'neovim/nvim-lspconfig' 
   use 'hrsh7th/cmp-nvim-lsp' 
   use 'glepnir/lspsaga.nvim'
   use 'nvim-treesitter/nvim-treesitter'
   use 'jose-elias-alvarez/typescript.nvim' 
   use 'onsails/lspkind.nvim' 
   use 'jose-elias-alvarez/null-ls.nvim' 
   use 'jayp0521/mason-null-ls.nvim' 
end)
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_nightfly,
  },
})
-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- load vs-code like snippets from plugins (e.g. friendly-

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
})

-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "lua_ls",
    "emmet_ls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
})
-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[let g:UltiSnipsExpandTrigger="<tab>"]])
vim.cmd([[let g:UltiSnipsListSnippets="<c-y>"]])
vim.cmd([[let g:UltiSnipsJumpForwardTrigger="<c-m>"]])
vim.cmd([[let g:UltiSnipsJumpBackwardTrigger="<c-n>"]])
vim.cmd([[let g:UltiSnipsEditSplit="vertical"]])
vim.cmd([[let g:UltiSnipsSnippetDirectories=['~/preconfig/snippets'] ]])
vim.cmd([[let g:floaterm_position = 'topright']])
vim.cmd([[let g:floaterm_width = 0.6]])
vim.cmd([[let g:floaterm_height = 0.8]])
vim.cmd([[let g:floaterm_title = 'Terminal $1/$2']])
vim.cmd([[let g:floaterm_wintype = 'float']])
vim.cmd([[let g:floaterm_rootmarkers = ['.pro'] ]])
vim.cmd([[let g:gitgutter_sign_added = '+' ]])
vim.cmd([[let g:gitgutter_sign_modified = '*' ]])
vim.cmd([[let g:gitgutter_sign_removed = 'x' ]])
vim.cmd([[let g:gitgutter_sign_removed_first_line = '^' ]])
vim.cmd([[let g:gitgutter_sign_modified_removed = '<' ]])

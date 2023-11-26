local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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
keymap.set('n','<leader>sa',':HopAnywhere<CR>')
keymap.set('n','<leader>sw',':HopWord<CR>')
keymap.set('n','<C-s>s',':sav ')
keymap.set('n','<leader>b','<leader><leader>')
keymap.set('n','<leader>mm',':Mason<CR>')
keymap.set('n','<leader>ll',':Lazy<CR>')
keymap.set('n','<leader>lg',':LazyGit<CR>')
keymap.set('n','<leader>ch',':checkhealth ')
keymap.set('n','<leader>mi',':MasonInstall ')
keymap.set('n','<leader>gs',':G status<CR>')
keymap.set('n','<leader>ga',':G add ')
keymap.set('n','<leader>gA',':G add .<CR>')
keymap.set('n','<leader>gc',':G commit<CR>')
keymap.set('n','<leader>Gc',':G add .<CR>:G commit<CR>')
keymap.set('n','<leader>gC',':G checkout ')
keymap.set('n','<leader>gb',':G branch<CR>')
keymap.set('n','<leader>gB',':G branch ')
keymap.set('n','<leader>gm',':G merge ')
keymap.set('n','<leader>gp',':G pull<CR>')
keymap.set('n','<leader>gP',':G push<CR>')
keymap.set('n','<leader>gl',':G log<CR>')
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
keymap.set('n','<A-j>',':m .+1<CR>==')
keymap.set('n','<A-k>',':m .-2<CR>==')
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
keymap.set('n','sw','<C-w>w')
keymap.set('n','sh','<C-w>h')
keymap.set('n','sj','<C-w>j')
keymap.set('n','sk','<C-w>k')
keymap.set('n','sl','<C-w>l')

local plugins = {
 'wbthomason/packer.nvim',
 'kdheepak/lazygit.nvim',
 'ryanoasis/vim-devicons',
 'phaazon/hop.nvim',
 'Yggdroot/indentLine',
 'ellisonleao/gruvbox.nvim',
 { 'junegunn/fzf', run = ":call fzf#install()" },
 { 'junegunn/fzf.vim' },
 'easymotion/vim-easymotion',
 'nvim-tree/nvim-tree.lua',
 'nvim-tree/nvim-web-devicons', -- optional,
 'voldikss/vim-floaterm',
 'SirVer/ultisnips',
 'dinhhuy258/git.nvim',
 'tpope/vim-fugitive',
 'airblade/vim-gitgutter',
 'preservim/nerdtree',
 'hrsh7th/nvim-cmp',
 'hrsh7th/cmp-buffer',
 'hrsh7th/cmp-path',
 'L3MON4D3/LuaSnip',
 'saadparwaiz1/cmp_luasnip',
 'rafamadriz/friendly-snippets',
 'nvim-lualine/lualine.nvim',
 'williamboman/mason.nvim',
 'williamboman/mason-lspconfig.nvim',
 'neovim/nvim-lspconfig',
 'hrsh7th/cmp-nvim-lsp',
 'glepnir/lspsaga.nvim',
 'nvim-treesitter/nvim-treesitter',
 'jose-elias-alvarez/typescript.nvim',
 'onsails/lspkind.nvim',
 'jose-elias-alvarez/null-ls.nvim',
 'jayp0521/mason-null-ls.nvim',
 'nvim-lua/plenary.nvim',
 'nvim-telescope/telescope-fzf-native.nvim',
 'nvim-telescope/telescope.nvim',
 'antosha417/nvim-lsp-file-operations',
 'WhoIsSethDaniel/mason-tool-installer.nvim'
}

local opts = {}

require("lazy").setup(plugins, opts)
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

require'hop'.setup()

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
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
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

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  opts.buffer = bufnr
  keymap.set("n", "gs", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
  keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "gn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "gp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "gP", "<Cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
  opts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  opts.desc = "Show LSP definitions"
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)
  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
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
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
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

-- configure svelte server
lspconfig["svelte"].setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        if client.name == "svelte" then
          client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
        end
      end,
    })
  end,
})

-- configure prisma orm server
lspconfig["prismals"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure graphql language server
lspconfig["graphql"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure python server
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
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

    -- import mason
local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "svelte",
    "lua_ls",
    "graphql",
    "emmet_ls",
    "prismals",
    "pyright",
  },
      -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_tool_installer.setup({
  ensure_installed = {
    "prettier", -- prettier formatter
    "stylua", -- lua formatter
    "isort", -- python formatter
    "black", -- python formatter
    "pylint", -- python linter
    "eslint_d", -- js linter
  },
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

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[let g:UltiSnipsExpandTrigger="<tab>"]])
vim.cmd([[let g:UltiSnipsListSnippets="<c-y>"]])
vim.cmd([[let g:UltiSnipsJumpForwardTrigger="<CR>"]])
vim.cmd([[let g:UltiSnipsJumpBackwardTrigger="<C-n>n"]])
vim.cmd([[let g:UltiSnipsEditSplit="vertical"]])
vim.cmd([[let g:UltiSnipsSnippetDirectories=['~/preconfig/Suitcase/snippets'] ]])
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
vim.cmd([[let g:lazygit_floating_window_winblend = 0 " transparency of floating window ]])
vim.cmd([[let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window ]])
vim.cmd([[let g:lazygit_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─', '╰', '│'] " customize lazygit popup window border characters ]])
vim.cmd([[let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available ]])
vim.cmd([[let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed ]])

vim.cmd([[let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1 ]])
vim.cmd([[let g:lazygit_config_file_path = '' " custom config file path ]])

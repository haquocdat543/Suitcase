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

-- System
keymap.set('n','<leader>ch',':checkhealth ')
keymap.set('n','+','<C-a>')
keymap.set('n','-','<C-x>')
keymap.set('n','<C-a>','gg<M-v>G')
keymap.set('n','ZQ',':q!<CR>')
keymap.set('n','ZZ',':wq!<CR>')
keymap.set('n','<Leader>hr',':%!xxd<CR> :set filetype=xxd<CR>')
keymap.set('n','<Leader>hw',':%!xxd -r<CR> :set binary<CR> :set filetype=<CR>')
keymap.set('n','<Leader>el','yypC')
keymap.set('n','<Leader>eL','yyPC')

-- System - commands
keymap.set('n','<leader>rg',':registers<CR>')

-- System - default file open
keymap.set('n','<Leader>en',':tabnew ~/.config/nvim/init.lua<CR>')
keymap.set('n','<Leader>ev',':tabnew ~/.vimrc<CR>')
keymap.set('n','<Leader>ea',':tabnew ~/.bashrc<CR>')
keymap.set('n','<leader>nn',':set nopaste<CR>')
keymap.set('n','<leader>nm',':set paste<CR>')

-- System - navigation
keymap.set('n','ss',':split<CR><C-w>w')
keymap.set('n','sv',':vsplit<CR><C-w>w')
keymap.set('n','sx',':close<CR>')
keymap.set('n','sw','<C-w>w')
keymap.set('n','sh','<C-w>h')
keymap.set('n','sj','<C-w>j')
keymap.set('n','sk','<C-w>k')
keymap.set('n','sl','<C-w>l')

-- System - tab navigation
keymap.set('n','te',':tabedit ')
keymap.set('n','<leader>to',':tabnew ')
keymap.set('n','<leader>tx',':tabclose<CR>')
keymap.set('n','<leader>tn',':tabn<CR>')
keymap.set('n','<leader>tp',':tabp<CR>')
keymap.set('n','<leader>ev',':tabnew $MYVIMRC<CR>')
keymap.set('n','<leader>ea',':tabnew $HOME/.bashrc<CR>')
keymap.set('n','<leader>cr',':tabnew $HOME/.aws/credentials<CR>')
keymap.set('n','<leader>cf',':tabnew $HOME/.aws/config<CR>')

-- System - terminal 
keymap.set('n',',tt',':ter<CR>')

-- Package manager
keymap.set('n','<leader>ii',':PackerInstall<CR>')
keymap.set('n','<leader>is',':PackerSync<CR>')

-- Finder
keymap.set('n','<leader>ff',':Files<CR>')
keymap.set('n','<leader>fg',':Rg<CR>')
keymap.set('n','<leader>fb',':Buffers<CR>')
keymap.set('n','<leader>ft',':FloatermNew<CR>')

-- Hop ( movement )
keymap.set('n','<leader><leader>g',':HopAnywhere<CR>')
keymap.set('n','<leader><leader>h',':HopWord<CR>')
keymap.set('n','<leader><leader>l',':HopLine<CR>')
keymap.set('n','<leader><leader>c',':HopChar1<CR>')
keymap.set('n','<leader>b','<leader><leader>')

-- Lazygit
keymap.set('n','<leader>ll',':Lazy<CR>')
keymap.set('n','<leader>lg',':LazyGit<CR>')

-- Mason ( LSP )
keymap.set('n','<leader>mm',':Mason<CR>')
keymap.set('n','<leader>mi',':MasonInstall ')

-- Fugitive git
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

-- Neogit
keymap.set('n','<leader>ng',':Neogit<CR>')

-- Git blame
keymap.set('n',',gb',':Git blame<CR>')
keymap.set('n','<C-b>b',':set backup<CR>')
keymap.set('n','<C-h>h',':noh<CR>')
keymap.set('n','<C-q>q',':q!<CR>')
keymap.set('n','<C-q>w',':wq!<CR>')

-- System - replacement & navigation
keymap.set('n','<C-c>1',':%s///g<Left><Left><Left>')
keymap.set('n','<C-c>2',':.,.s///g<Left><Left><Left>')
keymap.set('n','<C-c>3',':.,0s///g<Left><Left><Left>')
keymap.set('n','<C-c>4',':.,$s///g<Left><Left><Left>')
keymap.set('n','<C-c>5',':.,.-s///g<Left><Left><Left><Left><Left>')
keymap.set('n','<C-c>6',':.,.+s///g<Left><Left><Left><Left><Left>')
keymap.set('n','<C-x>','<C-p><CR>')
keymap.set('n','<A-j>',':m .+1<CR>==')
keymap.set('n','<A-k>',':m .-2<CR>==')
keymap.set('n','<C-a>a',':UltiSnipsEdit<CR>')
keymap.set('n','<leader>ww',':w!<CR>')
keymap.set('n','<C-s>s',':<ESC>w!<CR>')
keymap.set('n','<A-n>n',':n<CR>')
keymap.set('n','<A-p>p',':p<CR>')

-- Navigation
keymap.set('n','<leader>nt',':NERDTreeToggle<CR>')
keymap.set('n','<leader>db',':Dashboard<CR>')
keymap.set('n','<leader>tl',':Telescope<CR>')

local plugins = {
 {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
 },
  config = true
 },
 {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
    }
  end,
 },
 { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
 'rbgrouleff/bclose.vim',
 'francoiscabrol/ranger.vim',
 'wbthomason/packer.nvim',
 'nvim-treesitter/nvim-treesitter',
 'folke/tokyonight.nvim',
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

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<C-]>",
  dismiss_keymap = "<C-[>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

-- terraform lsp
require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- init.lua
local neogit = require('neogit')
neogit.setup {}

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Bash"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
 -- same as `override` but specifically for operating system
 -- takes effect when `strict` is true
 override_by_operating_system = {
  ["apple"] = {
    icon = "",
    color = "#A2AAAD",
    cterm_color = "248",
    name = "Apple",
  },
 };
}

require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  -- ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,
  ensure_installed = { "c", "lua", "vim", "vimdoc" },
  -- open_on_setup = true,
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-f>',
      node_incremental = '<c-f>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-f>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

require("tokyonight").setup({
    style = "night",
    styles = {
      comments = { italic = true },
      keywords = { bold = true },
      functions = { bold = true },
      variables = {},
      operators = { bold = true },
      booleans = { bold = true },
      sidebars = "dark",
      floats = "dark",
    },
    on_highlights = function(hl, c)
      hl.CursorLine = { bg = c.bg_highlight }
      hl.Visual = { bg = "#484a37" }
      hl.Type                 = { fg = c.blue1, bold = true }
      hl.Conditional          = { fg = c.magenta, bold = true }
      hl.Repeat               = { fg = c.magenta, bold = true }
      hl.Label                = { fg = c.red }
      hl.Constant             = { fg = c.orange, bold = true }
      hl.String               = { fg = c.green }
      hl.Character            = { fg = c.green }
      hl.Number               = { fg = c.orange }
      hl.Boolean              = { fg = c.orange }
      hl.Float                = { fg = c.orange }
      hl["@constructor"]      = { fg = c.blue1 }
      hl["@variable.builtin"] = { fg = c.red }
      hl["@text.uri"] = {}
      hl.Include              = { fg = c.magenta, bold = true }
      hl.rainbowcol1          = { fg = '#F4CA0D' }
      hl.rainbowcol2          = { fg = c.purple }
      hl.rainbowcol3          = { fg = c.cyan }
      hl.rainbowcol4          = { fg = '#F4CA0D' }
      hl.rainbowcol5          = { fg = c.purple }
      hl.rainbowcol6          = { fg = c.cyan }
      hl.rainbowcol7          = { fg = '#F4CA0D' }
      -- hl.rainbowcol7 = { fg = c.purple }
      hl["@punctuation.bracket"] = { fg = c.magenta } -- For brackets and parens.
   end
})

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

cmp.setup {
snippet = {
  expand = function(args)
    luasnip.lsp_expand(args.body)
  end,
},
mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

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
vim.cmd([[set viminfo='100,<1000000,s100000,h]])

vim.cmd[[autocmd BufEnter * lcd %:p:h]]
vim.cmd[[

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

]]

vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[
    highlight RainbowDelimiterRed  guifg=#f4ca0d ctermfg=White
    highlight RainbowDelimiterYellow guifg=#9d7cd8 ctermfg=White
    highlight RainbowDelimiterBlue guifg=#7dcfff ctermfg=White
    highlight RainbowDelimiterOrange guifg=#f4ca0d ctermfg=White
    highlight RainbowDelimiterGreen guifg=#9d7cd8 ctermfg=White
    highlight RainbowDelimiterViolet guifg=#7dcfff ctermfg=White
    highlight RainbowDelimiterCyan guifg=#f4ca0d ctermfg=White
]]



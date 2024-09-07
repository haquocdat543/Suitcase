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

vim.g.mapleader = " " -- for normal mode
vim.g.maplocalleader = " " -- for local leader mappings
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

-- Spectre [ Search and replace ]
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word",
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word",
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
})

-- Query { Rest API ]
keymap.set('n',',xr',':call VrcQuery()<CR>')

-- System
keymap.set('n',',ch',':checkhealth ')
keymap.set('n','+','<C-a>')
keymap.set('n','-','<C-x>')
keymap.set('n','<C-a>','gg<M-v>G')
keymap.set('n','ZQ',':q!<CR>')
keymap.set('n','ZZ',':wq!<CR>')
keymap.set('n','<leader>hr',':%!xxd<CR> :set filetype=xxd<CR>')
keymap.set('n','<leader>hw',':%!xxd -r<CR> :set binary<CR> :set filetype=<CR>')
keymap.set('n','<leader>el','yypC')
keymap.set('n','<leader>eL','yyPC')
keymap.set('n','<leader>ra',':call ReplaceAll')

-- Map ESC
keymap.set('i','<C-x>','<Esc><Esc>')
-- keymap.set('i', '<Esc>', '<Esc><Esc>')

-- System - commands
keymap.set('n','<leader>rg',':registers<CR>')

-- System - default file open
keymap.set('n','<leader>en',':tabnew ~/.config/nvim/init.lua<CR>')
keymap.set('n','<leader>ev',':tabnew ~/.vimrc<CR>')
keymap.set('n','<leader>ea',':tabnew ~/.bashrc<CR>')
keymap.set('n','<leader>ec',':tabnew ~/.ssh/config<CR>')
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
keymap.set('n','<leader>te',':tabedit ')
keymap.set('n','<leader>to',':tabnew ')
keymap.set('n','<leader>tx',':tabclose<CR>')
keymap.set('n','<leader>tn',':tabn<CR>')
keymap.set('n','<leader>tp',':tabp<CR>')
keymap.set('n','<leader>ev',':tabnew $MYVIMRC<CR>')
keymap.set('n','<leader>ea',':tabnew $HOME/.bashrc<CR>')
keymap.set('n','<leader>cr',':tabnew $HOME/.aws/credentials<CR>')
keymap.set('n','<leader>cf',':tabnew $HOME/.aws/config<CR>')

-- System - terminal 
keymap.set('n','<leader>tt',':ter<CR>')

-- Package manager
keymap.set('n','<leader>ii',':PackerInstall<CR>')
keymap.set('n','<leader>is',':PackerSync<CR>')

-- Finder
keymap.set('n','<leader>ff',':Files<CR>')
keymap.set('n','<leader>fg',':Rg<CR>')
keymap.set('n','<leader>fb',':Buffers<CR>')
keymap.set('n','<leader>ft',':FloatermNew<CR>')
keymap.set('n','<leader>tt',':terminal<CR>')

-- Hop ( movement )
keymap.set('n','<leader><leader>g',':HopAnywhere<CR>')
keymap.set('n','<leader><leader>h',':HopWord<CR>')
keymap.set('n','<leader><leader>l',':HopLine<CR>')
keymap.set('n','<leader><leader>c',':HopChar1<CR>')
keymap.set('n','<leader>b',',,')

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
keymap.set('n','<leader>gb',':Git blame<CR>')
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
keymap.set('n','<leader>aa',':UltiSnipsEdit<CR>')
keymap.set('n','<leader>ww',':w!<CR>')
keymap.set('n','<C-s>s',':<ESC>w!<CR>')
keymap.set('n','<A-n>n',':n<CR>')
keymap.set('n','<A-p>p',':p<CR>')

-- Navigation
keymap.set('n','<leader>nt',':NvimTreeToggle<CR>')
keymap.set('n','<leader>nf',':NvimTreeFindFile<CR>')
keymap.set('n','<leader>nc',':NvimTreeFocus<CR>')
-- keymap.set('n','<leader>nt',':NERDTreeToggle<CR>')
keymap.set('n','<leader>db',':Dashboard<CR>')
keymap.set('n','<leader>tl',':Telescope<CR>')

local plugins = {
 { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
'diepm/vim-rest-console',
'nvim-pack/nvim-spectre',
 {
 "iamcco/markdown-preview.nvim",
 cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
 ft = { "markdown" },
 build = function() vim.fn["mkdp#util#install"]() end,
 },
 {
 'nvim-tree/nvim-tree.lua'
 },
 {
 'hsalem7/nvim-k8s'
 },
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
 {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
 },
 { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
 'rbgrouleff/bclose.vim',
 'francoiscabrol/ranger.vim',
 'wbthomason/packer.nvim',
 'nvim-treesitter/nvim-treesitter',
 'folke/tokyonight.nvim',
 'kdheepak/lazygit.nvim',
 --'ryanoasis/vim-devicons',
 'phaazon/hop.nvim',
 'Yggdroot/indentLine',
 'ellisonleao/gruvbox.nvim',
 { 'junegunn/fzf', run = ":call fzf#install()" },
 { 'junegunn/fzf.vim' },
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

require('git').setup({
  default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

  keymaps = {
    -- Open blame window
    blame = "<leader>gb",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Quit blame commit
    quit_blame_commit = "q",
    -- Open file/folder in git repository
    browse = "<leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<leader>gd",
    -- Close git diff
    diff_close = "<leader>gD",
    -- Revert to the specific commit
    revert = "<leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<leader>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
  -- Private gitlab hosts, if you use a private gitlab, put your private gitlab host here
  private_gitlabs = { "https://xxx.git.com" },
  -- Enable winbar in all windows created by this plugin
  winbar = false,
})

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<C-]>",
  dismiss_keymap = "<C-[>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

-- Import the nvim-tree module
-- local nvim_tree = require'nvim-tree'

-- Configure nvim-tree
-- nvim_tree.setup({
  -- -- Your other nvim-tree settings here
  -- update_cwd = true,  -- Update the current working directory of nvim-tree
  -- respect_buf_cwd = true, -- Use the current buffer's directory rather than the current working directory
-- })
-- 
require('spectre').setup()

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

-- require("neo-tree").setup({
      -- filesystem = {
        -- bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        -- cwd_target = {
          -- sidebar = "tab",   -- sidebar is when position = left or right
          -- current = "window" -- current is when position = current
        -- },
    -- }
-- })

-- local actions = require "telescope.actions"
-- local trouble = require("trouble.providers.telescope")
-- 
-- telescope.setup {
  -- # defaults = {
-- 
      -- # prompt_prefix = " ",
      -- # selection_caret = " ",
      -- # path_display = { "smart" },
      -- # file_ignore_patterns = { "node_modules" },
-- 
      -- # mappings = {
          -- # i = {
              -- # ["<C-n>"] = actions.cycle_history_next,
              -- # ["<C-p>"] = actions.cycle_history_prev,
-- 
              -- # ["<C-j>"] = actions.move_selection_next,
              -- # ["<C-k>"] = actions.move_selection_previous,
-- 
              -- # ["<C-c>"] = actions.close,
-- 
              -- # ["<Down>"] = actions.move_selection_next,
              -- # ["<Up>"] = actions.move_selection_previous,
-- 
              -- # ["<CR>"] = actions.select_default,
              -- # ["<C-x>"] = actions.select_horizontal,
              -- # ["<C-v>"] = actions.select_vertical,
              -- # -- ["<C-t>"] = actions.select_tab,
              -- # ["<C-t>"] = trouble.open_with_trouble,
-- 
              -- # ["<C-u>"] = actions.preview_scrolling_up,
              -- # ["<C-d>"] = actions.preview_scrolling_down,
-- 
              -- # ["<PageUp>"] = actions.results_scrolling_up,
              -- # ["<PageDown>"] = actions.results_scrolling_down,
-- 
              -- # ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              -- # ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              -- # ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              -- # ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              -- # ["<C-l>"] = actions.complete_tag,
              -- # ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          -- # },
-- 
          -- # n = {
              -- # ["q"] = actions.close,
              -- # ["<CR>"] = actions.select_default,
              -- # ["<C-x>"] = actions.select_horizontal,
              -- # ["<C-v>"] = actions.select_vertical,
              -- # -- ["<C-t>"] = actions.select_tab,
              -- # ["<C-t>"] = trouble.open_with_trouble,
-- 
              -- # ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              -- # ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              -- # ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              -- # ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
-- 
              -- # ["j"] = actions.move_selection_next,
              -- # ["k"] = actions.move_selection_previous,
              -- # ["H"] = actions.move_to_top,
              -- # ["M"] = actions.move_to_middle,
              -- # ["L"] = actions.move_to_bottom,
-- 
              -- # ["<Down>"] = actions.move_selection_next,
              -- # ["<Up>"] = actions.move_selection_previous,
              -- # ["gg"] = actions.move_to_top,
              -- # ["G"] = actions.move_to_bottom,
-- 
              -- # ["<C-u>"] = actions.preview_scrolling_up,
              -- # ["<C-d>"] = actions.preview_scrolling_down,
-- 
              -- # ["<PageUp>"] = actions.results_scrolling_up,
              -- # ["<PageDown>"] = actions.results_scrolling_down,
-- 
              -- # ["?"] = actions.which_key,
          -- # },
      -- # },
  -- # },
  -- # pickers = {
      -- # -- Default configuration for builtin pickers goes here:
      -- # -- picker_name = {
      -- # --   picker_config_key = value,
      -- # --   ...
      -- # -- }
      -- # -- Now the picker_config_key will be applied every time you call this
      -- # -- builtin picker
  -- # },
  -- # extensions = {
      -- # -- Your extension configuration goes here:
      -- # -- extension_name = {
      -- # --   extension_config_key = value,
      -- # -- }
      -- # -- please take a look at the readme of the extension you want to configure
  -- # },
-- }

local opt = { noremap = true, silent = true }
local k = vim.api.nvim_set_keymap

k("n", "<leader><leader>1", "<Cmd>Telescope find_files<CR>", opt)
k("n", "<leader><leader>2", "<Cmd>Telescope live_grep<CR>", opt)
k("n", "<leader><leader>3", "<Cmd>Telescope oldfiles<CR>", opt)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
   -- Automatically update the tree when changing directories
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_cwd = true,
  auto_reload_on_write = true,
  update_focused_file = {
    enable = true,     -- Enable updating the focused file
    update_cwd = true, -- Change the root directory of the tree to the current file's directory
    ignore_list = {}
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
-- require("nvim-tree").setup {
  -- ---
  -- on_attach = my_on_attach,
  -- ---
-- }

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
  ensure_installed = { "c", "lua", "vim", "vimdoc", "helm", "dockerfile", "yaml", "gotmpl" },
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
        [',a'] = '@parameter.inner',
      },
      swap_previous = {
        [',A'] = '@parameter.inner',
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
  keymap.set({ "n", "v" }, ",ca", vim.lsp.buf.code_action, opts)
  opts.desc = "Smart rename"
  keymap.set("n", ",rn", vim.lsp.buf.rename, opts)
  opts.desc = "Show buffer diagnostics"
  keymap.set("n", ",D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
  opts.desc = "Show line diagnostics"
  keymap.set("n", ",d", vim.diagnostic.open_float, opts)
  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)
  opts.desc = "Restart LSP"
  keymap.set("n", ",rs", ":LspRestart<CR>", opts)
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

-- configure gpls server
lspconfig["gopls"].setup({
capabilities = capabilities,
on_attach = on_attach,
})

-- Mason and lsp configuration. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
require'lspconfig'.gopls.setup{}

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

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

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"},
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"},
}

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
vim.cmd([[autocmd FileType markdown let g:indentLine_enabled=0]])

vim.cmd[[autocmd BufEnter * lcd %:p:h]]
-- vim.cmd[[autocmd VimEnter * NERDTree | wincmd p]]
-- vim.cmd[[autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif]]
-- vim.cmd[[autocmd VimEnter * if argc() == 0 | NERDTree | endif]]

-- Auto open nvim-tree on startup
vim.cmd[[autocmd VimEnter * NvimTreeOpen | wincmd p]]
vim.cmd[[autocmd bufenter * if (winnr("$") == 1 && &filetype == "nerdtree") | q | endif]]

vim.cmd([[
  augroup NvimTree
    autocmd!
    autocmd VimEnter * ++nested if argc() == 0 | NvimTreeOpen | endif
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == '' | NvimTreeOpen | wincmd p | endif
  augroup end
]])

-- Auto close nvim-tree if it's the last window
vim.cmd[[ autocmd BufEnter * if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]

vim.cmd[[

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

]]

vim.cmd[[augroup filetypedetect
autocmd BufNewFile,BufRead *.tmpl, if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
augroup END]]

vim.g.vim_k8s_toggle_key_map = ',k9'

vim.cmd[[function DisplayName(name)
  echom "Hello!  My name is:"
  echom a:name
endfunction]]

vim.cmd[[function ReplaceAll(old_text, new_text) 
  execute '%s/' . a:old_text . '/' . a:new_text . '/gc | update'
endfunction]]

vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_output_butter_name = '_OUTPUT.json'
vim.g.vrc_auto_format_response_patterns = {
  json = 'jq'
}

-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[colorscheme catppuccin]]

vim.cmd[[
    highlight RainbowDelimiterRed  guifg=#f4ca0d ctermfg=White
    highlight RainbowDelimiterYellow guifg=#9d7cd8 ctermfg=White
    highlight RainbowDelimiterBlue guifg=#7dcfff ctermfg=White
    highlight RainbowDelimiterOrange guifg=#f4ca0d ctermfg=White
    highlight RainbowDelimiterGreen guifg=#9d7cd8 ctermfg=White
    highlight RainbowDelimiterViolet guifg=#7dcfff ctermfg=White
    highlight RainbowDelimiterCyan guifg=#f4ca0d ctermfg=White
]]

-- Automatically open Nvim Tree when a directory is opened
vim.cmd([[
  autocmd BufEnter * if &ft ==# 'netrw' | silent! lua require'nvim-tree'.find_file(true) | endif
]])

-- Enable concealment for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal conceallevel=0"
})


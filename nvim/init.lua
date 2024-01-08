-- Lazy boilerplate:

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins:

require('lazy').setup {
  -- TODO: ChatGPT integration
  -- {
    -- "jackMort/ChatGPT.nvim", 
    -- event = "VeryLazy",
    -- config = function()
      -- require("chatgpt").setup()
    -- end,
    -- dependencies = {
      -- "MunifTanjim/nui.nvim",
      -- "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope.nvim"
    -- }
  -- },
  {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-path"}},
  { "nvim-treesitter/nvim-treesitter",
  -- TODO: Cleanup; A lot of defaults:
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {"cpp", "lua", "cmake"},
  
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
  
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
  
    -- List of parsers to ignore installing (or "all")
    ignore_install = { "javascript" },
  
    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  
    highlight = {
      enable = true,
  
      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,
  
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  },
  {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},
  {"tpope/vim-sleuth"},
  { 'mg979/vim-visual-multi'},
  { 'lambdalisue/suda.vim'},
  { 'numToStr/Comment.nvim', lazy = false, opts = { } },
  {"doums/darcula"},
  {'romgrk/barbar.nvim',
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
	animation = false,
	insert_at_start = true,
	icons = { filetype = { enabled = false } }
    },
  },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } }
}
-- TODO: Path completion:
-- https://github.com/hrsh7th/nvim-cmp
-- TODO: File explorer sidebar:
-- https://github.com/nvim-tree/nvim-tree.lua

-- Color scheme:
vim.cmd 'colorscheme darcula'
vim.cmd 'set termguicolors'

-- Multi-cursor:
-- https://github.com/mg979/vim-visual-multi/wiki/Highlight-colors
vim.cmd "let g:VM_theme = 'codedark'"
-- Disable default <C-n> keybinding:
vim.cmd "let g:VM_maps = {}"
vim.cmd "let g:VM_maps['Find Under'] = {}"
vim.cmd "let g:VM_maps['Find Subword Under'] = {}"

-- Show line numbers by default:
vim.cmd 'set number'

-- Other vim options:
-- TODO: Document
vim.cmd 'set expandtab'
vim.cmd 'set tabstop=4'
vim.cmd 'set softtabstop=4'
vim.cmd 'set shiftwidth=4'
vim.cmd 'set nowrap'
vim.cmd 'set noswapfile'
vim.cmd 'set nobackup'
vim.cmd 'set undodir=~/.vim/undodir' -- Make sure it exists
vim.cmd 'set autowriteall'
vim.cmd 'set noerrorbells'
vim.cmd 'set nu'
vim.cmd 'set undofile'
vim.cmd 'set incsearch'
vim.cmd 'set smartindent'
vim.cmd 'set smartcase'
vim.cmd 'set completeopt=menu,menuone,noselect'
vim.cmd 'set shortmess=I' -- Read :help shortmess for everything else.

-- Keymaps
-- TODO: Split into multiple files
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Cancel search highlighting with ESC:
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Join lines - make it both Ctrl-Shift-J and Ctrl-J (default):
keymap("i", "<C-J>", "<Esc><S-j>k<CR>i", default_opts)
keymap("n", "<C-J>", "<S-j>", default_opts)

-- Duplicate lines:
keymap("n", "<C-D>", "yyp", default_opts)
keymap("i", "<C-D>", "<Esc>yyp i", default_opts)
keymap("v", "<C-D>", "y'>p", default_opts)

-- Tabs - Move to previous/next:
keymap("n", "<A-Left>", "<Cmd>BufferPrevious<CR>", default_opts)
keymap("n", "<A-Right>", "<Cmd>BufferNext<CR>", default_opts)
keymap("i", "<A-Left>", "<Cmd>BufferPrevious<CR>", default_opts)
keymap("i", "<A-Right>", "<Cmd>BufferNext<CR>", default_opts)
keymap("v", "<A-Left>", "<Cmd>BufferPrevious<CR>", default_opts)
keymap("v", "<A-Right>", "<Cmd>BufferNext<CR>", default_opts)

-- Tabs - Close buffer:
keymap("n", "<C-w>", "<Cmd>BufferClose<CR>", default_opts)
keymap("i", "<C-w>", "<Cmd>BufferClose<CR>", default_opts)
keymap("v", "<C-w>", "<Cmd>BufferClose<CR>", default_opts)

-- Comment:
-- FIXME: Visual mode not working properly
--keymap("n", "<C-_>", "gcc", default_opts)
-- keymap("i", "<C-_>", "<Esc>gcc i", default_opts)
--keymap("v", "<C-_>", "gc", default_opts)
vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
vim.keymap.set("v", "<C-_>", function() require('Comment.api').toggle.linewise() end, { noremap = true, silent = true })
vim.keymap.set("i", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })

-- Copy/Paste:
keymap("n", "<C-v>", "p", default_opts)
keymap("i", "<C-v>", "<Esc>pi", default_opts)
keymap("v", "<C-c>", "y<Esc>", default_opts)
keymap("v", "<C-x>", "d<Esc>", default_opts)

-- Revert:
keymap("n", "<C-z>", "u", default_opts)
keymap("i", "<C-z>", "<Esc>ui", default_opts)

-- Delete-a-word macro:
keymap("n", "<M-d>", "daw", default_opts)
keymap("i", "<M-d>", "<Esc>dawi", default_opts)

-- Delete to the left/right of the cursor:
keymap("n", "<C-u>", "d0", default_opts)
keymap("n", "<C-k>", "D", default_opts)

-- Telescope:
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-N>', builtin.find_files, {}) -- Find file
vim.keymap.set('n', '<C-F>', builtin.live_grep, {})

-- Removing one level of indentation:
keymap("n", "<S-Tab>", "<<", default_opts)
keymap("i", "<S-Tab>", "<Esc> << i", default_opts)

-- Jump to file under cursor:
keymap("n", "<C-b>", "gf", default_opts)
keymap("i", "<C-b>", "gf", default_opts)

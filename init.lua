--           ███                            ████                                              ███                                                             ██████   ███          
--          ░░░                            ░░███                                             ░░░                                                             ███░░███ ░░░           
--   █████  ████  █████████████   ████████  ░███   ██████             ████████   █████ █████ ████  █████████████               ██████   ██████  ████████    ░███ ░░░  ████   ███████
--  ███░░  ░░███ ░░███░░███░░███ ░░███░░███ ░███  ███░░███ ██████████░░███░░███ ░░███ ░░███ ░░███ ░░███░░███░░███  ██████████ ███░░███ ███░░███░░███░░███  ███████   ░░███  ███░░███
-- ░░█████  ░███  ░███ ░███ ░███  ░███ ░███ ░███ ░███████ ░░░░░░░░░░  ░███ ░███  ░███  ░███  ░███  ░███ ░███ ░███ ░░░░░░░░░░ ░███ ░░░ ░███ ░███ ░███ ░███ ░░░███░     ░███ ░███ ░███
--  ░░░░███ ░███  ░███ ░███ ░███  ░███ ░███ ░███ ░███░░░              ░███ ░███  ░░███ ███   ░███  ░███ ░███ ░███            ░███  ███░███ ░███ ░███ ░███   ░███      ░███ ░███ ░███
--  ██████  █████ █████░███ █████ ░███████  █████░░██████             ████ █████  ░░█████    █████ █████░███ █████           ░░██████ ░░██████  ████ █████  █████     █████░░███████
-- ░░░░░░  ░░░░░ ░░░░░ ░░░ ░░░░░  ░███░░░  ░░░░░  ░░░░░░             ░░░░ ░░░░░    ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░             ░░░░░░   ░░░░░░  ░░░░ ░░░░░  ░░░░░     ░░░░░  ░░░░░███
--                                ░███                                                                                                                                      ███ ░███
--                                █████                                                                                                                                    ░░██████ 
--                               ░░░░░                                                                                                                                      ░░░░░░  

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.termguicolors = true

-- Install package manager
-- https://github.com/folke/lazy.nvim
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- TODO: Document what each plugin does and why I have it.
require('lazy').setup({
  --
  -- # THEME & VISUAL #
  --
  require('plugins.alpha'),
  require('plugins.onedark'),
  require('plugins.barbeque'),
  require('plugins.indent-blankline'),
  require('plugins.lualine'),
  require('plugins.which-key'),
  require('plugins.vim-razor'),

  --
  -- # TWEAKS & ADDITIONAL FEATURES #
  --
  require('plugins.vim-sleuth'),
  require('plugins.comment'),
  require('plugins.toggleterm'),
  require('plugins.copilot'),
  require('plugins.oil'),
  require('plugins.todo-comments'),
  require('plugins.trouble'),
  require('plugins.flash'),
  require('plugins.conjure'),
  --require('plugins.dadbod'),

  --
  -- # GIT RELATED PLUGINS #
  --
  require('plugins.vim-fugitive'),
  require('plugins.vim-rhubarb'),
  require('plugins.gitsigns'),

  --
  -- # LSP PLUGINS #
  --
  require('plugins.nvim-lspconfig'),
  require('plugins.nvim-cmp'),
  require('plugins.telescope'),
  require('plugins.fzf-native'),
  require('plugins.treesitter'),
  }, {})

require('config.keybinds')
require('config.lsp')
require('config.options')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

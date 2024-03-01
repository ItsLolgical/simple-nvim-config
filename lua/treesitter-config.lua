-- [nfnl] Compiled from treesitter-config.fnl by https://github.com/Olical/nfnl, do not edit.
local treesitter_config
local function _1_()
  local config = require("nvim-treesitter.configs")
  return config.setup({ensure_installed = {"c_sharp", "css", "fennel", "html", "javascript", "json", "latex", "lua", "markdown", "markdown_inline", "python", "typescript", "vimdoc", "vim"}, highlight = {enable = true}, indent = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "<c-space>", node_incremental = "<c-space>", scope_incremental = "<c-s>", node_decremental = "<M-space>"}}, textobjects = {select = {enable = true, lookahead = true, keymaps = {aa = "@parameter.outer", ac = "@class.outer", af = "@function.outer", ia = "@parameter.inner", ic = "@class.inner", ["if"] = "@function.inner"}}}, move = {enable = true, set_jumps = true, goto_next_start = {["]m"] = "@function.outer", ["]]"] = "@class.outer"}, goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"}, goto_previous_start = {["[m"] = "@function.outer", ["[]"] = "@class.outer"}, goto_previous_end = {["[M"] = "@function.outer", ["[["] = "@class.outer"}}, swap = {enable = true, swap_next = {["<leader>a"] = "@parameter.inner"}, swap_previous = {["<leader>A"] = "@parameter.inner"}}, auto_install = false})
end
treesitter_config = {"nvim-treesitter/nvim-treesitter", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"}, build = ":TSUpdate", config = _1_}
return treesitter_config

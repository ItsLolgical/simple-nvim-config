-- [nfnl] Compiled from lsp-config.fnl by https://github.com/Olical/nfnl, do not edit.
local function on_attach(_, bufnr)
  local function nmap(keys, func, desc)
    if desc then
      desc = ("LSP: " .. desc)
    else
    end
    return vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
  end
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", (require("telescope.builtin")).lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", (require("telescope.builtin")).lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", (require("telescope.builtin")).lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  local function _2_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  nmap("<leader>wl", _2_, "[W]orkspace [L]ist Folders")
  local function _3_(_0)
    vim.lsp.buf.format()
    return {desc = "Format current buffer with LSP"}
  end
  return vim.api.nvim_buf_create_user_command(bufnr, "Format", _3_)
end
local servers = {lua_ls = {Lua = {telemetry = {enable = false}, workspace = {checkThirdParty = false}}}}
do end (require("neodev")).setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = (require("cmp_nvim_lsp")).default_capabilities(capabilities)
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({ensure_installed = vim.tbl_keys(servers)})
local function _4_(server_name)
  return ((require("lspconfig"))[server_name]).setup({capabilities = capabilities, filetypes = ((servers[server_name] or {})).filetypes, on_attach = on_attach, settings = servers[server_name]})
end
return mason_lspconfig.setup_handlers({_4_})

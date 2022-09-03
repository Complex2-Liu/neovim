local lspconfig_present, lspconfig = pcall(require, "lspconfig")

if not lspconfig_present then
  return
end

local cmp_nvim_lsp_present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_nvim_lsp_present then
  return
end

local servers = {
  "clangd",
  "sumneko_lua",
  "texlab",
  "ltex",
}

local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr }
  local lsp_keybinds = require("core.mappings").lspconfig
  local set_keymaps = require("core.utils").set_keymaps

  for _, value in pairs(lsp_keybinds) do
    for keybind, mapping_info in pairs(value) do
      set_keymaps(keybind, mapping_info, bufopts)
    end
  end
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

require("ui.lsp")

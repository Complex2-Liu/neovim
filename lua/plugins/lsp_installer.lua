local present, lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
   return
end

-- See https://github.com/williamboman/nvim-lsp-installer#user-content-default-configuration
local options = {
  ui = {
    icons = {
      server_installed = " ",
      server_pending = " ",
      server_uninstalled = " ﮊ",
    },
  },
}

lsp_installer.setup(options)

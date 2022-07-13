vim.cmd "packadd packer.nvim"

local plugins = {
  -- Packer can manage itself
  { "wbthomason/packer.nvim" },
  
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    opt = true,
  },
}

require("core.plugin-manager").load_plugins(plugins)

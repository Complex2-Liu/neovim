vim.cmd "packadd packer.nvim"

local plugins = {
  -- Packer can manage itself
  { "wbthomason/packer.nvim" },
  
}

require("core.plugin-manager").load_plugins(plugins)

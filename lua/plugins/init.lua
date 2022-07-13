vim.cmd "packadd packer.nvim"

local plugins = {
  -- Packer can manage itself
  { "wbthomason/packer.nvim" },

  -- LuaSnip and cmp stuff
  { "L3MON4D3/LuaSnip" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.completion")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",  -- load this plugin just before starting Insert mode
  },
  {
    "saadparwaiz1/cmp_luasnip",
    after = "friendly-snippets",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  },
  {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lua",
  },
  {
    "hrsh7th/cmp-path",
    after = "cmp-buffer",
  },
  
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    opt = true,
  },
}

require("core.plugin-manager").load_plugins(plugins)

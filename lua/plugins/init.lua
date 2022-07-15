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
    event = "InsertEnter", -- load this plugin just before starting Insert mode
  },
  {
    "saadparwaiz1/cmp_luasnip",
    after = "friendly-snippets",
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    after = "cmp_luasnip",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp-nvim-lsp-signature-help",
  },
  {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lua",
  },
  {
    "hrsh7th/cmp-path",
    after = "cmp-buffer",
  },

  -- Lsp stuff
  {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("plugins.lsp_installer")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lspconfig")
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end
  },
  { "nvim-treesitter/playground" },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.whichkey")
    end,
  },

  -- indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    config = function()
      require("ui.indent_blankline")
    end,
  },

  -- colorscheme
  {
    "folke/tokyonight.nvim",
    opt = true,
  },
}

require("core.plugin-manager").load_plugins(plugins)

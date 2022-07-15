local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

-- See `:h nvim-treesitter-modules`
-- All modules of treesitter are disabled by default
local options = {
  ensure_installed = {
    "lua",
    "query",
  },

  -- See `:h nvim-treesitter-highlight-mod`
  highlight = {
    -- When `enable` is true, this will enable the module for all supported languages,
    enable = true,
    -- disable the module for some languages in the list below
    disable = { "cpp" },
  },

  indent = {
    enable = true,
    disable = { "cpp" },
  },

  -- See https://github.com/nvim-treesitter/playground
  playground = {
    enable = true,
  }
}

treesitter.setup(options)

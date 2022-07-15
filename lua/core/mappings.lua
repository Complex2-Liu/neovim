local M = {}

vim.g.mapleader = " "

M.general = {
  n = {
    -- Better window movement
    ["<C-h>"] = { "<C-w>h", " window left" },
    ["<C-j>"] = { "<C-w>j", " window down" },
    ["<C-k>"] = { "<C-w>k", " window up" },
    ["<C-l>"] = { "<C-w>l", " window right" },

    -- Resize window with arrows
    ["<C-Up>"]    = { "<cmd> resize +2 <cr>", "increase current window height by 2" },
    ["<C-Down>"]  = { "<cmd> resize -2 <cr>", "decrease current window height by 2" },
    ["<C-Left>"]  = { "<cmd> vertical resize -2 <cr>", "decrease current window width by 2" },
    ["<C-Right>"] = { "<cmd> vertical resize +2 <cr>", "increase current window width by 2" },

    -- window split and close
    [","]  = { name = "window realted commands" },
    [",v"] = { "<cmd> vsplit <cr>", "vertically split" },
    [",x"] = { "<cmd> split <cr>", "horizontally split" },
    [",q"] = { "<cmd> close <cr>", "close window" },

    -- better join next line
    ["J"] = { "mzJ`z", "Join next line" },

    -- keep your mouse centered when searching
    ["n"] = { "nzzzv", "next search item" },
    ["N"] = { "Nzzzv", "prev search item" },
  },

  i = {
    -- undo break poin
    [","] = { ",<C-g>u", "" },
    ["."] = { ".<C-g>u", "" },
    ["!"] = { "!<C-g>u", "" },
    ["?"] = { "?<C-g>u", "" },
    [";"] = { ";<C-g>u", "" },
    [":"] = { ":<C-g>u", "" },
  },

  v = {
    -- moving lines up or down
    -- See https://vim.fandom.com/wiki/Moving_lines_up_or_down
    ["J"] = { ":move '>+1<cr>gv=gv", "move selected text up" },
    ["K"] = { ":move '<-2<cr>gv=gv", "move selected text down" },

    -- better indenting at visual mode
    [">"] = { ">gv", "right indent" },
    ["<"] = { "<gv", "left indent" },

    -- substitution
    ["S"] = { ":s//g<Left><Left>", "perform substitution over selected region", opts = { silent = false } },

    -- period command
    ["."] = { ":normal .<cr>", "perform period commands over selected region" },
  },
}

local set_keymaps = require("core.utils").set_keymaps

-- Load all mappings
for _, section in pairs(M) do
  for current_mode, mode_values in pairs(section) do
    local opts = { mode = current_mode }
    for keybind, mapping_info in pairs(mode_values) do

      if mapping_info.opts ~= nil then
        opts.silent = mapping_info.opts.silent
        mapping_info.opts = nil
      end

      set_keymaps(keybind, mapping_info, opts)
    end
  end
end

return M

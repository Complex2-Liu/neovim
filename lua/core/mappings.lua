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

    -- quickfix list and location list
    ["[q"] = { "<cmd> cprev <cr>", "quickfix previous item" },
    ["]q"] = { "<cmd> cnext <cr>", "quickfix next item" },
    ["[l"] = { "<cmd> lprev <cr>", "location list previous item" },
    ["]l"] = { "<cmd> lnext <cr>", "location list next item" },
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

M.lspconfig = {
  n = {
    ["gD"] = {
      function() vim.lsp.buf.declaration() end,
      "   lsp declaration",
    },

    ["gd"] = {
      function() vim.lsp.buf.definition() end,
      "   lsp definition",
    },

    ["K"] = {
      function() vim.lsp.buf.hover() end,
      "   lsp hover",
    },

    ["gi"] = {
      function() vim.lsp.buf.implementation() end,
      "   lsp implementation",
    },

    ["gr"] = {
      function() vim.lsp.buf.references() end,
      "   lsp references",
    },

    ["<Leader>ls"] = {
      function() vim.lsp.buf.signature_help() end,
      "   lsp signature_help",
    },

    ["<Leader>D"] = {
      function() vim.lsp.buf.type_definition() end,
      "   lsp type definition",
    },

    ["<Leader>rn"] = {
      function() vim.lsp.buf.rename() end,
      "   lsp rename all references",
    },

    ["<Leader>fm"] = {
      function() vim.lsp.buf.formatting() end,
      "   lsp formatting",
    },

    ["<Leader>ca"] = {
      function() vim.lsp.buf.code_action() end,
      "   lsp code_action",
    },

    ["<Leader>w"] = { name = "lsp workspace commands" },
    ["<Leader>wa"] = {
      function() vim.lsp.buf.add_workspace_folder() end,
      "   add workspace folder",
    },

    ["<Leader>wr"] = {
      function() vim.lsp.buf.remove_workspace_folder() end,
      "   remove workspace folder",
    },

    ["<Leader>wl"] = {
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      "   list workspace folders",
    },

    -- diagnostic
    ["[d"] = {
      function() vim.diagnostic.goto_prev() end,
      "   goto prev",
    },

    ["]d"] = {
      function() vim.diagnostic.goto_next() end,
      "   goto next",
    },

    ["<Leader>e"] = {
      function() vim.diagnostic.open_float() end,
      "   floating diagnostic",
    },

    ["<Leader>q"] = {
      function() vim.diagnostic.setloclist() end,
      "   diagnostic setloclist",
    },
  },
}

M.treesitter = {
  n = {
    ["<Leader>ts"] = { name = "treesitter related commands" },

    ["<Leader>tsp"] = {
      "<cmd> TSPlaygroundToggle <cr>",
      "toggle treesitter playground"
    },

    ["<Leader>tsh"] = {
      "<cmd> TSHighlightCapturesUnderCursor <cr>",
      "show treesitter and syntax highlight groups under the cursor",
    },
  },
}

M.file_explorer = {
  n = {
    ["<F1>"] = { "<cmd> NvimTreeFocus <cr>", "   focus file explorer" },
    ["<F2>"] = { "<cmd> NvimTreeToggle <cr>", "   toggle file explorer" },
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

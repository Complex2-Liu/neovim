local M = {}

local wk_present, wk = pcall(require, "which-key")

if wk_present then
  M.set_keymaps = function(keybind, mapping_info, opts)
    wk.register({ [keybind] = mapping_info }, opts)
  end
else
  M.set_keymaps = function(keybind, mapping_info, opts)
    local mode = opts.mode
    opts.mode = nil
    vim.keymap.set(mode, keybind, mapping_info[1], opts)
  end
end

return M

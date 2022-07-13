local colorscheme = "tokyonight"
local colorscheme_package = colorscheme .. ".nvim"

local status_ok, _ = pcall(vim.cmd, "packadd " .. colorscheme_package)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
else
  vim.cmd("colorscheme " .. colorscheme)
end

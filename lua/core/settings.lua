local options = {
  -- enable number and relative number
  number = true,
  relativenumber = true,

  mouse = "a",  -- enable mouse support for all mode

  -- replace <Tab> by appropriate number of spaces
  -- To insert a real <Tab>, use <CTRL-V> + <Tab>
  expandtab = true,
  tabstop = 2,  -- number of spaces that a <Tab> counts for
  shiftwidth = 2,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

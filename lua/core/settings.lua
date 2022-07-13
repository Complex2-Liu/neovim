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

  -- menuone: Use the popup menu also when there is only one match
  -- noselect: Do not select a match in the menu, force the user to select one from the menu
  -- This is used by cmp
  completeopt = "menuone,noselect",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

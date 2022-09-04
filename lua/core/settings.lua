local options = {
  -- enable number and relative number
  number = true,
  relativenumber = true,

  mouse = "a",  -- enable mouse support for all mode
  cursorline = true, -- highlight the current line
  showmode = false, -- disable showing mode status

  -- Minimal number of screen lines to keep above and below the cursor
  scrolloff = 8,
  sidescrolloff = 8,

  -- The value of this option influences when the last window will have a status line
  -- 3: always and ONLY the last window (required nvim >= 0.7)
  laststatus = 3,

  -- replace <Tab> by appropriate number of spaces
  -- To insert a real <Tab>, use <CTRL-V> + <Tab>
  expandtab = true,
  tabstop = 2,  -- number of spaces that a <Tab> counts for
  shiftwidth = 2,

  -- Time in milliseconds to wait for a mapped sequence to complete
  -- This is used by which-key plugin
  timeoutlen = 500,

  -- menuone: Use the popup menu also when there is only one match
  -- noselect: Do not select a match in the menu, force the user to select one from the menu
  -- This is used by cmp
  completeopt = "menuone,noselect",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

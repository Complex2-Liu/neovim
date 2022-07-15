local present, wk = pcall(require, "which-key")

if not present then
  return
end

local options = {
  window = {
    border = "single", -- none | single | double | shadow
  },
}

wk.setup(options)

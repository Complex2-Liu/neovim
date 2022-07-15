local present, blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local options = {
  -- See `:h indent_blankline`
  show_current_context = true,
  show_current_context_start = true,

  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
}

blankline.setup(options)

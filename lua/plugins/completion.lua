local cmp_present, cmp = pcall(require, "cmp")

if not cmp_present then
  return
end

local luasnip_present, luasnip = pcall(require, "luasnip")

if not luasnip_present then
  return
end

local options = {
  -- specify a snippet engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    -- Make the completion window bordered
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true,
  },

  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(), -- Invoke completion
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      select = false, -- if true, nvim-cmp will automatically select the first item
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",  -- specify the modes the mapping should be active in
      "s",  -- i = insert mode, c = command mode, s = select mode
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  -- The order of the sources determines their order in the completion results
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
  },

  -- See https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
  formatting = {
    format = function(entry, vim_item)
      local icons = require("ui.icons").lspkind

      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

      vim_item.menu = ({
        luasnip = "[Snippet]",
        nvim_lsp = "[LSP]",
        nvim_lsp_signature_help = "[LSP Signature]",
        nvim_lua = "[Nvim Lua]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]

      return vim_item
    end,
  },
}

cmp.setup(options)

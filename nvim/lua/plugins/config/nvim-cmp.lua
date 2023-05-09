local M = {}

function M.opts()
  local cmp = require("cmp")
  return {
    completion = {
      completeopt = "menu, menuone, noinsert"
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<cr>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
    formatting = {
      format = function(_, item)
        local icons = icons.kind
        if icons[item.kind] then
          item.kind = icons[item.kind]
        end
        return item
      end
    },
    experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    },
  }
end

return M

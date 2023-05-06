local M = {}

M.dependencies = {
  { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
  "mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "hrsh7th/cmp-nvim-lsp",
    cond = function()
      return require("lazy.core.config").plugins["nvim-cmp"] ~= nil
    end,
  },
}

M.opts = {
  diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●"
    },
    severity_sort = true,
  }
}

function M.config(_, opts)
  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
  require("lspconfig").pyright.setup(opts)
  require("lspconfig").lua_ls.setup(opts)
end

return M

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
      prefix = icons.ui.Prefix
    },
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError }
      }
    },
    severity_sort = true,
    capabilities = {},
    autoformat = true,
    -- format options can find in :h vim.lsp.buf.format
    format = {
      formatting_options = nil,
      timeout_ms = nil
    },
  },
}

function M.config(_, opts)
  local icon_names = { "Error", "Warn", "Info", "Hint" }
  for _, name in ipairs(icon_names) do
    local icon_name = name
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icons.diagnostics["Bold" .. icon_name], texthl = name, numhl = "" })
  end
  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
  -- 加载服务 默认加载 lua go bash python
  require("lspconfig").pyright.setup(opts)
  require("lspconfig").lua_ls.setup(opts)
end

return M

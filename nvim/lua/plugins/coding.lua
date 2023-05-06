return {
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = require("plugins.config.nvim-lspconfig").config,
    dependencies = require("plugins.config.nvim-lspconfig").dependencies,
    opts = require("plugins.config.nvim-lspconfig").opts,
  },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
}

return {
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    opts = require("plugins.config.mason").opts,
    keys = require("plugins.config.mason").keys,
    config = require("plugins.config.mason").config,
  },

  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      { "<leader>ps", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>pS", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    },
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event="VeryLazy"}
}

return {
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
}

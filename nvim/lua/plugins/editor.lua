return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    cmd = "Neotree",
    keys = require("plugins.config.neotree").keys,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = require("plugins.config.neotree").opts,
  },

  -- search/replace in muliple files
  {
    "nvim-pack/nvim-spectre",
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    keys = require("plugins.config.telescope").keys,
    opts = require("plugins.config.telescope").opts,
  },

  -- eaisly jump to any loaction
  {
    "ggandor/leap.nvim",
    keys = require("plugins.config.leap").keys,
    config = require("plugins.config.leap").config,
  },

  -- enhanced f/t motions
  {
    "ggandor/flit.nvim",
    opts = require("plugins.config.flit").opts,
    keys = require("plugins.config.flit").keys
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.config.gitsigns").opts
  },
}

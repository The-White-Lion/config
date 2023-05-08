return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    cmd = "Neotree",
    keys = require("plugins.config.neotree").keys,
    opts = require("plugins.config.neotree").opts,
    init = require("plugins.config.neotree").init,
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

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.config.gitsigns").opts
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile"},
    opts = require("plugins.config.illuminate").opts,
    config = require("plugins.config.illuminate").config,
    keys = require("plugins.config.illuminate").keys,
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer" },
    },
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require("plugins.config.which-key").opts,
    config = require("plugins.config.which-key").config,
  },
}

return {

  -- indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = icons.ui.LineMiddle,
      filetype_exclude = { "hlep", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_current_context = false,
      show_trailing_blankline_indent = false,
    }
  },

  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    opts = {
      symbol = icons.ui.LineMiddle,
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = require("plugins.config.lualine").opts,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = require("plugins.config.bufferline").opts,
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui component
  { "MunifTanjim/nui.nvim",        lazy = true },
}

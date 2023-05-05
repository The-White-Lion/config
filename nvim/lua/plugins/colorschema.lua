return {
  {
    "folke/tokyonight.nvim",
    -- "morhetz/gruvbox",
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-night]])
      -- vim.cmd([[colorscheme catppuccin]])
    end,
  },
}

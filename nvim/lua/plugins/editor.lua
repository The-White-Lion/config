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
}

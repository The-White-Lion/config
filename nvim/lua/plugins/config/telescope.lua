local M = {}


-- Todo search in cwd/root{
M.keys = {
  { "<leader>ff", "<cmd>Telescope find_files<CR>",                desc = "Find Files" },
  { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                  desc = "Recent Files" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>",                   desc = "Buffers" },
  { "<leader>fm", "<cmd>Telescope marks<CR>",                     desc = "Jump To Mark" },
  { "<leader>fs", "<cmd>Telescope grep_string<CR>",               desc = "Word" },
  { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Serach In Current Buffer" },
  { "<leader>sr", "<cmd>Telescope registers<CR>",                 desc = "Serach In Current Buffer" },
  { "<leader>sc", "<cmd>Telescope command_history<CR>",           desc = "Command History" },
  { "<leader>st", "<cmd>Telescope live_grep<CR>",                 desc = "Grep" },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "Git Commits" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "Git Status" },
  {
    "<leader>ss",
    function() require("telescope.builtin").colorscheme({ enable_preview = true }) end,
    desc = "Colorscheme with preview"
  },
}

M.opts = {
  defaults = {
    prompt_prefix = icons.ui.ChevronShortRight .. " ",
    selection_caret = icons.ui.TriangleShortArrowRight,
    mappings = {
      i = {
        ["<C-b>"] = function(...)
          return require("telescope.actions").preview_scrolling_down(...)
        end,
        ["<C-f>"] = function(...)
          return require("telescope.actions").preview_scrolling_up(...)
        end,
        ["<ESC>"] = function(...)
          return require("telescope.actions").close(...)
        end,
      },
      n = {
        ["q"] = function(...)
          return require("telescope.actions").close(...)
        end,
      },
    },
  },
}

return M

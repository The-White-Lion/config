local M = {}


function M.keys()
  return {
    { "<leader>,",  "<cmd>Telescope buffers show_all_buffers=true<CR>", desc = "Switch Buffer" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",                       desc = "Buffers" },
  }
end

M.opts = {}

return M

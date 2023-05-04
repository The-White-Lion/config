local M = {}

M.opts = {
  options = {
    mode = "buffers",
    always_show_bufferline = false,
    modified_icon = icons.git.FileUnstaged,
    close_icon = icons.ui.BoldClose,
    buffer_close_icon = icons.ui.Close,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neo-tree",
        higlight = "Directory",
        text_align = "center",
      },
    }
  },
}

return M

local M = {}

M.opts = {
  mappings = {
    -- Toggle comment (like `gcip` - comment inner paragraph) for both
    -- Normal and Visual modes
    comment = "<leader>/",

    -- Toggle comment on current line
    comment_line = "<leader>/",

    -- Define "comment" textobject (like `dgc` - delete whole comment block)
    textobject = "<leader>/",
  },
  hook = {
    pre = function()
      require("ts_context_commentstring.internal").upadte_commentstring({})
    end
  },
}

function M.config(_, opts)
  require("mini.comment").setup(opts)
end

return M

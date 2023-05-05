local M = {}

M.opts = {
  signs = {
    add = { text = icons.ui.BoldLineLeft },
    change = { text = icons.ui.BoldLineLeft },
    delete = { text = icons.ui.TriangleShortArrowRight },
    topdelete = { text = icons.ui.TriangleShortArrowRight },
    changedelete = { text = icons.ui.TriangleShortArrowRight },
    untracked = { text = icons.ui.BoldLineLeft },
  },
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc})
    end

    -- Navigation
    map("n", "[h", gs.next_hunk, "Next Hunk")
    map("n", "]h", gs.prev_hunk, "Prev Hunk")
    -- Action
    map("v", "<leader>ghs", gs.stage_hunk, "Stage Hunk")
    map("v", "<leader>ghr", gs.reset_hunk, "Reset Hunk")
    map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>ghR", gs.stage_buffer, "Reset Buffer")
    map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
    map("n", "<leader>ghb", gs.blame_line, "Blame Line")
    map("n", "<leader>ghB", function() gs.blame_line({ full = true }) end, "Blame Hunk")
    map("n", "<leader>ghd", gs.diffthis, "Diff This")
    map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~ ")
    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
  end
}

return M

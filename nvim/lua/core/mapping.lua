return {
  normal_mode = {
    ["<Space>"] = "<nop>",
    -- Exit neovim
    ["<leader>q"] = ":q<CR>",
    ["<M-q>"] = ":qa!<CR>",
    -- Save file
    ["<C-s>"] = ":w<CR>",
    -- Better cursor movement
    ["<C-j>"] = "5gj",
    ["<C-k>"] = "5gk",
    ["j"] = "gj",
    ["k"] = "gk",
    ["0"] = "g0",
    ["$"] = "g$",
    ["<leader><CR>"] = "<Cmd>nohl<CR>",
    -- Buffer moving
    ["<leader>bb"] = ":bprev<CR>",
    ["<leader>bn"] = ":bnext<CR>",
    ["<leader>bd"] = "<Cmd>bdelete<CR>",
    -- Window jumping
    ["<C-h>"] = "<C-w>h",
    ["<leader>j"] = "<C-w>j",
    ["<leader>k"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",
    -- Window moving
    ["<leader>H"] = "<C-w>H",
    ["<leader>J"] = "<C-w>J",
    ["<leader>K"] = "<C-w>K",
    ["<leader>L"] = "<C-w>L",
    -- Resize window with arrows
    ["<C-Up>"] = ":resize -2<CR>",
    ["<C-Down>"] = ":resize +2<CR>",
    ["<C-Left>"] = ":vertical resize -2<CR>",
    ["<C-Right>"] = ":vertical resize +2<CR>",
    -- Split window
    ["<leader>sh"] = ":split<CR>",
    ["<leader>sv"] = ":vsplit<CR>",
  },
  insert_mode = {
    ["jk"] = "<esc>",
  },
  visual_mode = {
    ["j"] = "gj",
    ["k"] = "gk",
  },
  command_mode = {
    ["Wq<CR>"] = "wq<CR>",
    ["WQ<CR>"] = "wq<CR>",
  }
}

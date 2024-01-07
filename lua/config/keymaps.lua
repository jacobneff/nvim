local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- directory navigation
keymap.set("n", "<leader>m", ":Oil<CR>", opts)

-- pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- move left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- move down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- move up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- move left

-- indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", {noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", {noremap = false })

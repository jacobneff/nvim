local opts = { noremap = true, silent = true }

-- line selection move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- directory navigation
vim.keymap.set("n", "<leader>m", ":Oil<CR>", opts)

-- pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- move left
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- move down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- move up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- move left

-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- comments

vim.api.nvim_set_keymap("n", "<C-/>", "gcc", {noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", {noremap = false })
vim.api.nvim_set_keymap("i", "<C-/>", "<C-c>gcc", {noremap = false })


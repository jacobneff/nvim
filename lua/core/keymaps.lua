local opts = { noremap = true, silent = true }

-- line selection move
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- move left
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- move down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- move up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- move left

-- buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Buffer: go to next" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Buffer: go to previous" })
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<cr>", { desc = "Buffer: go to previous" })
vim.keymap.set("n", "<TAB>", "<cmd>bnext<cr>", { desc = "Buffer: go to next" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Number: increment" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Number: decrement" })

-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- comments
vim.keymap.set("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, opts)

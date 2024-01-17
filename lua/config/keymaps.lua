local opts = { noremap = true, silent = true }

-- line selection move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- directory navigation
vim.keymap.set("n", "-", ":Oil<CR>", opts)

-- pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- move left
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- move down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- move up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- move left

-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })

-- commenting while in insert mode
function ToggleCommentAndAdjustCursor()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local line_was_empty = string.match(vim.api.nvim_get_current_line(), "^%s*$")

	-- Toggling the comment
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	vim.cmd("normal gcc")

	if line_was_empty then
		-- If the line was originally empty, move the cursor to the end of the line and add a space
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("$a ", true, false, true), "n", true)
	else
		-- Otherwise, return the cursor to its original position in insert mode
		local col = cursor_pos[2] + 1 -- Adjusting column position for insert mode
		vim.api.nvim_win_set_cursor(0, { cursor_pos[1], col })
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", true)
	end
end

vim.api.nvim_set_keymap("i", "<C-/>", "<Cmd>lua ToggleCommentAndAdjustCursor()<CR>", { noremap = true, silent = true })

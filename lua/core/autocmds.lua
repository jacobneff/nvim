vim.cmd([[
:command! WQ wq
:command! WQ wq
:command! Wq wq
:command! Wqa wqa
:command! W w
:command! Q q
]])

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("RANVimAutocommands", { clear = true })

autocmd({ "BufEnter", "BufWinEnter", "TermOpen" }, {
  group = augroup,
  pattern = { "term://*", "shell" },
  command = "startinsert",
})

--  jump to the last place you’ve visited in a file before exiting
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- only highlight when searching
autocmd("CmdlineEnter", {
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == "/" or cmd == "?" then
      vim.opt.hlsearch = true
    end
  end,
})

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

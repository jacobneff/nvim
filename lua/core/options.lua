-- tab / indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- don't ignore case with capitals
vim.opt.hlsearch = false

-- appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1 -- might like this
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- vim.opt.colorcolumn = "80"

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = "⸱",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- behavior
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir")
vim.opt.undofile = true
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = false
-- vim.opt.iskeyword:append("-")
vim.opt.mouse:append("a")
vim.opt.clipboard = "unnamedplus"
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

vim.opt.conceallevel = 2
vim.opt.spelllang = { "en" }

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

local opt = vim.opt

-- tab / indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true -- don't ignore case with capitals
opt.hlsearch = false

-- appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.completeopt = "menuone,noinsert,noselect"
opt.list = true

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
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
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.nvim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
-- opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard = "unnamedplus"
opt.modifiable = true
opt.encoding = "UTF-8"

opt.conceallevel = 2 -- hide * markup for bold and italic
opt.spelllang = { "en" }

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

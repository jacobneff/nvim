local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.localleader = " "

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins/lsp" },
}, {
  install = { colorscheme = { "rose-pine" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  performance = {
    cache = { enabled = true },
    rtp = { disabled_plugins = { "gzip", "matchit", "matchparen", "netrwPlugin", "tohtml", "tutor", "zipPlugin" } },
  },
})

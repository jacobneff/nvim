return {
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "https://github.com/windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = { enable = true, additional_vim_regex_highlighting = true },
        indent = { enable = true },
        autotag = { enable = true },
        auto_install = true,
        ensure_installed = {
          "lua",
          "css",
          "scss",
          "html",
          "vue",
          "javascript",
          "json",
          "typescript",
          "tsx",
          "astro",
          "markdown",
          "markdown_inline",
          "gitignore",
          "gitcommit",
        },
      })
    end,
  },
}

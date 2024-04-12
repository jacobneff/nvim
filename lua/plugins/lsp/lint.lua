return {
  "https://github.com/mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      astro = { "eslint_d" },
      js = { "eslint_d" },
      cjs = { "eslint_d" },
      mjs = { "eslint_d" },
      ts = { "eslint_d" },
      tsx = { "eslint_d" },
      vue = { "eslint_d" },
      cpp = { "cpplint" },
    }
  end,
}

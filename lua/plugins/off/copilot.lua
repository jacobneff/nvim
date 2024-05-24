return {
  "zbirenbaum/copilot.lua",
  lazy = false,
  enabled = true,
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false,
        debounce = 75,
        keymap = {
          accept = "<C-y>",
          dismiss = "<C-x>",
        },
      },
    })
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if cmp_status_ok then
      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end
  end,
}

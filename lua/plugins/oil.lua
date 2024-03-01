return {
  "stevearc/oil.nvim",
  keys = { { "-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory" } },
  lazy = false,
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    float = {
      max_height = 25,
      max_width = 60,
    },
    keymaps = {
      ["q"] = "actions.close",
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-r>"] = "actions.refresh",
      ["g."] = "actions.toggle_hidden",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

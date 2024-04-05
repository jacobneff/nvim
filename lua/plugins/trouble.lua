return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open/close workspace diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open/close document diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open/close quickfix" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open/close loclist" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open/close todo list" },
  },
  -- opts - {},
}

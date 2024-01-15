return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false;
    dependencies = { 
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            },
        })

        telescope.load_extension("fzf");

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "fuzzy find recent files" })
        keymap.set("n", "<leader>fa", ":Telescope <CR>", { desc = "telescope commands" })
        keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "grep in cwd" })
        keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "grep under cursor in cwd" })

    end
}

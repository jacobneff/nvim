return {
    "https://github.com/nvimtools/none-ls.nvim",
    cmd = { "NullLsLog", "NullLsInfo" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "https://github.com/nvim-lua/plenary.nvim" },
    keys = {
    -- stylua: ignore start
    { "<leader>cf", function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, mode = { "n", "v" }, desc = "Format Injected Langs" },
        -- stylua: ignore end
    },
    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        null_ls.setup({
            debug = false,
            sources = {
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "astro" } }),
                -- null_ls.builtins.diagnostics.eslint_d.with({
                --   diagnostics_format = "[eslint] #{m}\n(#{c})",
                --   extra_filetypes = { "astro" },
                -- }),
                -- null_ls.builtins.code_actions.eslint_d,
            },
            -- configure format on save
            on_attach = function(current_client, bufnr)
                if current_client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    --  only use null-ls for formatting instead of lsp server
                                    return client.name == "null-ls"
                                end,
                                bufnr = bufnr,
                                timeout_ms = 5000,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}

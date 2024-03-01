return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- TODO: not working
        -- local mason_tool_installer = require("mason_tool_installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- lost of servers for mason to install
            ensure_installed = {
                "html",
                "clangd",
                "lua_ls",
                "astro",
            },
            automatic_installation = true,
        })

        -- mason_tool_installer.setup({
        --     ensure_installed = {
        --         "prettierd",
        --         "stylua",
        --     },
        -- })
    end,
}

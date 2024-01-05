local config = function()
    local lspconfig = require("lspconfig")

    -- lua
    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

lspcofig.efm.setup({
    filetypes = {
        "lua",
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true,
    },
    settings = {
        languages = {
            lua = { luacheck, stylua },
        },
    },

    -- format on save
    local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = lsp_fmt_group,
    callback = function()
        local efm = vim.lsp.get_active_client({ name = "efm" })

        if vim.tbl_isempty(efm) then
            return
        end

        vim.lsp.buf.format({ name = "efm" })
    end,
})
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
    },
}

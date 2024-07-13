local null = require("null-ls")
local auto_group = vim.api.nvim_create_augroup("LspFormatting", {})


null.setup({
    sources = {
        null.builtins.formatting.gofmt,
        null.builtins.formatting.goimports_reviser,
        null.builtins.formatting.stylua,
        null.builtins.diagnostics.eslint,
        null.builtins.completion.spell,
    },
    on_attach = function (client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = auto_group,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = auto_group,
                buffer = bufnr,
                callback = function ()
                    vim.lsp.buf.format({bufnr = bufnr})
                end,
            })
        end
        
    end
})

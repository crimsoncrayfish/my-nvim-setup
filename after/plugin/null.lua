local null = require("null-ls")

null.setup({
    sources = {
        null.builtins.formatting.gofmt,
        null.builtins.formatting.goimports_reviser,
        null.builtins.formatting.stylua,
        null.builtins.diagnostics.eslint,
        null.builtins.completion.spell,
    },
})

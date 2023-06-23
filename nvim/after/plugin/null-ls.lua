local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.yamlfix,
        null_ls.builtins.diagnostics.ruff,
    },
})

require("mason-null-ls").setup({
    automatic_setup = true,
})

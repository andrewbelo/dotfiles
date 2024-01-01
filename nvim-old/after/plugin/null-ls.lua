local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,

        -- python
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yamlfix,
        null_ls.builtins.formatting.sqlfmt,

        null_ls.builtins.diagnostics.markdownlint.with({
            extra_filetypes = { "telekasten" },
        }),
        null_ls.builtins.formatting.markdownlint.with({
            extra_filetypes = { "telekasten" },
        }),
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "html", "sql", "json", "yaml", "markdown", "telekasten" },
        })
        ,

        null_ls.builtins.diagnostics.clj_kondo.with({
            filetypes = { "clojure" },
        }),
        null_ls.builtins.formatting.cljstyle.with({
            filetypes = { "clojure" },
        }),
    },
})

require("mason-null-ls").setup({
    automatic_setup = true,
})

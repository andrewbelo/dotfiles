local neodev = vim.F.npcall(require, "neodev")
if neodev then
  neodev.setup {
    override = function(_, library)
      library.enabled = true
      library.plugins = true
    end,
    lspconfig = true,
    pathStrict = true,
  }
end

local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
  return
end

local imap = require("abelo.keymap").tj_imap
local nmap = require("abelo.keymap").tj_nmap
local autocmd = require("abelo.auto").autocmd
local autocmd_clear = vim.api.nvim_clear_autocmds

local telescope_mapper = require "abelo.telescope.mappings"
local handlers = require "abelo.lsp.handlers"

local ts_util = require "nvim-lsp-ts-utils"
local inlays = require "abelo.lsp.inlay"

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
local augroup_codelens = vim.api.nvim_create_augroup("custom-lsp-codelens", { clear = true })

local filetype_attach = setmetatable({
  ocaml = function()
    -- Display type information
    autocmd_clear { group = augroup_codelens, buffer = 0 }
    autocmd {
      { "BufEnter", "BufWritePost", "CursorHold" },
      augroup_codelens,
      require("abelo.lsp.codelens").refresh_virtlines,
      0,
    }

    vim.keymap.set(
      "n",
      "<leader>tt",
      require("abelo.lsp.codelens").toggle_virtlines,
      { silent = true, desc = "[T]oggle [T]ypes", buffer = 0 }
    )
  end,

  rust = function()
    telescope_mapper("<leader>wf", "lsp_workspace_symbols", {
      ignore_filename = true,
      query = "#",
    }, true)
  end,
}, {
  __index = function()
    return function() end
  end,
})

local buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  nmap(opts)
end

local buf_inoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  imap(opts)
end

local custom_attach = function(client, bufnr)
  if client.name == "copilot" then
    return
  end

  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }

  buf_nnoremap { "<leader>cr", vim.lsp.buf.rename }
  buf_nnoremap { "<leader>ca", vim.lsp.buf.code_action }

  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "gD", vim.lsp.buf.declaration }
  buf_nnoremap { "gT", vim.lsp.buf.type_definition }
  buf_nnoremap { "K", vim.lsp.buf.hover, { desc = "lsp:hover" } }

  buf_nnoremap { "<leader>gI", handlers.implementation }
  buf_nnoremap { "<leader>lr", "<cmd>lua R('abelo.lsp.codelens').run()<CR>" }
  buf_nnoremap { "<leader>rr", "LspRestart" }

  telescope_mapper("gr", "lsp_references", nil, true)
  telescope_mapper("gI", "lsp_implementations", nil, true)
  telescope_mapper("<leader>wd", "lsp_document_symbols", { ignore_filename = true }, true)
  telescope_mapper("<leader>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    autocmd_clear { group = augroup_highlight, buffer = bufnr }
    autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, bufnr }
    autocmd { "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, bufnr }
  end

  if false and client.server_capabilities.codeLensProvider then
    if filetype ~= "elm" then
      autocmd_clear { group = augroup_codelens, buffer = bufnr }
      autocmd { "BufEnter", augroup_codelens, vim.lsp.codelens.refresh, bufnr, once = true }
      autocmd { { "BufWritePost", "CursorHold" }, augroup_codelens, vim.lsp.codelens.refresh, bufnr }
    end
  end

  if filetype == "typescript" or filetype == "lua" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype]()
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

-- Completion configuration
vim.tbl_deep_extend("force", updated_capabilities, require("cmp_nvim_lsp").default_capabilities())
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

local servers = {
  -- Also uses `shellcheck` and `explainshell`
  bashls = true,
  lua_ls = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },

  gdscript = true,
  -- graphql = true,
  html = true,
  jedi_language_server = true,
  vimls = true,
  yamlls = true,

  clojure_lsp = true,

  -- Enable jsonls with json schemas
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },

  -- TODO: Test the other Ruby LSPs?
  -- solargraph = { cmd = { "bundle", "exec", "solargraph", "stdio" } },
  -- sorbet = true,

  cmake = (1 == vim.fn.executable "cmake-language-server"),
  dartls = pcall(require, "flutter-tools"),

  gopls = {
    settings = {
      gopls = {
        codelenses = { test = true },
        hints = inlays and {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        } or nil,
      },
    },

    flags = {
      debounce_text_changes = 200,
    },
  },

  cssls = true,

  -- eslint = true,
  tsserver = {
    init_options = ts_util.init_options,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },

    on_attach = function(client)
      custom_attach(client)

      ts_util.setup { auto_inlay_hints = false }
      ts_util.setup_client(client)
    end,
  },
}

-- Can remove later if not installed (TODO: enable for not linux)
if vim.fn.executable "tree-sitter-grammar-lsp-linux" == 1 then
  vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = { "grammar.js", "*/corpus/*.txt" },
    callback = function()
      vim.lsp.start {
        name = "tree-sitter-grammar-lsp",
        cmd = { "tree-sitter-grammar-lsp-linux" },
        root_dir = "/",
        capabilities = updated_capabilities,
        on_attach = custom_attach,
      }
    end,
  })
end


local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

--[ An example of using functions...
-- 0. nil -> do default (could be enabled or disabled)
-- 1. false -> disable it
-- 2. true -> enable, use defaults
-- 3. table -> enable, with (some) overrides
-- 4. function -> can return any of above
--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, params, client_id, bufnr, config)
--   local uri = params.uri
--
--   vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--       underline = true,
--       virtual_text = true,
--       signs = sign_decider,
--       update_in_insert = false,
--     }
--   )(err, method, params, client_id, bufnr, config)
--
--   bufnr = bufnr or vim.uri_to_bufnr(uri)
--
--   if bufnr == vim.api.nvim_get_current_buf() then
--     vim.lsp.diagnostic.set_loclist { open_loclist = false }
--   end
-- end
--]]

-- Only run stylua when we can find a root dir
require("conform.formatters.stylua").require_cwd = true

require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff" },
    typescript = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf, lsp_fallback = true }
  end,
})

-- require("null-ls").setup {
--   sources = {
--     -- require("null-ls").builtins.formatting.stylua,
--     -- require("null-ls").builtins.diagnostics.eslint,
--     -- require("null-ls").builtins.completion.spell,
--     -- require("null-ls").builtins.diagnostics.selene,
--     require("null-ls").builtins.formatting.prettierd,
--     require("null-ls").builtins.formatting.isort,
--     require("null-ls").builtins.formatting.black,
--   },
-- }

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

local has_metals = pcall(require, "metals")
if has_metals and false then
  local metals_config = require("metals").bare_config()
  metals_config.on_attach = custom_attach

  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }

  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

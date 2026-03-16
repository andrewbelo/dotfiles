return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "abelo.lsp"
    end,
  },

  "simrat39/inlay-hints.nvim",
  { "j-hui/fidget.nvim", branch = "legacy" },
  "folke/neodev.nvim",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "scalameta/nvim-metals",
  "b0o/schemastore.nvim",
  {
    "folke/trouble.nvim",
    config = function()
      local nmap = require("abelo.keymap").nmap
      local wk = require
      nmap("gR", function() require("trouble").toggle("lsp_references") end)
      nmap("<leader>tx", function() require("trouble").toggle() end)
      nmap("<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
      nmap("<leader>td", function() require("trouble").toggle("document_diagnostics") end)
      nmap("<leader>tq", function() require("trouble").toggle("quickfix") end)
      nmap("<leader>tl", function() require("trouble").toggle("loclist") end)
    end
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
    end
  },
  -- Formatting plugin
  "stevearc/conform.nvim",
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-L>', ':<Plug>(copilot-next)', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_node_command = "~/.nvm/versions/node/v20.10.0/bin/node"

      vim.cmd [[
          let g:copilot_enabled = v:false
        ]]
    end,
  }
}

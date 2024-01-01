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
  "folke/trouble.nvim",
  "nvimtools/none-ls.nvim",
  -- Formatting plugin
  "stevearc/conform.nvim",


  { 'github/copilot.vim' }
}

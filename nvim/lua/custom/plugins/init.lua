return {
  { "nvim-lua/plenary.nvim", dev = false },
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local highlight = {
        "CursorColumn",
        "Whitespace",
      }
      require("ibl").setup {
        indent = { highlight = highlight, char = "" },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
        exclude = { filetypes = {
          "lspinfo", "packer", "checkhealth", "help", "man", "gitcommit",
          "TelescopePrompt", "TelescopeResults", "dashboard",
        } }
      }
    end
  },
}

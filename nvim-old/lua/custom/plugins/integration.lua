return {
  { 'tyru/open-browser.vim' },
  { 
    'yoshio15/vim-trello',
    config = function()
      vim.g.vimTrelloApiKey = '2e6d70000df76cf735738a5dbe38c930'
      vim.g.vimTrelloToken = 'da68f2d2b840b6825084c372e61e788076266ad9ffbac95bb3066b277018af74'
    end,
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
    },
    enabled = true,
    build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
    config = function()
      require("gitlab").setup({
          config_path = "~/.config/.gitlab.nvim"
        })
    end,
  },
  {"shumphrey/fugitive-gitlab.vim"},
}

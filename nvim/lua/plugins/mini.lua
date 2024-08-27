return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.align").setup()
      require("mini.bracketed").setup()
      require("mini.comment").setup()
    end,
  },
}

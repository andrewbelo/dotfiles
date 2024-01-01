return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end, 
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "p00f/nvim-ts-rainbow" },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}

return {
  "rest-nvim/rest.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    vim.keymap.set("n", "<Leader>rr", "<Plug>RestNvim")
    vim.keymap.set("n", "<Leader>rp", "<Plug>RestNvimPreview")
    vim.keymap.set("n", "<Leader>rk", "<Plug>RestNvimLast")
    require("rest-nvim").setup({})
  end
}

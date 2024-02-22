return {
  "rest-nvim/rest.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local nmap = require("abelo.keymap").nmap
    nmap("<Leader>rr", "<Plug>RestNvim")
    nmap("<Leader>rp", "<Plug>RestNvimPreview")
    nmap("<Leader>rk", "<Plug>RestNvimLast")
    require("rest-nvim").setup({
    })
  end
}

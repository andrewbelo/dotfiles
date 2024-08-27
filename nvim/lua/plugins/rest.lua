return {
  'mistweaverco/kulala.nvim',
  opts = {},

  config = function()
    local k = require("kulala")
    vim.keymap.set("n", "<Leader>rr", function() k.run() end)
    vim.keymap.set("n", "<Leader>rc", function() k.copy() end)
    vim.keymap.set("n", "<Leader>rp", function() k.jump_prev() end)
    vim.keymap.set("n", "<Leader>rn", function() k.jump_next() end)
    vim.keymap.set("n", "<Leader>ri", function() k.inspect() end)
    k.setup()
  end,
}

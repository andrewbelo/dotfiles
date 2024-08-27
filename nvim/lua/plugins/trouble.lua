return { {
  "folke/trouble.nvim",
  config = function()
    local set = vim.keymap.set
    set("n", "gR", function() require("trouble").toggle("lsp_references") end)
    set("n", "<leader>tx", function() require("trouble").toggle() end)
    set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
    set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
    set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
    set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
  end
} }

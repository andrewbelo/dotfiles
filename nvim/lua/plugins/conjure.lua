return {
  "Olical/conjure", ft = { "clojure", "fennel", "python" }, -- etc
  config = function(_, opts)
    require("conjure.main").main()
    require("conjure.mapping")["on-filetype"]()
  end,
  init = function()
    vim.g["conjure#mapping#doc_word"] = "<leader>K"
  end,
}

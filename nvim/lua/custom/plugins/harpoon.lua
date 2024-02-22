return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      local harpoon = require("harpoon")
      local nmap = require("abelo.keymap").nmap

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      nmap("<leader>a", function() harpoon:list():append() end)
      nmap("<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      for i = 1, 5 do
        nmap(string.format("<space>%s", i), function() harpoon:list():select(i) end)
      end

      -- Toggle previous & next buffers stored within Harpoon list
      nmap("<C-S-P>", function() harpoon:list():prev() end)
      nmap("<C-S-N>", function() harpoon:list():next() end)
    end,
  },
}

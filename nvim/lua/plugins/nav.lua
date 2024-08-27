return {
  {
    'stevearc/oil.nvim',
    opts = {},
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "<Leader>p", "<CMD>Oil<CR>")
      require("oil").setup()
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "kkharji/sqlite.lua",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local set = vim.keymap.set

      require("telescope").setup {
        extensions = {
          wrap_results = true,
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require "telescope.builtin"

      set("n", "<leader>fd", builtin.find_files)
      set("n", "<leader>ft", builtin.git_files)
      set("n", "<leader>fh", builtin.help_tags)
      set("n", "<leader>fb", builtin.buffers)
      set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

      set("n", "<leader>gw", builtin.grep_string)

      set("n", "<leader>fa", function()
        ---@diagnostic disable-next-line: param-type-mismatch
        builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
      end)

      set("n", "<leader>fp", function()
        builtin.find_files { cwd = "~/plugins/" }
      end)
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
      local harpoon = require "harpoon"
      local set = vim.keymap.set
      harpoon:setup()

      set("n", "<m-h><m-m>", function() harpoon:list():append() end)
      set("n", "<m-h><m-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      set("n", "<leader>-", function() harpoon:list():prev() end)
      set("n", "<leader>=", function() harpoon:list():next() end)

      -- Set <space>1..<space>5 be my shortcuts to moving to the files
      for _, idx in ipairs { 1, 2, 3, 4, 5 } do
        vim.keymap.set("n", string.format("<leader>%d", idx), function()
          harpoon:list():select(idx)
        end)
      end
    end,
  }
}

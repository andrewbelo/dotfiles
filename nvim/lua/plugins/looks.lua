return {
  {
    'jesseleite/nvim-noirbuddy',
    dependencies = {
      { 'tjdevries/colorbuddy.nvim' }
    },
    lazy = false,
    priority = 1000,
    opts = {
      -- All of your `setup(opts)` will go here },
      config = function()
        vim.cmd([[colorscheme noirbuddy]])
      end,
    },
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      dependencies = { { 'nvim-tree/nvim-web-devicons' } },
      config = function()
        local api = vim.api
        local keymap = vim.keymap
        local dashboard = require("dashboard")
        local conf = {}
        conf.header = {
          "                                                                                    ",
          " WWWWWWWW                           WWWWWWWWBBBBBBBBBBBBBBBBB      SSSSSSSSSSSSSSS  ",
          " W::::::W                           W::::::WB::::::::::::::::B   SS:::::::::::::::S ",
          " W::::::W                           W::::::WB::::::BBBBBB:::::B S:::::SSSSSS::::::S ",
          " W::::::W                           W::::::WBB:::::B     B:::::BS:::::S     SSSSSSS ",
          "  W:::::W           WWWWW           W:::::W   B::::B     B:::::BS:::::S             ",
          "   W:::::W         W:::::W         W:::::W    B::::B     B:::::BS:::::S             ",
          "    W:::::W       W:::::::W       W:::::W     B::::BBBBBB:::::B  S::::SSSS          ",
          "     W:::::W     W:::::::::W     W:::::W      B:::::::::::::BB    SS::::::SSSSS     ",
          "      W:::::W   W:::::W:::::W   W:::::W       B::::BBBBBB:::::B     SSS::::::::SS   ",
          "       W:::::W W:::::W W:::::W W:::::W        B::::B     B:::::B       SSSSSS::::S  ",
          "        W:::::W:::::W   W:::::W:::::W         B::::B     B:::::B            S:::::S ",
          "         W:::::::::W     W:::::::::W          B::::B     B:::::B            S:::::S ",
          "          W:::::::W       W:::::::W         BB:::::BBBBBB::::::BSSSSSSS     S:::::S ",
          "           W:::::W         W:::::W          B:::::::::::::::::B S::::::SSSSSS:::::S ",
          "            W:::W           W:::W           B::::::::::::::::B  S:::::::::::::::SS  ",
          "             WWW             WWW            BBBBBBBBBBBBBBBBB    SSSSSSSSSSSSSSS    ",
          "                                                                                    ",
          "                                                                                    ",
          "                                                                                    ",
          "                                                                                    ",
        }

        conf.center = {
          {
            icon = "󰈞  ",
            desc = "Go to today note                        ",
            action = ":Telekasten goto_today",
            key = "<Leader> z t",
          },
          {
            icon = "󰈞  ",
            desc = "Find File In Notes                      ",
            action = ":Telekasten find_notes",
            key = "<Leader> z f",
          },
          {
            icon = "󰈞  ",
            desc = "Find File In Git                        ",
            action = ":Telescope git_files",
            key = "<Leader> f t",
          },
          {
            icon = "󰈬  ",
            desc = "Project grep                            ",
            action = ":Telescope live_grep",
            key = "<Leader> f g",
          },
          {
            icon = "  ",
            desc = "Find in vim config                        ",
            action = "",
            key = "<Leader> f i",
          },
          {
            icon = "  ",
            desc = "New file                                ",
            action = "enew",
            key = "e",
          },
          {
            icon = "󰗼  ",
            desc = "Quit Nvim                               ",
            -- desc = "Quit Nvim                               ",
            action = "qa",
            key = "q",
          },
        }

        dashboard.setup({
          theme = 'doom',
          shortcut_type = 'number',
          config = conf
        })

        api.nvim_create_autocmd("FileType", {
          pattern = "dashboard",
          group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
          callback = function()
            keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
            keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
          end
        })
      end,
    },
    {
      "slugbyte/lackluster.nvim",
      lazy = false,
      priority = 1000,
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      local colors = {
        lack = "#708090",
        luster = "#deeeed",
        orange = "#ffaa88",
        green = "#789978",
        blue = "#7788AA",
        red = "#D70000",
        black = "#000000",
        gray1 = "#080808",
        gray2 = "#191919",
        gray3 = "#2a2a2a",
        gray4 = "#444444",
        gray5 = "#555555",
        gray6 = "#7a7a7a",
        gray7 = "#aaaaaa",
        gray8 = "#cccccc",
        gray9 = "#DDDDDD",
      }
      local mytheme = {
        normal = {
          a = { bg = colors.lack, fg = colors.luster, gui = 'bold' },
          b = { bg = colors.gray5, fg = colors.gray8 },
          c = { bg = colors.gray2, fg = colors.gray8 }
        },
        insert = {
          a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
          b = { bg = colors.gray5, fg = colors.gray8 },
          c = { bg = colors.gray2, fg = colors.gray8 }
        },
        visual = {
          a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
          b = { bg = colors.gray5, fg = colors.gray8 },
          c = { bg = colors.gray2, fg = colors.gray8 }
        },
        replace = {
          a = { bg = colors.red, fg = colors.black, gui = 'bold' },
          b = { bg = colors.gray5, fg = colors.gray8 },
          c = { bg = colors.gray2, fg = colors.gray8 }
        },
        command = {
          a = { bg = colors.gray2, fg = colors.luster, gui = 'bold' },
          b = { bg = colors.gray5, fg = colors.gray8 },
          c = { bg = colors.luster, fg = colors.lack },
        },
        inactive = {
          a = { bg = colors.black, fg = colors.gray7, gui = 'bold' },
          b = { bg = colors.gray5, fg = colors.gray8 },
          c = { bg = colors.luster, fg = colors.lack },
        }
      }
      require('lualine').setup({
        options = {
          theme = mytheme,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 4) end } },
          lualine_b = { 'branch', },
          lualine_c = { 'vim.fn.fnamemodify(vim.fn.getcwd(), ":t")' },
          lualine_x = {},
          lualine_y = { "progress" },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        winbar = {
          lualine_a = { 'filename' },
          lualine_b = { "vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')" },
          lualine_c = { 'filetype' },
          lualine_x = { 'diagnostics' },
          lualine_y = { 'selectioncount', 'searchcount' },
          lualine_z = { 'location' }
        },
        inactive_winbar = {},
        extensions = {}
      })
    end
  }
}

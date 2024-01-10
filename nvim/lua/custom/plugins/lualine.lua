return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      local colors = {
        sumilnk2     = "#2A2A37",
        oldWhite     = "#C8C093",
        carpYellow   = "#E6C384",
        boatYellow1  = "#938056",
        winterYellow = "#49443C",
        katanaGray   = "#717C7C",
        black        = '#1c1e26',
        white        = '#6C6F93',
        red          = '#F43E5C',
        green        = '#09F7A0',
        blue         = '#25B2BC',
        yellow       = '#F09383',
        gray         = '#E95678',
        darkgray     = '#1A1C23',
        lightgray    = '#2E303E',
        inactivegray = '#1C1E26',
      }
      local kanagawa = {
        normal = {
          a = { bg = colors.carpYellow, fg = colors.sumilnk2, gui = 'bold' },
          b = { bg = colors.winterYellow, fg = colors.oldWhite },
          c = { bg = colors.sumilnk2, fg = colors.oldWhite }
        },
        insert = {
          a = { bg = colors.boatYellow1, fg = colors.sumilnk2, gui = 'bold' },
          b = { bg = colors.winterYellow, fg = colors.oldWhite },
          c = { bg = colors.sumilnk2, fg = colors.oldWhite }
        },
        visual = {
          a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
          b = { bg = colors.winterYellow, fg = colors.oldWhite },
          c = { bg = colors.sumilnk2, fg = colors.oldWhite }
        },
        replace = {
          a = { bg = colors.red, fg = colors.black, gui = 'bold' },
          b = { bg = colors.winterYellow, fg = colors.oldWhite },
          c = { bg = colors.sumilnk2, fg = colors.oldWhite }
        },
        command = {
          a = { bg = colors.katanaGray, fg = colors.sumilnk2, gui = 'bold' },
          b = { bg = colors.winterYellow, fg = colors.oldWhite },
          c = { bg = colors.sumilnk2, fg = colors.oldWhite }
        },
        inactive = {
          a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
          b = { bg = colors.winterYellow, fg = colors.oldWhite },
          c = { bg = colors.sumilnk2, fg = colors.oldWhite }
        }
      }

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = kanagawa,
          component_separators = { left = '\\', right = '/' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
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
      }

      require('lualine').setup()
    end,
  }
}

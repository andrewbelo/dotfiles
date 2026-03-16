return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      local colors =  {
        bright_red     = '#ffc4c4',
        bright_green   = '#eff6ab',
        bright_yellow  = '#ffe6b5',
        bright_blue    = '#c9e6fd',
        bright_purple  = '#f7d7ff',
        bright_aqua    = '#ddfcf8',
        bright_orange  = '#ffd3c2',
        neutral_red    = '#eca8a8',
        neutral_green  = '#ccd389',
        neutral_yellow = '#efd5a0',
        neutral_blue   = '#a5c6e1',
        neutral_purple = '#e1bee9',
        neutral_aqua   = '#c7ebe6',
        neutral_orange = '#efb6a0',
        faded_red      = '#ec8989',
        faded_green    = '#c9d36a',
        faded_yellow   = '#ceb581',
        faded_blue     = '#8abae1',
        faded_purple   = '#db9fe9',
        faded_aqua     = '#abebe2',
        faded_orange   = '#E69E83',
        base03         = '#002b36',
        base02         = '#073642',
        base01         = '#586e75',
        base00         = '#657b83',
        base0          = '#839496',
        base1          = '#93a1a1',
        base2          = '#eee8d5',
        base3          = '#fdf6e3',
        yellow         = '#b58900',
        orange         = '#cb4b16',
        red            = '#dc322f',
        magenta        = '#d33682',
        violet         = '#6c71c4',
        blue           = '#268bd2',
        cyan           = '#2aa198',
        green          = '#719e07',
      }
      local monochrome =  {
        normal = {
          a = { fg = colors.black, bg = colors.neutral_green, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.gray1 },
          c = { fg = colors.fg, bg = colors.bg },
        },
        insert = {
          a = { fg = colors.black, bg = colors.faded_blue, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.gray1 },
          c = { fg = colors.fg, bg = colors.bg },
        },
        visual = {
          a = { fg = colors.black, bg = colors.faded_yellow, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.gray1 },
          c = { fg = colors.fg, bg = colors.bg },
        },
        replace = {
          a = { fg = colors.black, bg = colors.faded_red, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.gray1 },
          c = { fg = colors.fg, bg = colors.bg },
        },
        command = {
          a = { fg = colors.black, bg = colors.faded_aqua, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.gray1 },
          c = { fg = colors.fg, bg = colors.bg },
        },
        inactive = {
          a = { fg = colors.white, bg = colors.fg, gui = 'bold' },
          b = { fg = colors.white, bg = colors.gray1 },
          c = { fg = colors.white, bg = colors.bg },
        },
      }
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = monochrome,
          component_separators = { left = '|', right = '|' },
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

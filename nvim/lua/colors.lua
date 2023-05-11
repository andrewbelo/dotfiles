-- " Important!!
vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif
]])


-- " For dark or light version.
vim.opt.background = "dark"

vim.cmd [[colorscheme nord]]

-- Lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
require('lualine').setup()

vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    numbers = 'ordinal',
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = 'center' } },
  }
}

vim.cmd [[
  hi CursorLineNR cterm=bold
  augroup CLNRSet
      autocmd! ColorScheme * hi CursorLineNR cterm=bold
  augroup END
]]

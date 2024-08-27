local opt = vim.opt
vim.cmd [[
  let g:python3_host_prog = substitute(system("which python3"), '\n\+$', '', '')
  set list listchars=tab:»·,trail:·,nbsp:·,eol:↲,conceal:┊
  augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
  augroup END
]]

opt.clipboard = "unnamed,unnamedplus" -- Copy into system (*, +) registers.

opt.scrolloff = 10

opt.compatible = false

opt.number = true
opt.relativenumber = true

opt.ruler = true
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.textwidth = 120
opt.colorcolumn = "81,101,121"

opt.history = 200

opt.hlsearch = true  -- Highlight search results.
opt.incsearch = true -- Search as you type.
opt.inccommand = "split"

opt.mouse = "nv"

opt.formatoptions:remove "o"

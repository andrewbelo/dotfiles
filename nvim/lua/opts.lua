local HOME = os.getenv("HOME")

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("command! BufOnly execute '%bdelete|edit #|normal \"'")
vim.cmd [[
    let g:python3_host_prog = substitute(system("which python3"), '\n\+$', '', '')
]]
vim.cmd("set list listchars=tab:»·,trail:·,nbsp:·")

vim.opt.undofile = true
vim.opt.undodir = HOME .. "/.vim/undo"
vim.g.ranger_map_keys = 0
vim.g.NERDTreeHijackNetrw = 0
vim.g.ranger_replace_netrw = 1

vim.opt.compatible = false
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.showtabline = 2
vim.opt.autowrite = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.textwidth = 120
vim.opt.colorcolumn = "81"
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.history = 200

vim.opt.wildmenu = true                -- Enable emnhanced tab autocomplete.
vim.opt.wildmode = "list:longest,full" -- Complete till longest string, then open menu.
vim.opt.hlsearch = true                -- Highlight search results.
vim.opt.incsearch = true               -- Search as you type.

vim.opt.mouse = "nv"
vim.opt.clipboard = "unnamed,unnamedplus" -- Copy into system (*, +) registers.

vim.opt.path = vim.opt.path + "**"

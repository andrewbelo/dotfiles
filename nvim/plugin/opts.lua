local HOME = os.getenv("HOME")

vim.api.nvim_create_autocmd("BufNewFile", {
  group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
  pattern = { "conjure-log-*" },
  callback = function() vim.diagnostic.disable(0) end,
  desc = "Conjure Log disable LSP diagnostics",
})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("conceallevel_2", { clear = true }),
  pattern = { "*.md" },
  callback = function() vim.opt.conceallevel = 2 end,
  desc = "Set conceallevel=2 on markdown files after save",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("setfiletype_dockerfile", { clear = true }),
  pattern = { "*.dockerfile" },
  callback = function() vim.bo.filetype = "dockerfile" end,
  desc = "Set filetype=dockerfile on *.dockerfile files",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("setfiletype_http", { clear = true }),
  pattern = { "*.http" },
  callback = function() vim.bo.filetype = "http" end,
  desc = "Set filetype=http on *.http files",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("setfiletype_http", { clear = true }),
  pattern = { "*.pbtxt" },
  callback = function() vim.bo.filetype = "pbtxt" end,
  desc = "Set filetype=pbtxt on *.pbtxt files",
})

vim.g.ranger_map_keys = 0
vim.g.NERDTreeHijackNetrw = 0
vim.g.ranger_replace_netrw = 1

vim.opt.conceallevel = 2
vim.g.vim_json_syntax_concealcursor = 2
vim.opt.concealcursor = "nc"
vim.opt.undofile = true
vim.opt.undodir = HOME .. "/.vim/undo"
vim.opt.compatible = false

vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true

vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.showtabline = 0
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
vim.opt.scrolloff = 10

vim.opt.history = 200

vim.opt.wildmenu = true                -- Enable emnhanced tab autocomplete.
vim.opt.wildmode = "list:longest,full" -- Complete till longest string, then open menu.
vim.opt.hlsearch = true                -- Highlight search results.
vim.opt.incsearch = true               -- Search as you type.

vim.opt.mouse = "nv"
vim.opt.clipboard = "unnamed,unnamedplus" -- Copy into system (*, +) registers.

vim.opt.path = vim.opt.path + "**"

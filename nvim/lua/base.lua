vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

local HOME = os.getenv("HOME")

vim.opt.undofile = True
vim.opt.undodir = HOME .. "/.vim/undo"

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0

vim.cmd("command! BufOnly execute '%bdelete|edit #|normal \"'")

vim.g.ranger_map_keys = 0
vim.g.NERDTreeHijackNetrw = 0
vim.g.ranger_replace_netrw = 1


-- if has('autocmd')
--     augroup reload_vimrc
--         autocmd!
--         autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
--     augroup END
-- endif


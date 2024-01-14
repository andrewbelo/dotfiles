local nmap = require("abelo.keymap").nmap
local tmap = require("abelo.keymap").tmap
local cmap = require("abelo.keymap").cmap
local imap = require("abelo.keymap").imap
local vmap = require("abelo.keymap").vmap
local xmap = require("abelo.keymap").xmap
local map = require("abelo.keymap").map


-- Move to /after/plugin/*
-- " Fugitive Conflict Resolution
-- nmap('<leader>m', ':Gvdiff!<CR>')
-- nmap('gdh', ':diffget //2<CR>')
-- nmap('gdl', ':diffget //3<CR>')
-- nmap('<F5>', ':MundoToggle<CR>')
-- nmap('<silent> <leader> :WhichKey', '<Space><CR>')
-- nmap('<Leader>n', ':RangerWorkingDirectory<CR>')
-- nmap('<Leader>p', ':PlantumlOpen<CR>')
-- nmap('<Leader>bo', ':BufOnly<CR>')
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

tmap('<expr>', "%% getcmdtype(') == ':' ? expand('%:h').'/' : '%%")

nmap('k', 'gk')
nmap('j', 'gj')
nmap('gk', 'k')
nmap('gj', 'j')

nmap('zo', 'zO')
nmap('zO', 'zo')

tmap('<Esc>', '<C-\\><C-n>')

-- Move between windows (using hjkl)
tmap('<A-h>', '<C-\\><C-N><C-w>h')
tmap('<A-j>', '<C-\\><C-N><C-w>j')
tmap('<A-k>', '<C-\\><C-N><C-w>k')
tmap('<A-l>', '<C-\\><C-N><C-w>l')
tmap('<A-h>', '<C-\\><C-N><C-w>h')
tmap('<A-j>', '<C-\\><C-N><C-w>j')
tmap('<A-k>', '<C-\\><C-N><C-w>k')
tmap('<A-l>', '<C-\\><C-N><C-w>l')
nmap('<A-h>', '<C-w>h')
nmap('<A-j>', '<C-w>j')
nmap('<A-k>', '<C-w>k')
nmap('<A-l>', '<C-w>l')

-- Move to last used window
nmap('<A-;>', '<C-w>p')
nmap('<RightMouse>', 'za')

-- " Remap insert mode bahaviour to Alt for better experiance
imap('<A-w>', '<C-w>')
imap('<A-h>', '<C-h>')
imap('<A-u>', '<C-u>')
imap('<A-o>', '<C-o>')
imap('<A-r>', '<C-r>')

-- " Remap command mode bahaviour to Alt for better experiance
cmap('<A-f>', '<C-f>')
cmap('<A-w>', '<C-w>')
cmap('<A-h>', '<C-h>')
cmap('<A-u>', '<C-u>')
cmap('<A-o>', '<C-o>')
cmap('<A-r>', '<C-r>')

nmap('<Left>',  ':bprev<CR>')
nmap('<Right>', ':bnext<CR>')
nmap('<Up>',    ':bfirst<CR>')
nmap('<Down>',  ':blast<CR>')

nmap('<Left>',  '<C-o>:echom "use ==> h <==<CR>')
nmap('<Right>', '<C-o>:echom "use ==> l <==<CR>')
nmap('<Up>',    '<C-o>:echom "use ==> k <==<CR>')
nmap('<Down>',  '<C-o>:echom "use ==> j <==<CR>')

nmap(';', ':')
nmap(':', ';')
nmap('\'', '\"')
nmap('\"', '\'')

nmap('<Leader>h', '<C-^>')


nmap("<leader>x", ":sil !xdg-open <C-r><C-a><CR>")

vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

nmap("J", "mzJ`z")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- greatest remap ever
xmap("<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

nmap("<leader>Y", [["+Y]])

nmap("Q", "<nop>")
nmap("<leader>f", vim.lsp.buf.format)

nmap("<C-k>", "<cmd>cnext<CR>zz")
nmap("<C-j>", "<cmd>cprev<CR>zz")
nmap("<leader>k", "<cmd>lnext<CR>zz")
nmap("<leader>j", "<cmd>lprev<CR>zz")

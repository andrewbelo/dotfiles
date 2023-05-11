local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(
    mode, shortcut, command, { noremap = true, silent = true }
    )
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

local function cmap(shortcut, command)
  map('c', shortcut, command)
end



tmap('<expr>', "%% getcmdtype(') == ':' ? expand('%:h').'/' : '%%")

nmap('k', 'gk')
nmap('gk', 'k')
nmap('j', 'gj')
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
tmap('<A-h>', '<C-w>h')
tmap('<A-j>', '<C-w>j')
tmap('<A-k>', '<C-w>k')
tmap('<A-l>', '<C-w>l')

-- Move to last used window
nmap('<A-;>', '<C-w>p')
nmap('<RightMouse>', 'za')


-- " Fugitive Conflict Resolution
nmap('<leader>m', ':Gvdiff!<CR>')
nmap('gdh', ':diffget //2<CR>')
nmap('gdl', ':diffget //3<CR>')

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

nmap('<Left>', ':bprev<CR>')
nmap('<Right>', ':bnext<CR>')
nmap('<Up>', ':bfirst<CR>')
nmap('<Down>', ':blast<CR>')

nmap('<F5>', ':MundoToggle<CR>')

nmap(';', ':')
nmap(':', ';')
nmap('\'', '\"')
nmap('\"', '\'')

nmap('<silent> <leader> :WhichKey', '<Space><CR>')
nmap('<Leader>h', '<C-^>')
nmap('<Leader>n', ':RangerWorkingDirectory<CR>')
nmap('<Leader>p', ':PlantumlOpen<CR>')
nmap('<Leader>bo', ':BufOnly<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

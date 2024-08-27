local set = vim.keymap.set

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<CR>"
  end
end, { expr = true })


set("n", ';', ':')
set("n", ':', ';')

set("n", "J", "mzJ`z")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "<C-e>", "<C-e>H")
set("n", "<C-y>", "<C-y>H")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- greatest reset ever
-- next greatest reset ever : asbjornHaland
set("x", "<leader>p", [["_dP]])
set("n", "<leader>Y", [["+Y]])
set({ "n", "v" }, "<leader>y", [["+y]])
set({ "n", "v" }, "<leader>d", [["_d]])


set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")


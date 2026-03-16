local M = {}

local function map(mode, shortcut, command)
  vim.keymap.set(
    mode, shortcut, command, { noremap = true, silent = true }
  )
end
 
M.tj_imap = function(tbl)
  vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.tj_nmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.map = map
M.nmap = function(shortcut, command)
  map('n', shortcut, command)
end

M.imap = function(shortcut, command)
  map('i', shortcut, command)
end

M.tmap = function(shortcut, command)
  map('t', shortcut, command)
end

M.vmap = function(shortcut, command)
  map('v', shortcut, command)
end

M.cmap = function(shortcut, command)
  map('c', shortcut, command)
end

M.xmap = function(shortcut, command)
  map('c', shortcut, command)
end

return M

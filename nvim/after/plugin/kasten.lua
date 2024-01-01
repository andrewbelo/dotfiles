local nmap = require("abelo.keymap").nmap
-- Launch panel if nothing is typed after <leader>z
nmap("<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
nmap("<leader>zn", ":lua require('telekasten').new_note()<CR>")
nmap("<leader>zN", ":lua require('telekasten').new_templated_note()<CR>")
nmap("<leader>zb", ":lua require('telekasten').show_backlinks()<CR>")
nmap("<leader>za", ":lua require('telekasten').show_tags()<CR>")
nmap("<leader>#", ":lua require('telekasten').show_tags()<CR>")
nmap("<leader>zr", ":lua require('telekasten').rename_note()<CR>")

nmap("<leader>zF", ":lua require('telekasten').find_friends()<CR>")
nmap("<leader>zf", ":lua require('telekasten').find_notes()<CR>")
nmap("<leader>zg", ":lua require('telekasten').search_notes()<CR>")
nmap("<leader>zx", ":lua require('telekasten').follow_link()<CR>")
nmap("<leader>zd", ":lua require('telekasten').goto_today()<CR>")
nmap("<leader>zw", ":lua require('telekasten').goto_thisweek()<CR>")
nmap("<leader>zW", ":lua require('telekasten').find_weekly_notes()<CR>")
nmap("<leader>zD", ":lua require('telekasten').find_daily_notes()<CR>")
nmap("<leader>zy", ":lua require('telekasten').yank_notelink()<CR>")
nmap("<leader>zc", ":lua require('telekasten').show_calendar()<CR>")
nmap("<leader>zC", ":CalendarT<CR>")
nmap("<leader>zi", ":lua require('telekasten').paste_img_and_link()<CR>")
nmap("<leader>zt", ":lua require('telekasten').toggle_todo()<CR>")
nmap("<leader>zI", ":lua require('telekasten').insert_img_link({ i=true })<CR>")
nmap("<leader>zp", ":lua require('telekasten').preview_img()<CR>")
nmap("<leader>zm", ":lua require('telekasten').browse_media()<CR>")

vim.cmd [[
autocmd FileType telekasten inoremap <learder>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
autocmd FileType telekasten inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
autocmd FileType telekasten inoremap <leader># <cmd>:lua require('telekasten').show_tags({i = true})<CR>
]]

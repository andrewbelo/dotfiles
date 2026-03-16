local set = vim.keymap.set
-- Launch panel if nothing is typed after <leader>z
set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
set("n", "<leader>zn", ":lua require('telekasten').new_note()<CR>")
set("n", "<leader>zN", ":lua require('telekasten').new_templated_note()<CR>")
set("n", "<leader>zb", ":lua require('telekasten').show_backlinks()<CR>")
set("n", "<leader>za", ":lua require('telekasten').show_tags()<CR>")
set("n", "<leader>#", ":lua require('telekasten').show_tags()<CR>")
set("n", "<leader>zr", ":lua require('telekasten').rename_note()<CR>")

set("n", "<leader>zF", ":lua require('telekasten').find_friends()<CR>")
set("n", "<leader>zf", ":lua require('telekasten').find_notes()<CR>")
set("n", "<leader>zg", ":lua require('telekasten').search_notes()<CR>")
set("n", "<leader>zx", ":lua require('telekasten').follow_link()<CR>")
set("n", "<leader>zd", ":lua require('telekasten').goto_today()<CR>")
set("n", "<leader>zw", ":lua require('telekasten').goto_thisweek()<CR>")
set("n", "<leader>zW", ":lua require('telekasten').find_weekly_notes()<CR>")
set("n", "<leader>zD", ":lua require('telekasten').find_daily_notes()<CR>")
set("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<CR>")
set("n", "<leader>zc", ":lua require('telekasten').show_calendar()<CR>")
set("n", "<leader>zC", ":CalendarT<CR>")
set("n", "<leader>zi", ":lua require('telekasten').paste_img_and_link()<CR>")
set("n", "<leader>zt", ":lua require('telekasten').toggle_todo()<CR>")
set("n", "<leader>zI", ":lua require('telekasten').insert_img_link({ i=true })<CR>")
set("n", "<leader>zp", ":lua require('telekasten').preview_img()<CR>")
set("n", "<leader>zm", ":lua require('telekasten').browse_media()<CR>")

vim.cmd [[
autocmd FileType telekasten inoremap <learder>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
autocmd FileType telekasten inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
autocmd FileType telekasten inoremap <leader># <cmd>:lua require('telekasten').show_tags({i = true})<CR>
]]

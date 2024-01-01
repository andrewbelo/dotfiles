vim.cmd [[
    imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    imap <silent><script><expr> <M-N> <Plug>(copilot-next)
    let g:copilot_no_tab_map = v:true
    let g:copilot_filetypes = { 'markdown': v:true, }
]]


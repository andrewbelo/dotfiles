syntax on

let g:python3_host_prog = substitute(system("which python3"), '\n\+$', '', '')

filetype plugin indent on
set list listchars=tab:»·,trail:·,nbsp:·
hi CursorLineNR cterm=bold
command! BufOnly execute '%bdelete|edit #|normal \"'
autocmd BufWritePre *.py :%s/\s\+$//e
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

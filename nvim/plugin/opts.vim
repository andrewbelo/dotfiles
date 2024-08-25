syntax on
filetype plugin indent on

let g:python3_host_prog = substitute(system("which python3"), '\n\+$', '', '')

set list listchars=tab:»·,trail:·,nbsp:·,eol:↲,conceal:┊
hi CursorLineNR cterm=bold
command! BufOnly execute '%bdelete|edit #|normal \"'
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

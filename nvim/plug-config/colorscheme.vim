" Important!!
if has('termguicolors')
  set termguicolors
endif

" Semshi (python syntax highlight) setup
let g:semshi#excluded_hl_groups = ['local']
let g:semshi#mark_selected_nodes = 2
function MyCustomHighlights()
    hi semshiLocal           guifg=#ff875f
    hi semshiGlobal          guifg=#5d8aa8
    hi semshiImported        guifg=#d2b48c gui=bold
    hi semshiParameter       guifg=#5fafff
    hi semshiParameterUnused guifg=#87d7ff gui=underline
    hi semshiFree            guifg=#ffafd7
    hi semshiBuiltin         guifg=#96ded1
    hi semshiAttribute       guifg=#c5b358
    hi semshiSelf            guifg=#5d8aa8
    hi semshiUnresolved      guifg=#ffff00 gui=underline
    hi semshiSelected        guifg=#ff875f guibg=#536878
endfunction
autocmd FileType python call MyCustomHighlights()
autocmd ColorScheme * call MyCustomHighlights()

" For dark or light version.
set background=dark
" set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_better_performance = 1
colorscheme nord

" Airline setup
let g:lightline = { 
    \ 'colorscheme': 'nord', 
    \ 'mode_map': {
    \   'n' : 'N',
    \   'i' : 'I',
    \   'R' : 'R',
    \   'v' : 'V',
    \   'V' : 'VL',
    \   "\<C-v>": 'VB',
    \   'c' : 'C',
    \   's' : 'S',
    \   'S' : 'SL',
    \   "\<C-s>": 'SB',
    \   't': 'T',
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }


let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#auto_hide = 0
let g:lightline#bufferline#margin_left = 1

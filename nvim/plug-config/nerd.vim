let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Map key to load nerdtree
nnoremap <A-m> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <A-n> :NERDTreeToggle<CR>

" Autoclose if NERDTree is the only one standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree styling
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeLimitedSyntax = 1

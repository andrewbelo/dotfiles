" => 0: Install plugins ---------------------------------------------------- {{{

source ~/.config/nvim/plug.vim " Manage plug using vim.plug

" => 1: Syntax and Views --------------------------------------------------- {{{

set nocompatible
syntax on
filetype plugin indent on

set nocompatible
set relativenumber
set number
set ruler
set showcmd
set laststatus=2
set showtabline=2
set autowrite
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

set foldmethod=indent "syntax highlighting items specify folds
let javaScript_fold=1 "activate folding by JS syntax

set list listchars=tab:»·,trail:·,nbsp:·

set backspace=2            " Fix backspace behavior on most terminals.
set textwidth=120
set colorcolumn=81
set splitbelow
set splitright

source ~/.config/nvim/plug-config/colorscheme.vim
source ~/.config/nvim/plug-config/goyo.vim

" => 2: Movement and Navigation --------------------------- {{{

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

nnoremap zo zO
nnoremap zO zo

tnoremap <Esc> <C-\><C-n>

" Move between windows (using hjkl)
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Move to last used window
nnoremap <A-;> <C-w>p
nnoremap <RightMouse> za

set history=200

set wildmenu                    " Enable emnhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.
set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.
set mouse=nv
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set path+=**

let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

source ~/.config/nvim/plug-config/fzf.vim

" => 4: Follow the Leader: Plugin Management ------------------ {{{

set undofile
set undodir=~/.vim/undo

nnoremap <F5> :MundoToggle<CR>

let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0

source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/ale.vim

let mapleader = "\\"

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

noremap ; :
noremap : ;
noremap ' "
noremap " '
noremap <Leader>h <C-^>
nnoremap <Leader>n :RangerWorkingDirectory<CR>
nnoremap <Leader>p :PlantumlOpen<CR>
command! BufOnly execute '%bdelete|edit #|normal `"'
nnoremap <Leader>bo :BufOnly<CR>

" Fugitive Conflict Resolution
nnoremap <leader>m :Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Remap insert mode bahaviour to Alt for better experiance
inoremap <A-w> <C-w>
inoremap <A-h> <C-h>
inoremap <A-u> <C-u>
inoremap <A-o> <C-o>
inoremap <A-r> <C-r>

" Remap command mode bahaviour to Alt for better experiance
cnoremap <A-f> <C-f>
cnoremap <A-w> <C-w>
cnoremap <A-h> <C-h>
cnoremap <A-u> <C-u>
cnoremap <A-o> <C-o>
cnoremap <A-r> <C-r>

" Get off my lawn
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> :bfirst<CR>
nnoremap <Down> :blast<CR>

if has('autocmd')
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif



call plug#begin()  " Manage plugins with vim-plug.

" Looks
Plug 'sainnhe/forest-night'
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'Konfekt/FastFold'
Plug 'zhimsel/vim-stay'

" navigation
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' " ranger dependency

" Autocompete & autoindent
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'liuchengxu/vim-which-key'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'pedrohdz/vim-yaml-folds'

" Work outside terminal
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

" Unknown purpose
Plug 'tmux-plugins/vim-tmux'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'

call plug#end()

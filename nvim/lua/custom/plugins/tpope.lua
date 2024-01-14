return {
  'tpope/vim-vinegar',
  'tpope/vim-obsession',
  'tpope/vim-unimpaired',
  {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd [[
        nnoremap <Leader>gy :.GBrowse!<CR>
        nnoremap <Leader>gh :G checkout master<CR>
        nnoremap <Leader>g- :G checkout -<CR>
        xnoremap <Leader>gy :'<'>GBrowse!<CR>
      ]]
    end
  },
  'tpope/vim-rhubarb',
  {
    'shumphrey/fugitive-gitlab.vim',
    config = function()
      vim.g.fugitive_gitlab_domains = { 'https://gitlab.evo.dev' }
    end
  },
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-abolish',
  'tpope/vim-dadbod',
  'tpope/vim-dotenv',
}

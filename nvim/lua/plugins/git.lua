return {
  {
    'tpope/vim-fugitive',
    dependencies = {
      {
        'shumphrey/fugitive-gitlab.vim',
        config = function()
          vim.g.fugitive_gitlab_domains = { 'https://gitlab.evo.dev' }
        end
      },
      "shumphrey/fugitive-gitlab.vim",
      "lewis6991/gitsigns.nvim",
      'tpope/vim-rhubarb',
    },
    config = function()
      vim.cmd [[
        nnoremap <Leader>gy :.GBrowse!<CR>
        nnoremap <Leader>gh :G checkout master<CR>
        nnoremap <Leader>g- :G checkout -<CR>
        xnoremap <Leader>gy :'<'>GBrowse!<CR>
      ]]
    end
  },
}

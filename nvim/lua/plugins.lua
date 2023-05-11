vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'mhinz/vim-startify'}

  --  Looks
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {'sainnhe/forest-night'}
  use {'sainnhe/gruvbox-material'}
  use {'arcticicestudio/nord-vim'}
  use {'sheerun/vim-polyglot'}
  use {'ryanoasis/vim-devicons'}
  use {'Konfekt/FastFold'}
  use {'zhimsel/vim-stay'}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --tpope
  use {'tpope/vim-vinegar'}
  use {'tpope/vim-obsession'}
  use {'tpope/vim-unimpaired'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-surround'}

  --  navigation
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
  end,}
  use {"nvim-treesitter/playground"}
  use {"nvim-treesitter/nvim-treesitter-context"}
  use {'simnalamburt/vim-mundo'}
  use {'justinmk/vim-sneak'}
  use {'easymotion/vim-easymotion'}
  use {
    'francoiscabrol/ranger.vim',
    requires = {
      {'rbgrouleff/bclose.vim' }
    }
  }

  -- notes
  use {"nvim-lua/plenary.nvim"}
  use {'nvim-telescope/telescope.nvim'}
  use {'renerocksai/telekasten.nvim'}
  use {'renerocksai/calendar-vim'}
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup { }
    end
  }

  --  Autocompete & autoindent
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  use {'tomtom/tcomment_vim'}
  use {'Vimjas/vim-python-pep8-indent'}
  use {
      'AckslD/nvim-whichkey-setup.lua',
      requires = {'liuchengxu/vim-which-key'},
  }
  use {'jiangmiao/auto-pairs'}
  use {'pedrohdz/vim-yaml-folds'}

  -- " Work outside terminal
  use {'tyru/open-browser.vim'}
  use {'weirongxu/plantuml-previewer.vim'}

  -- " Unknown purpose
  use {'tmux-plugins/vim-tmux'}
end)

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
 __   __  ___  _______    ________         ___    ___
|"  |/  \|  "||   _  "\  /"       )       |"  |  |"  |
|'  /    \:  |(. |_)  :)(:   \___/        ||  |  ||  |
|: /'        ||:     \/  \___  \          |:  |  |:  |
 \//  /\'    |(|  _  \\   __/  \\        _|  /  _|  /
 /   /  \\   ||: |_)  :) /" \   :)      / |_/ )/ |_/ )
|___/    \___|(_______/ (_______/      (_____/(_____/
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = vim.split(logo, "\n"), --your header
          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find File in git 1    ',
              desc_hl = 'String',
              key = 'b',
              keymap = 'SPC f f',
              key_hl = 'Number',
              action = 'Telescope find_files'
            },
            {
              icon = ' ',
              desc = 'Find Dotfiles',
              key = 'f',
              keymap = 'SPC f d',
              action = 'lua print(3)'
            },
          },
          footer = {} --your footer
        }
      }
    end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  --  Looks
  use { 'whatyouhide/vim-gotham' }
  use { 'arcticicestudio/nord-vim' }
  use { 'folke/tokyonight.nvim' }
  use { 'sheerun/vim-polyglot' }
  use { 'ryanoasis/vim-devicons' }
  use { 'Konfekt/FastFold' }
  use { 'zhimsel/vim-stay' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --tpope
  use { 'tpope/vim-vinegar' }
  use { 'tpope/vim-obsession' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }

  --  navigation
  use { 'ThePrimeagen/harpoon' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end, }
  use { "nvim-treesitter/playground" }
  use { "nvim-treesitter/nvim-treesitter-context" }
  use { "p00f/nvim-ts-rainbow" }
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use { 'simnalamburt/vim-mundo' }
  use { 'justinmk/vim-sneak' }
  use { 'easymotion/vim-easymotion' }
  use {
    'francoiscabrol/ranger.vim',
    requires = {
      { 'rbgrouleff/bclose.vim' }
    }
  }

  -- notes
  use { "nvim-lua/plenary.nvim" }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'renerocksai/telekasten.nvim' }
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use { 'mzlogin/vim-markdown-toc' }
  use { 'renerocksai/calendar-vim' }
  use { 'folke/zen-mode.nvim' }

  --  Autocompete & autoindent
  use { 'github/copilot.vim' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'jay-babu/mason-null-ls.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'L3MON4D3/LuaSnip' }, -- Required
    }
  }
  use { 'tomtom/tcomment_vim' }
  use { 'Vimjas/vim-python-pep8-indent' }
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = { 'liuchengxu/vim-which-key' },
  }
  use { 'jiangmiao/auto-pairs' }
  use { 'pedrohdz/vim-yaml-folds' }
  use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }

  -- " Work outside terminal
  use { 'jghauser/follow-md-links.nvim' }
  use { 'tyru/open-browser.vim' }
  use { 'Olical/conjure' }

  -- " Unknown purpose
  use { 'tmux-plugins/vim-tmux' }
  use { 'yoshio15/vim-trello' }
end)

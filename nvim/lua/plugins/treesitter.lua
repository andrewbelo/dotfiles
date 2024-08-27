return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = {
      { 'JoosepAlviste/nvim-ts-context-commentstring', },
      { "nvim-treesitter/playground" },
      { "nvim-treesitter/nvim-treesitter-context" },
      { "p00f/nvim-ts-rainbow" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end, 
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { 
          "vimdoc", "lua", "python", "clojure", "markdown", "markdown_inline" ,
          "go", },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "python" },
          },
          textobjects = {
            select = {
              enable = true,
              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,
                -- You can use the capture groups defined in textobjects.scm
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                -- You can also use captures from other query groups like `locals.scm`
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { 
                  query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { 
                  query = "@scope", query_group = "locals", desc = "Select language scope" },
              },
              --  ('v' charwise, 'V' linewise, or '<c-v>' blockvise) 
              selection_modes = {
                ['@parameter.outer'] = 'v',
                ['@function.outer'] = 'V',
                ['@class.outer'] = '<c-v>',
              },
              include_surrounding_whitespace = false,
            },
          },
          rainbow = {
            enable = true,
            disable = { "python" },
            extended_mode = true,
            max_file_lines = nil,
          }
        }
      end,
    },
  }

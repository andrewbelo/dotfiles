return {
  {
    'folke/zen-mode.nvim',
    config = function()
      vim.keymap.set("n", "<leader>zz", function()
        require("zen-mode").setup {
          window = {
            width = 90,
            options = {}
          },
        }
        require("zen-mode").toggle()
        vim.wo.wrap = true
        vim.wo.number = true
        vim.wo.rnu = true
        vim.opt.ruler = true
        vim.cmd [[ colorscheme default ]]
      end)


      vim.keymap.set("n", "<leader>zZ", function()
        require("zen-mode").setup {
          window = {
            width = 100,
            options = {}
          },
        }
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
        vim.cmd [[ colorscheme pablo ]]
      end)
    end,
  },
  {
    'renerocksai/telekasten.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'renerocksai/calendar-vim',
      {
        'jakewvincent/mkdnflow.nvim',
        config = function()
          require('mkdnflow').setup({
            perspective = {
              priority = 'root',
              root_tell = '.git',
            },
            links = {
              style = 'wiki',
              name_is_source = true,
              conceal = true,
              context = 0,
              implicit_extension = nil,
              transform_implicit = false,
              create_on_follow_failure = true
            },
            to_do = {
              symbols = { ' ', '~', 'X' },
              update_parents = true,
              not_started = ' ',
              in_progress = '~',
              complete = 'X'
            },
            mappings = {
              MkdnEnter = { { 'n', 'v' }, '<CR>' },
              MkdnTab = false,
              MkdnSTab = false,
              MkdnNextLink = false,
              MkdnPrevLink = false,
              MkdnNextHeading = { 'n', ']]' },
              MkdnPrevHeading = { 'n', '[[' },
              MkdnGoBack = { 'n', '<BS>' },
              MkdnGoForward = { 'n', '<Del>' },
              MkdnCreateLink = false,                                      -- see MkdnEnter
              MkdnCreateLinkFromClipboard = { { 'n', 'v' }, '<leader>P' }, -- see MkdnEnter
              MkdnFollowLink = false,                                      -- see MkdnEnter
              MkdnDestroyLink = { 'n', '<M-CR>' },
              MkdnTagSpan = { 'v', '<M-CR>' },
              MkdnMoveSource = { 'n', '<F2>' },
              MkdnYankAnchorLink = { 'n', 'yaa' },
              MkdnYankFileAnchorLink = { 'n', 'yfa' },
              MkdnIncreaseHeading = { 'n', '+' },
              MkdnDecreaseHeading = { 'n', '=' },
              MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
              MkdnNewListItem = false,
              MkdnNewListItemBelowInsert = { 'n', 'o' },
              MkdnNewListItemAboveInsert = { 'n', 'O' },
              MkdnExtendList = false,
              MkdnUpdateNumbering = { 'n', '<leader>nn' },
              MkdnTableNextCell = { 'i', '<C-n>' },
              MkdnTablePrevCell = { 'i', '<C-p>' },
              MkdnTableNextRow = false,
              MkdnTablePrevRow = { 'i', '<M-CR>' },
              MkdnTableNewRowBelow = { 'n', '<leader>ir' },
              MkdnTableNewRowAbove = { 'n', '<leader>iR' },
              MkdnTableNewColAfter = { 'n', '<leader>ic' },
              MkdnTableNewColBefore = { 'n', '<leader>iC' },
              MkdnFoldSection = { 'n', '<leader>f' },
              MkdnUnfoldSection = { 'n', '<leader>F' }
            }
          })
        end,
      }
    },
    config = function()
      local home = vim.fn.expand("~/personal/zettelkasten")
      require('telekasten').setup({
        home                        = home,
        take_over_my_home           = true,
        auto_set_filetype           = false,
        dailies                     = home .. '/regular/' .. 'daily',
        weeklies                    = home .. '/regular/' .. 'weekly',
        templates                   = home .. '/regular/' .. 'templates',
        template_new_daily          = home .. '/regular/templates/daily.md',
        template_new_weekly         = home .. '/regular/templates/weekly.md',
        image_subdir                = "img",
        follow_creates_nonexisting  = true,
        dailies_create_nonexisting  = true,
        weeklies_create_nonexisting = true,
        image_link_style            = "markdown",
        plug_into_calendar          = true,
        calendar_opts               = {
          weeknm = 4,
          calendar_monday = 1,
          calendar_mark = 'left-fit',
        },

        -- telescope actions behavior
        close_after_yanking         = true,
        insert_after_inserting      = true,
        tag_notation                = "#tag",

        -- command palette theme: dropdown (window) or ivy (bottom panel)
        command_palette_theme       = "ivy",
        show_tags_theme             = "ivy",
        subdirs_in_links            = true,
        template_handling           = "smart",

        new_note_location           = "smart",
        rename_update_links         = true,
      })

      local set = vim.keymap.set
      -- Launch panel if nothing is typed after <leader>z
      set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

      -- Most used functions
      set("n", "<leader>zn", ":lua require('telekasten').new_note()<CR>")
      set("n", "<leader>zN", ":lua require('telekasten').new_templated_note()<CR>")
      set("n", "<leader>zb", ":lua require('telekasten').show_backlinks()<CR>")
      set("n", "<leader>za", ":lua require('telekasten').show_tags()<CR>")
      set("n", "<leader>#", ":lua require('telekasten').show_tags()<CR>")
      set("n", "<leader>zr", ":lua require('telekasten').rename_note()<CR>")

      set("n", "<leader>zF", ":lua require('telekasten').find_friends()<CR>")
      set("n", "<leader>zf", ":lua require('telekasten').find_notes()<CR>")
      set("n", "<leader>zg", ":lua require('telekasten').search_notes()<CR>")
      set("n", "<leader>zx", ":lua require('telekasten').follow_link()<CR>")
      set("n", "<leader>zd", ":lua require('telekasten').goto_today()<CR>")
      set("n", "<leader>zw", ":lua require('telekasten').goto_thisweek()<CR>")
      set("n", "<leader>zW", ":lua require('telekasten').find_weekly_notes()<CR>")
      set("n", "<leader>zD", ":lua require('telekasten').find_daily_notes()<CR>")
      set("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<CR>")
      set("n", "<leader>zc", ":lua require('telekasten').show_calendar()<CR>")
      set("n", "<leader>zC", ":CalendarT<CR>")
      set("n", "<leader>zi", ":lua require('telekasten').paste_img_and_link()<CR>")
      set("n", "<leader>zt", ":lua require('telekasten').toggle_todo()<CR>")
      set("n", "<leader>zI", ":lua require('telekasten').insert_img_link({ i=true })<CR>")
      set("n", "<leader>zp", ":lua require('telekasten').preview_img()<CR>")
      set("n", "<leader>zm", ":lua require('telekasten').browse_media()<CR>")

      vim.cmd [[
      autocmd FileType telekasten inoremap <learder>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
      autocmd FileType telekasten inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
      autocmd FileType telekasten inoremap <leader># <cmd>:lua require('telekasten').show_tags({i = true})<CR>
      ]]
    end,
  }
}

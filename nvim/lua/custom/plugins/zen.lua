return {
  { 'jghauser/follow-md-links.nvim' },
  { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' },
  { 'mzlogin/vim-markdown-toc' },
  { 'renerocksai/calendar-vim' },
  { 'folke/zen-mode.nvim' },
  { 
    'renerocksai/telekasten.nvim' ,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local home = vim.fn.expand("~/personal/zettelkasten")
      local telekasten = require('telekasten').setup({
          home                        = home,
          take_over_my_home           = true,
          auto_set_filetype           = false,
          dailies                     = home .. '/' .. 'daily',
          weeklies                    = home .. '/' .. 'weekly',
          templates                   = home .. '/' .. 'templates',
          image_subdir                = "img",
          follow_creates_nonexisting  = true,
          dailies_create_nonexisting  = true,
          weeklies_create_nonexisting = true,
          template_new_daily          = home .. '/' .. 'templates/daily.md',
          template_new_weekly         = home .. '/' .. 'templates/weekly.md',
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
    end,
  }
} 

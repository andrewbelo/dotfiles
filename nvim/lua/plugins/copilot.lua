return {
  --   {
  --   'github/copilot.vim',
  --   config = function()
  --     vim.keymap.set('i', '<C-L>', ':<Plug>(copilot-next)', {
  --       expr = true,
  --       replace_keycodes = false
  --     })
  --     vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
  --       expr = true,
  --       replace_keycodes = false
  --     })
  --
  --     vim.cmd [[
  --           let g:copilot_enabled = v:false
  --         ]]
  --   end,
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-k>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      })
    end,
  },
}

return {{
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-L>', ':<Plug>(copilot-next)', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_node_command = "~/.nvm/versions/node/v20.10.0/bin/node"

      vim.cmd [[
          let g:copilot_enabled = v:false
        ]]
    end,
}}

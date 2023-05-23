require("bufferline").setup{
        options = {
            mode = "buffers",
            themable = true,
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator = {
                style = 'icon',
            },
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 18,
            diagnostics = "nvim_lsp",
            color_icons = true,
            show_close_icon = true ,
            show_duplicate_prefix = true,
            -- whether or not custom sorted buffers should persist
            persist_buffer_sort = true,
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style =  "slope",
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
        }
}

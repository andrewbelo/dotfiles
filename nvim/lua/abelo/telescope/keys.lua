local map_tele = require "abelo.telescope.mappings"

-- Dotfiles
map_tele("<leader>en", "edit_neovim")
map_tele("<leader>ez", "edit_zsh")
map_tele("<leader><leader>d", "diagnostics")

-- Search
-- TODO: I would like to completely remove _mock from my search results here when I'm in SG/SG
map_tele("<leader>gw", "grep_string", {
  word_match = "-w",
  short_path = true,
  only_sort_text = true,
  layout_strategy = "vertical",
})

map_tele("<leader>f/", "grep_last_search", {
  layout_strategy = "vertical",
})

-- Files
map_tele("<leader>ft", "git_files")
map_tele("<leader>fg", "multi_rg")
map_tele("<leader>fo", "oldfiles")
map_tele("<leader>fd", "find_files")
map_tele("<leader>fs", "fs")
map_tele("<leader>pp", "project_search")
map_tele("<leader>fv", "find_nvim_source")
map_tele("<leader>fe", "file_browser")
map_tele("<leader>fz", "search_only_certain_files")
map_tele("<leader>fm", "keymaps")

-- Git
map_tele("<leader>gs", "git_status")
map_tele("<leader>gc", "git_commits")

-- Nvim
map_tele("<leader>fb", "buffers")
map_tele("<leader>fp", "my_plugins")
map_tele("<leader>fa", "installed_plugins")
map_tele("<leader>fi", "search_all_files")
map_tele("<leader>ff", "curbuf")
map_tele("<leader>fh", "help_tags")
map_tele("<leader>bo", "vim_options")
map_tele("<leader>gp", "grep_prompt")
map_tele("<leader>wt", "treesitter")

-- Telescope Meta
map_tele("<leader>fB", "builtin")

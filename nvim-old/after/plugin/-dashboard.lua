local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")





local conf = {}
conf.header = {
  "                                                                                    ",
  " WWWWWWWW                           WWWWWWWWBBBBBBBBBBBBBBBBB      SSSSSSSSSSSSSSS  ",
  " W::::::W                           W::::::WB::::::::::::::::B   SS:::::::::::::::S ",
  " W::::::W                           W::::::WB::::::BBBBBB:::::B S:::::SSSSSS::::::S ",
  " W::::::W                           W::::::WBB:::::B     B:::::BS:::::S     SSSSSSS ",
  "  W:::::W           WWWWW           W:::::W   B::::B     B:::::BS:::::S             ",
  "   W:::::W         W:::::W         W:::::W    B::::B     B:::::BS:::::S             ",
  "    W:::::W       W:::::::W       W:::::W     B::::BBBBBB:::::B  S::::SSSS          ",
  "     W:::::W     W:::::::::W     W:::::W      B:::::::::::::BB    SS::::::SSSSS     ",
  "      W:::::W   W:::::W:::::W   W:::::W       B::::BBBBBB:::::B     SSS::::::::SS   ",
  "       W:::::W W:::::W W:::::W W:::::W        B::::B     B:::::B       SSSSSS::::S  ",
  "        W:::::W:::::W   W:::::W:::::W         B::::B     B:::::B            S:::::S ",
  "         W:::::::::W     W:::::::::W          B::::B     B:::::B            S:::::S ",
  "          W:::::::W       W:::::::W         BB:::::BBBBBB::::::BSSSSSSS     S:::::S ",
  "           W:::::W         W:::::W          B:::::::::::::::::B S::::::SSSSSS:::::S ",
  "            W:::W           W:::W           B::::::::::::::::B  S:::::::::::::::SS  ",
  "             WWW             WWW            BBBBBBBBBBBBBBBBB    SSSSSSSSSSSSSSS    ",
  "                                                                                    ",
  "                                                                                    ",
  "                                                                                    ",
  "                                                                                    ",
}

conf.center = {
  {
    icon = "󰈞  ",
    desc = "Go to today note                        ",
    action = ":Telekasten goto_today",
    key = "<Leader> z t",
  },
  {
    icon = "󰈞  ",
    desc = "Find File In Notes                      ",
    action = ":Telekasten find_notes",
    key = "<Leader> z f",
  },
  {
    icon = "󰈞  ",
    desc = "Find File In Git                        ",
    action = ":Telescope git_files",
    key = "<Leader> f t",
  },
  {
    icon = "󰈬  ",
    desc = "Project grep                            ",
    action = ":Telescope live_grep",
    key = "<Leader> f g",
  },
  {
    icon = "  ",
    desc = "Find in vim config                        ",
    action = "",
    key = "<Leader> f i",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    action = "enew",
    key = "e",
  },
  {
    icon = "󰗼  ",
    desc = "Quit Nvim                               ",
    -- desc = "Quit Nvim                               ",
    action = "qa",
    key = "q",
  },
}

dashboard.setup({
  theme = 'doom',
  shortcut_type = 'number',
  config = conf
})

api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function ()
    keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})

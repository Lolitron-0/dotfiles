local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


-- relative to lua directory
require("plugins")
require("autocmds")


vim.g.colors_name = "kanagawa-dragon"
vim.cmd [[hi CursorLine ctermbg=None guibg=None term=underline gui=underline]]
vim.cmd [[colorscheme kanagawa-dragon]]

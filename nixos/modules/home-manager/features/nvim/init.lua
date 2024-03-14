
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


require("plugins")
require("autocmds")


vim.g.colors_name = "kanagawa-dragon"
vim.cmd ("hi CursorLine ctermbg=None guibg=None term=underline gui=underline")

vim.cmd"command! -nargs=0 NvimTree :NvimTreeOpen"

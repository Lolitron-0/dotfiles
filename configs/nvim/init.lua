
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


require("plugins")
require("autocmds")


vim.g.colors_name = "kanagawa-dragon"

vim.cmd"command! -nargs=0 NvimTree :NvimTreeOpen"

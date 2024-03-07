
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


require("plugins")
require("autocmds")


vim.g.colors_name = "gruvbox"

vim.cmd"command! -nargs=0 NvimTree :NvimTreeOpen"

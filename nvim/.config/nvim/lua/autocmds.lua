local autocmd = vim.api.nvim_create_autocmd

local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  if not real_file then
    return
  end

  local view = require('nvim-tree.view')
  local is_visible = view.is_visible()
  if is_visible then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.open({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = open_nvim_tree })

-- Save NvimTree in auto-session
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	pattern = 'NvimTree*',
	callback = function()
		local view = require('nvim-tree.view')
		local is_visible = view.is_visible()

		local api = require('nvim-tree.api')
		if not is_visible then
			api.tree.open()
		end
	end,
})

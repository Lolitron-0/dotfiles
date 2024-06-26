local autocmd = vim.api.nvim_create_autocmd

-- autocmd("BufRead", {
-- 	callback = function()
-- 		if not (require "nvim-tree.view".is_visible()) then
-- 			require "nvim-tree.api".tree.open()
-- 		end
-- 	end
-- })
--

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

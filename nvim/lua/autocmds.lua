local autocmd = vim.api.nvim_create_autocmd

autocmd("BufRead", {
	callback = function()
		if not (require "nvim-tree.view".is_visible()) then
			require "nvim-tree.api".tree.open()
		end
	end
})

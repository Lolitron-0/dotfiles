local autocmd = vim.api.nvim_create_autocmd

autocmd("BufRead", {
	callback=function ()
		vim.cmd(":NERDTree")
	end
})

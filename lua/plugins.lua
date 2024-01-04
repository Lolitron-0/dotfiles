local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			require("drop").setup {
				theme = "snow", -- "leaves", "snow", "stars", "xmas", "spring", "summer"
				filetypes = { "dashboard", "alpha", "starter" },
			}
		end,
	})

	use { 'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end }

	-- use {'nvim-telescope/telescope.nvim', config = function() require("telescope").setup() end}

	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			local dashboard_custom_header13 = {
				'',
				' ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ ',
				' ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ ',
				' ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ ',
				' ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ ',
				' ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ ',
				' ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ ',
				' ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ ',
				' ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ ',
				' ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ ',
				' ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ ',
				' ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ ',
				' ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ ',
				' ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ ',
				' ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ ',
				' ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ ',
				'',
			}

			local db = require('dashboard')
			db.setup {
				theme = 'hyper',
				config = {
					header = dashboard_custom_header13,
					shortcut = {
						{
							desc = ' Projects',
							group = 'GruvboxBlueBold',
							action = 'Telescope project',
							key = 'p'
						},
						{
							icon = ' ',
							desc = 'RecentFiles',
							group = 'GruvboxBlueBold',
							action = 'Telescope recent_files pick',
							key = 'f',
						},
						{
							desc = ' FileBrowser',
							group = 'GruvboxBlueBold',
							action = 'Telescope file_browser',
							key = 'b',
						},
					},
					project = {
						enable = true,
						limit = 8,
						icon = '  ',
						label = 'Projects',
						action = 'Telescope project',
					},
					footer = { "", "👁 私の想像力はどこにあるのか 👁" }
				}
			}
			vim.cmd [[hi DashboardHeader ctermfg=13]]
			vim.cmd [[hi DashboardFooter ctermfg=13]]
		end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } },
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}


	vim.keymap.set('n', '<leader><leader>', function()
		local text = content or vim.api.nvim_get_current_line()
		local scol = --[[ require("dashboard.utils").is_win and text:find('%w') or ]] text:find('%p')
		print(scol)
		text = text:sub(scol)
	end, {})

	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', ":Telescope file_browser<cr>", {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

	use { 'ghassan0/telescope-glyph.nvim' }
	use { 'xiyaowong/telescope-emoji.nvim' }
	use { "smartpde/telescope-recent-files" }
	use { "nvim-telescope/telescope-project.nvim" }
	require('telescope').load_extension('glyph')
	require("telescope").load_extension("emoji")
	require("telescope").load_extension("recent_files")
	require 'telescope'.load_extension('project')

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	-- use 'cohama/lexima.vim'
end)

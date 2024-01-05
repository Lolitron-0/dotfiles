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

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}

	require('telescope').setup()

	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', ":Telescope file_browser<cr>", {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

	use { 'ghassan0/telescope-glyph.nvim' }
	use { 'xiyaowong/telescope-emoji.nvim' }
	use { "smartpde/telescope-recent-files" }
	use { "nvim-telescope/telescope-project.nvim" }
	use { "HUAHUAI23/telescope-session.nvim" }
	require('telescope').load_extension('glyph')
	require('telescope').load_extension('file_browser')
	require("telescope").load_extension("emoji")
	require("telescope").load_extension("recent_files")
	require('telescope').load_extension('project')
	require('telescope').load_extension('xray23')

	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
			}
		end
	}

	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			local db = require('dashboard')
			db.setup(require "dashdoard_config")
			vim.cmd [[hi link DashboardHeader String]]
			-- vim.cmd [[hi DashboardHeader ctermfg=13 guifg=magenta]]
			vim.cmd [[hi link DashboardFooter string]]
			--vim.cmd [[hi DashboardFooter ctermfg=13 guifg=magenta]]
			vim.cmd [[hi DashboardIcon ctermfg=8 guifg=darkgrey]]
			vim.cmd [[hi DashboardDesc ctermfg=8 guifg=darkgrey]]
			vim.cmd [[hi DashboardKey cterm=bold ctermfg=lightcyan gui=bold guifg=lightcyan]]
		end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}


	use { "nvim-tree/nvim-tree.lua",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true


			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				
				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
				vim.keymap.set('n', 'S', api.node.run.system, opts('Run'))
				vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: vertical'))
				vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: horizontal'))
			end

			require("nvim-tree").setup {
				on_attach = my_on_attach,
			}
		end
	}

	use { 'rebelot/kanagawa.nvim' }
	use { 'morhetz/gruvbox',
		config = function()
			vim.g.gruvbox_contrast_dark = 'medium'
			vim.o.background = 'dark'
			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		end
	}
	use { 'ErichDonGubler/vim-sublime-monokai' }
	use { "folke/tokyonight.nvim" }
	vim.cmd("colorscheme gruvbox")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	-- use 'cohama/lexima.vim'
end)

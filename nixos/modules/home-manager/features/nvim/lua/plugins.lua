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

	use 'wakatime/vim-wakatime'

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc", "query", "nix", "markdown", "markdown_inline" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				}
			}
		end,
	}

	use({
		'MeanderingProgrammer/markdown.nvim',
		after = { 'nvim-treesitter' },
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require('render-markdown').setup({})
		end,
	})

	use { 
		"mfussenegger/nvim-dap",
		config = function()

			-- if fails to start with:
			-- Error on launch: Failed to attach to the target process. Timed out trying to get messages from the runInTerminal launcher
			-- echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

			local dap = require('dap')
			 -- dap.configurations.cpp = {
				-- {
				-- 	name = "Launch",
				-- 	type = "lldb",
				-- 	request = "launch",
				-- 	program = function()
				-- 		return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				-- 	end,
				-- 	cwd = '${workspaceFolder}',
				-- 	stopOnEntry = false,
				-- 	-- args = function()
				-- 	-- 	local str = vim.fn.input('Args: ', '', 'args')
				-- 	-- 	local t={}
				-- 	-- 	local sep = " "
				-- 	-- 	for str in string.gmatch(str, "([^"..sep.."]+)") do
				-- 	-- 		table.insert(t, str)
				-- 	-- 	end
				-- 	-- 	print(t)
				-- 	-- 	return t
				-- 	-- end,
				-- 	args = {},
				-- 	runInTerminal = true,
				-- }
    --     	}
			dap.adapters.lldb = {
			  type = 'executable',
			  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
			  name = 'lldb'
			}

			vim.api.nvim_create_user_command('LoadLaunchJSON',function()
				require('dap.ext.vscode').load_launchjs("launch.json",
				{ lldb = {'c', 'cpp'} })
			end,{})

			vim.keymap.set('n', '<F9>', require'dap'.toggle_breakpoint)	
			vim.keymap.set('n', '<F5>', function() 
											require'dap'.continue()
										end)	
			vim.keymap.set('n', '<F10>', require'dap'.step_over)	
			vim.keymap.set('n', '<F11>', require'dap'.step_into)	
			vim.keymap.set('n', '<F9>', require'dap'.toggle_breakpoint)	
		end
	}
	use { 
		"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
		config = function()
			require("dapui").setup{
			icons = {
			  collapsed = "",
			  current_frame = "",
			  expanded = ""
			},
			layouts = { {
				elements = { {
					id = "scopes",
					size = 0.45
				  }, {
					id = "stacks",
					size = 0.25
				  }, {
					id = "breakpoints",
					size = 0.15
				  }, {
					id = "watches",
					size = 0.15
				  } },
				position = "right",
				size = 40
			  }, {
				elements = { {
					id = "repl",
					size = 0.5
				  }, {
					id = "console",
					size = 0.5
				  } },
				position = "bottom",
				size = 10
			  } },

			}

			local dap, dapui,tree = require("dap"), require("dapui"), require("nvim-tree.api") 
			dap.listeners.before.attach.dapui_config = function()
			  dapui.open()
			  tree.tree.close()
			end
			dap.listeners.before.launch.dapui_config = function()
			  dapui.open()
			  tree.tree.close()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
			  dapui.close()
			  tree.tree.open()
			end
			dap.listeners.before.event_exited.dapui_config = function()
			  dapui.close()
			  tree.tree.open()
			end
		end
	}

	use { 
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			require("nvim-dap-virtual-text").setup {
			  show_stop_reason = false,
			}
		end
	}

	use { 'neovim/nvim-lspconfig' }
	use { 'elkowar/yuck.vim' }

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup {
				options = { theme = "auto" }
			}
		end
	}

	use({
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			require("drop").setup {
				theme = "summer", -- "leaves", "snow", "stars", "xmas", "spring", "summer"
				filetypes = { --[[ "dashboard", ]] "alpha", "starter" },
			}
		end,
	})

	use { 'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end }

	use { 'kyazdani42/nvim-web-devicons' }

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


	use {
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = {"~/"}
			}
		end
	}


	use { 'ghassan0/telescope-glyph.nvim' }
	use { 'xiyaowong/telescope-emoji.nvim' }
	use { "smartpde/telescope-recent-files" }
	use { 'nvim-telescope/telescope-project.nvim' }
	require('telescope').load_extension('glyph')
	require('telescope').load_extension('file_browser')
	require("telescope").load_extension("emoji")
	require("telescope").load_extension("recent_files")
	require('telescope').load_extension('project')
	require('telescope').load_extension('session-lens')


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
			db.setup(require "dashdoard_config") vim.cmd [[hi link DashboardHeader String]]
			-- vim.cmd [[hi DashboardHeader ctermfg=13 guifg=magenta]]
			--vim.cmd [[hi link DashboardFooter String]]
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

			vim.g.nvim_tree_follow = 1
			vim.g.nvim_tree_hide_dotfiles = 0
			vim.g.nvim_tree_indent_markers = 1
			vim.g.nvim_tree_auto_open = 1
			vim.g.nvim_tree_auto_close = 0
			vim.g.nvim_tree_disable_netrw = 0
			vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
			vim.g.nvim_tree_lsp_diagnostics = 1
		end
	}

	use { 'rebelot/kanagawa.nvim' }
	use { 'ellisonleao/gruvbox.nvim',
		config = function()
			require("gruvbox").setup{
				contrast = "hard",
				transparent_mode=true
			}
			vim.o.background = 'dark'
			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		end
	}
	use { 'ErichDonGubler/vim-sublime-monokai' }
	use { "folke/tokyonight.nvim" }
	use { 'shaunsingh/nord.nvim' }
	use { "xiyaowong/transparent.nvim", config = function()
		vim.cmd [[hi CursorLine ctermbg=None guibg=None term=underline gui=underline]]
		require("transparent").setup{
			groups = { -- table: default groups
			'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
			'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
			'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
			'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'NormalSB', 'Pmenu',
		  },
		  --exclude_groups={"CursorLine"}
		}
		-- require('transparent').clear_prefix('lualine')
		require('transparent').clear_prefix('Dashboard')
		vim.cmd [[hi CursorLine ctermbg=None guibg=None term=underline gui=underline]]
	end}


	use "sindrets/diffview.nvim"

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end


	vim.cmd ("hi CursorLine ctermbg=None guibg=None term=underline gui=underline")
	-- use 'cohama/lexima.vim'
end)

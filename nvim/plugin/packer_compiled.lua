-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/niten/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/niten/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/niten/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/niten/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/niten/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nÕ\2\0\0\6\0\n\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0006\3\0\0'\5\3\0B\3\2\0A\1\0\0016\1\4\0009\1\5\1'\3\6\0B\1\2\0016\1\4\0009\1\5\1'\3\a\0B\1\2\0016\1\4\0009\1\5\1'\3\b\0B\1\2\0016\1\4\0009\1\5\1'\3\t\0B\1\2\1K\0\1\0Jhi DashboardKey cterm=bold ctermfg=lightcyan gui=bold guifg=lightcyan.hi DashboardDesc ctermfg=8 guifg=darkgrey.hi DashboardIcon ctermfg=8 guifg=darkgrey#hi link DashboardHeader String\bcmd\bvim\21dashdoard_config\nsetup\14dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/niten/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/nvimdev/dashboard-nvim"
  },
  ["drop.nvim"] = {
    config = { "\27LJ\2\nr\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\4\0\0\14dashboard\nalpha\fstarter\1\0\1\ntheme\tsnow\nsetup\tdrop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/niten/.local/share/nvim/site/pack/packer/opt/drop.nvim",
    url = "https://github.com/folke/drop.nvim"
  },
  gruvbox = {
    config = { "\27LJ\2\n–\1\0\0\3\0\t\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0&hi Normal guibg=NONE ctermbg=NONE\bcmd\tdark\15background\6o\vmedium\26gruvbox_contrast_dark\6g\bvim\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n]\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0À\vbuffer\tdesc\1\0\3\fnoremap\2\vsilent\2\vnowait\2\16nvim-tree: ¤\3\1\1\v\0\26\0:6\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a\18\b\2\0'\n\r\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0009\a\15\0019\a\16\a9\a\17\a\18\b\2\0'\n\18\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\19\0009\a\15\0019\a\20\a9\a\21\a\18\b\2\0'\n\22\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\23\0009\a\15\0019\a\20\a9\a\24\a\18\b\2\0'\n\25\0B\b\2\0A\3\3\0012\0\0€K\0\1\0\21Open: horizontal\15horizontal\6i\19Open: vertical\rvertical\topen\6s\bRun\vsystem\brun\tnode\6S\tHelp\16toggle_help\ttree\6?\6n\bset\vkeymap\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire†\4\1\0\4\0\21\00056\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0003\0\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0=\0\v\3B\1\2\0016\1\0\0009\1\1\1)\2\1\0=\2\f\0016\1\0\0009\1\1\1)\2\0\0=\2\r\0016\1\0\0009\1\1\1)\2\1\0=\2\14\0016\1\0\0009\1\1\1)\2\1\0=\2\15\0016\1\0\0009\1\1\1)\2\0\0=\2\16\0016\1\0\0009\1\1\1)\2\0\0=\2\17\0016\1\0\0009\1\1\0015\2\19\0=\2\18\0016\1\0\0009\1\1\1)\2\1\0=\2\20\1K\0\1\0\30nvim_tree_lsp_diagnostics\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\28nvim_tree_disable_netrw\25nvim_tree_auto_close\24nvim_tree_auto_open\29nvim_tree_indent_markers\28nvim_tree_hide_dotfiles\21nvim_tree_follow\14on_attach\1\0\0\nsetup\14nvim-tree\frequire\0\18termguicolors\bopt\23loaded_netrwPlugin\17loaded_netrw\6g\bvim\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n‘\2\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\2\18\1\0\0B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\1\5\0015\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3B\1\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\a\0\0\bcpp\6c\blua\bvim\vvimdoc\nquery\nsetup\28nvim-treesitter.configs\1\0\1\14with_sync\2\vupdate\28nvim-treesitter.install\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-emoji.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/telescope-emoji.nvim",
    url = "https://github.com/xiyaowong/telescope-emoji.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-glyph.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/telescope-glyph.nvim",
    url = "https://github.com/ghassan0/telescope-glyph.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-recent-files"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/telescope-recent-files",
    url = "https://github.com/smartpde/telescope-recent-files"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-sublime-monokai"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/vim-sublime-monokai",
    url = "https://github.com/ErichDonGubler/vim-sublime-monokai"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n]\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0À\vbuffer\tdesc\1\0\3\fnoremap\2\vsilent\2\vnowait\2\16nvim-tree: ¤\3\1\1\v\0\26\0:6\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a\18\b\2\0'\n\r\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0009\a\15\0019\a\16\a9\a\17\a\18\b\2\0'\n\18\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\19\0009\a\15\0019\a\20\a9\a\21\a\18\b\2\0'\n\22\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\23\0009\a\15\0019\a\20\a9\a\24\a\18\b\2\0'\n\25\0B\b\2\0A\3\3\0012\0\0€K\0\1\0\21Open: horizontal\15horizontal\6i\19Open: vertical\rvertical\topen\6s\bRun\vsystem\brun\tnode\6S\tHelp\16toggle_help\ttree\6?\6n\bset\vkeymap\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire†\4\1\0\4\0\21\00056\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0003\0\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0=\0\v\3B\1\2\0016\1\0\0009\1\1\1)\2\1\0=\2\f\0016\1\0\0009\1\1\1)\2\0\0=\2\r\0016\1\0\0009\1\1\1)\2\1\0=\2\14\0016\1\0\0009\1\1\1)\2\1\0=\2\15\0016\1\0\0009\1\1\1)\2\0\0=\2\16\0016\1\0\0009\1\1\1)\2\0\0=\2\17\0016\1\0\0009\1\1\0015\2\19\0=\2\18\0016\1\0\0009\1\1\1)\2\1\0=\2\20\1K\0\1\0\30nvim_tree_lsp_diagnostics\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\28nvim_tree_disable_netrw\25nvim_tree_auto_close\24nvim_tree_auto_open\29nvim_tree_indent_markers\28nvim_tree_hide_dotfiles\21nvim_tree_follow\14on_attach\1\0\0\nsetup\14nvim-tree\frequire\0\18termguicolors\bopt\23loaded_netrwPlugin\17loaded_netrw\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n–\1\0\0\3\0\t\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0&hi Normal guibg=NONE ctermbg=NONE\bcmd\tdark\15background\6o\vmedium\26gruvbox_contrast_dark\6g\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n‘\2\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\2\18\1\0\0B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\1\5\0015\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3B\1\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\a\0\0\bcpp\6c\blua\bvim\vvimdoc\nquery\nsetup\28nvim-treesitter.configs\1\0\1\14with_sync\2\vupdate\28nvim-treesitter.install\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim', 'drop.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

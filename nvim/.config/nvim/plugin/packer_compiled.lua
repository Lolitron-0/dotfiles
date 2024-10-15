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
local package_path_str = "/home/niten/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?.lua;/home/niten/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?/init.lua;/home/niten/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?.lua;/home/niten/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/niten/.cache/nvim/packer_hererocks/2.1.1725453128/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n—\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\2\0\0\a~/\1\0\2\14log_level\nerror\31auto_session_suppress_dirs\0\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\foptions\14step_size\1\0\2\15horizontal\3\5\rvertical\3\5\1\0\2\tmode\vwindow\14step_size\0\fkeymaps\1\0\2\foptions\0\fkeymaps\0\1\0\2\nbasic\2\nextra\2\nsetup\rcinnamon\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["codeium.vim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nÕ\2\0\0\6\0\n\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0006\3\0\0'\5\3\0B\3\2\0A\1\0\0016\1\4\0009\1\5\1'\3\6\0B\1\2\0016\1\4\0009\1\5\1'\3\a\0B\1\2\0016\1\4\0009\1\5\1'\3\b\0B\1\2\0016\1\4\0009\1\5\1'\3\t\0B\1\2\1K\0\1\0Jhi DashboardKey cterm=bold ctermfg=lightcyan gui=bold guifg=lightcyan.hi DashboardDesc ctermfg=8 guifg=darkgrey.hi DashboardIcon ctermfg=8 guifg=darkgrey#hi link DashboardHeader String\bcmd\bvim\21dashdoard_config\nsetup\14dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/niten/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/nvimdev/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["drop.nvim"] = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\3\0\0\nalpha\fstarter\1\0\2\ntheme\vleaves\14filetypes\0\nsetup\tdrop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/niten/.local/share/nvim/site/pack/packer/opt/drop.nvim",
    url = "https://github.com/folke/drop.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n¸\1\0\0\3\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0=\1\6\0006\0\4\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0&hi Normal guibg=NONE ctermbg=NONE\bcmd\tdark\15background\6o\bvim\1\0\2\21transparent_mode\2\rcontrast\thard\nsetup\fgruvbox\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nc\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/niten/.local/share/nvim/site/pack/packer/opt/markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/markdown.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nx\0\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\5\0005\4\4\0=\4\6\3B\0\3\1K\0\1\0\tlldb\1\0\1\tlldb\0\1\3\0\0\6c\bcpp\16launch.json\18load_launchjs\19dap.ext.vscode\frequire4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rcontinue\bdap\frequireÊ\3\1\0\b\0\21\0=6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0003\4\t\0004\5\0\0B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0006\5\0\0'\a\1\0B\5\2\0029\5\14\5B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\15\0003\5\16\0B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\17\0006\5\0\0'\a\1\0B\5\2\0029\5\18\5B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\19\0006\5\0\0'\a\1\0B\5\2\0029\5\20\5B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0006\5\0\0'\a\1\0B\5\2\0029\5\14\5B\1\4\1K\0\1\0\14step_into\n<F11>\14step_over\n<F10>\0\t<F5>\22toggle_breakpoint\t<F9>\6n\bset\vkeymap\0\19LoadLaunchJSON\29nvim_create_user_command\bapi\bvim\1\0\3\ttype\15executable\fcommand\25/usr/bin/lldb-dap-18\tname\tlldb\tlldb\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\nclose\ttree\topen;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\nclose\ttree\topen;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\topen\ttree\nclose;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\topen\ttree\nclose·\5\1\0\a\0\29\0=6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\n\0004\5\5\0005\6\6\0>\6\1\0055\6\a\0>\6\2\0055\6\b\0>\6\3\0055\6\t\0>\6\4\5=\5\v\4>\4\1\0035\4\14\0004\5\3\0005\6\f\0>\6\1\0055\6\r\0>\6\2\5=\5\v\4>\4\2\3=\3\15\2B\0\2\0016\0\0\0'\2\16\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0026\2\0\0'\4\17\0B\2\2\0029\3\18\0009\3\19\0039\3\20\0033\4\22\0=\4\21\0039\3\18\0009\3\19\0039\3\23\0033\4\24\0=\4\21\0039\3\18\0009\3\19\0039\3\25\0033\4\26\0=\4\21\0039\3\18\0009\3\19\0039\3\27\0033\4\28\0=\4\21\0032\0\0€K\0\1\0\0\17event_exited\0\21event_terminated\0\vlaunch\0\17dapui_config\vattach\vbefore\14listeners\18nvim-tree.api\bdap\flayouts\1\0\3\tsize\3\n\rposition\vbottom\relements\0\1\0\2\aid\fconsole\tsize\4\0€€€ÿ\3\1\0\2\aid\trepl\tsize\4\0€€€ÿ\3\relements\1\0\3\tsize\3(\rposition\nright\relements\0\1\0\2\aid\fwatches\tsize\4³æÌ™\3³æŒþ\3\1\0\2\aid\16breakpoints\tsize\4³æÌ™\3³æŒþ\3\1\0\2\aid\vstacks\tsize\4\0€€Àþ\3\1\0\2\aid\vscopes\tsize\4Í™³æ\fÌ™óþ\3\nicons\1\0\2\nicons\0\flayouts\0\1\0\3\14collapsed\bî­°\rexpanded\bï‘‹\18current_frame\bî­°\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21show_stop_reason\1\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nk\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0À\vbuffer\tdesc\1\0\5\vnowait\2\tdesc\0\vsilent\2\fnoremap\2\vbuffer\0\16nvim-tree: ¤\3\1\1\v\0\26\0:6\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a\18\b\2\0'\n\r\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0009\a\15\0019\a\16\a9\a\17\a\18\b\2\0'\n\18\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\19\0009\a\15\0019\a\20\a9\a\21\a\18\b\2\0'\n\22\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\23\0009\a\15\0019\a\20\a9\a\24\a\18\b\2\0'\n\25\0B\b\2\0A\3\3\0012\0\0€K\0\1\0\21Open: horizontal\15horizontal\6i\19Open: vertical\rvertical\topen\6s\bRun\vsystem\brun\tnode\6S\tHelp\16toggle_help\ttree\6?\6n\bset\vkeymap\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire‘\4\1\0\4\0\21\00056\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0003\0\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0=\0\v\3B\1\2\0016\1\0\0009\1\1\1)\2\1\0=\2\f\0016\1\0\0009\1\1\1)\2\0\0=\2\r\0016\1\0\0009\1\1\1)\2\1\0=\2\14\0016\1\0\0009\1\1\1)\2\1\0=\2\15\0016\1\0\0009\1\1\1)\2\0\0=\2\16\0016\1\0\0009\1\1\1)\2\0\0=\2\17\0016\1\0\0009\1\1\0015\2\19\0=\2\18\0016\1\0\0009\1\1\1)\2\1\0=\2\20\1K\0\1\0\30nvim_tree_lsp_diagnostics\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\28nvim_tree_disable_netrw\25nvim_tree_auto_close\24nvim_tree_auto_open\29nvim_tree_indent_markers\28nvim_tree_hide_dotfiles\21nvim_tree_follow\14on_attach\1\0\1\14on_attach\0\nsetup\14nvim-tree\frequire\0\18termguicolors\bopt\23loaded_netrwPlugin\17loaded_netrw\6g\bvim\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "markdown.nvim" },
    config = { "\27LJ\2\nË\2\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\2\18\1\0\0B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\1\5\0015\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3B\1\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\2\14highlight\0\21ensure_installed\0\1\n\0\0\bcpp\6c\blua\bvim\vvimdoc\nquery\bnix\rmarkdown\20markdown_inline\nsetup\28nvim-treesitter.configs\1\0\1\14with_sync\2\vupdate\28nvim-treesitter.install\frequire\0" },
    loaded = true,
    only_config = true,
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
  ["transparent.nvim"] = {
    config = { "\27LJ\2\nø\3\0\0\4\0\f\0\0296\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\t\0'\2\n\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\t\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15CursorLine\14Dashboard\17clear_prefix\vgroups\1\0\1\vgroups\0\1\26\0\0\vNormal\rNormalNC\fComment\rConstant\fSpecial\15Identifier\14Statement\fPreProc\tType\15Underlined\tTodo\vString\rFunction\16Conditional\vRepeat\rOperator\14Structure\vLineNr\fNonText\15SignColumn\17CursorLineNr\16EndOfBuffer\rNormalSB\nPmenu\17CocInlayHint\nsetup\16transparent\frequireGhi CursorLine ctermbg=None guibg=None term=underline gui=underline\bcmd\bvim\0" },
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["vim-sublime-monokai"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/vim-sublime-monokai",
    url = "https://github.com/ErichDonGubler/vim-sublime-monokai"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/niten/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\foptions\14step_size\1\0\2\15horizontal\3\5\rvertical\3\5\1\0\2\tmode\vwindow\14step_size\0\fkeymaps\1\0\2\foptions\0\fkeymaps\0\1\0\2\nbasic\2\nextra\2\nsetup\rcinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\nclose\ttree\topen;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\nclose\ttree\topen;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\topen\ttree\nclose;\0\0\2\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\1À\2À\topen\ttree\nclose·\5\1\0\a\0\29\0=6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\n\0004\5\5\0005\6\6\0>\6\1\0055\6\a\0>\6\2\0055\6\b\0>\6\3\0055\6\t\0>\6\4\5=\5\v\4>\4\1\0035\4\14\0004\5\3\0005\6\f\0>\6\1\0055\6\r\0>\6\2\5=\5\v\4>\4\2\3=\3\15\2B\0\2\0016\0\0\0'\2\16\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0026\2\0\0'\4\17\0B\2\2\0029\3\18\0009\3\19\0039\3\20\0033\4\22\0=\4\21\0039\3\18\0009\3\19\0039\3\23\0033\4\24\0=\4\21\0039\3\18\0009\3\19\0039\3\25\0033\4\26\0=\4\21\0039\3\18\0009\3\19\0039\3\27\0033\4\28\0=\4\21\0032\0\0€K\0\1\0\0\17event_exited\0\21event_terminated\0\vlaunch\0\17dapui_config\vattach\vbefore\14listeners\18nvim-tree.api\bdap\flayouts\1\0\3\tsize\3\n\rposition\vbottom\relements\0\1\0\2\aid\fconsole\tsize\4\0€€€ÿ\3\1\0\2\aid\trepl\tsize\4\0€€€ÿ\3\relements\1\0\3\tsize\3(\rposition\nright\relements\0\1\0\2\aid\fwatches\tsize\4³æÌ™\3³æŒþ\3\1\0\2\aid\16breakpoints\tsize\4³æÌ™\3³æŒþ\3\1\0\2\aid\vstacks\tsize\4\0€€Àþ\3\1\0\2\aid\vscopes\tsize\4Í™³æ\fÌ™óþ\3\nicons\1\0\2\nicons\0\flayouts\0\1\0\3\14collapsed\bî­°\rexpanded\bï‘‹\18current_frame\bî­°\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nx\0\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\5\0005\4\4\0=\4\6\3B\0\3\1K\0\1\0\tlldb\1\0\1\tlldb\0\1\3\0\0\6c\bcpp\16launch.json\18load_launchjs\19dap.ext.vscode\frequire4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rcontinue\bdap\frequireÊ\3\1\0\b\0\21\0=6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0003\4\t\0004\5\0\0B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0006\5\0\0'\a\1\0B\5\2\0029\5\14\5B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\15\0003\5\16\0B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\17\0006\5\0\0'\a\1\0B\5\2\0029\5\18\5B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\19\0006\5\0\0'\a\1\0B\5\2\0029\5\20\5B\1\4\0016\1\5\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0006\5\0\0'\a\1\0B\5\2\0029\5\14\5B\1\4\1K\0\1\0\14step_into\n<F11>\14step_over\n<F10>\0\t<F5>\22toggle_breakpoint\t<F9>\6n\bset\vkeymap\0\19LoadLaunchJSON\29nvim_create_user_command\bapi\bvim\1\0\3\ttype\15executable\fcommand\25/usr/bin/lldb-dap-18\tname\tlldb\tlldb\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\3\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0=\1\6\0006\0\4\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0&hi Normal guibg=NONE ctermbg=NONE\bcmd\tdark\15background\6o\bvim\1\0\2\21transparent_mode\2\rcontrast\thard\nsetup\fgruvbox\frequire\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n—\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\2\0\0\a~/\1\0\2\14log_level\nerror\31auto_session_suppress_dirs\0\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21show_stop_reason\1\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nË\2\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\2\18\1\0\0B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\1\5\0015\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3B\1\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\2\14highlight\0\21ensure_installed\0\1\n\0\0\bcpp\6c\blua\bvim\vvimdoc\nquery\bnix\rmarkdown\20markdown_inline\nsetup\28nvim-treesitter.configs\1\0\1\14with_sync\2\vupdate\28nvim-treesitter.install\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nk\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0À\vbuffer\tdesc\1\0\5\vnowait\2\tdesc\0\vsilent\2\fnoremap\2\vbuffer\0\16nvim-tree: ¤\3\1\1\v\0\26\0:6\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a\18\b\2\0'\n\r\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0009\a\15\0019\a\16\a9\a\17\a\18\b\2\0'\n\18\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\19\0009\a\15\0019\a\20\a9\a\21\a\18\b\2\0'\n\22\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\23\0009\a\15\0019\a\20\a9\a\24\a\18\b\2\0'\n\25\0B\b\2\0A\3\3\0012\0\0€K\0\1\0\21Open: horizontal\15horizontal\6i\19Open: vertical\rvertical\topen\6s\bRun\vsystem\brun\tnode\6S\tHelp\16toggle_help\ttree\6?\6n\bset\vkeymap\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire‘\4\1\0\4\0\21\00056\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0003\0\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0=\0\v\3B\1\2\0016\1\0\0009\1\1\1)\2\1\0=\2\f\0016\1\0\0009\1\1\1)\2\0\0=\2\r\0016\1\0\0009\1\1\1)\2\1\0=\2\14\0016\1\0\0009\1\1\1)\2\1\0=\2\15\0016\1\0\0009\1\1\1)\2\0\0=\2\16\0016\1\0\0009\1\1\1)\2\0\0=\2\17\0016\1\0\0009\1\1\0015\2\19\0=\2\18\0016\1\0\0009\1\1\1)\2\1\0=\2\20\1K\0\1\0\30nvim_tree_lsp_diagnostics\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\28nvim_tree_disable_netrw\25nvim_tree_auto_close\24nvim_tree_auto_open\29nvim_tree_indent_markers\28nvim_tree_hide_dotfiles\21nvim_tree_follow\14on_attach\1\0\1\14on_attach\0\nsetup\14nvim-tree\frequire\0\18termguicolors\bopt\23loaded_netrwPlugin\17loaded_netrw\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: transparent.nvim
time([[Config for transparent.nvim]], true)
try_loadstring("\27LJ\2\nø\3\0\0\4\0\f\0\0296\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\t\0'\2\n\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\t\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15CursorLine\14Dashboard\17clear_prefix\vgroups\1\0\1\vgroups\0\1\26\0\0\vNormal\rNormalNC\fComment\rConstant\fSpecial\15Identifier\14Statement\fPreProc\tType\15Underlined\tTodo\vString\rFunction\16Conditional\vRepeat\rOperator\14Structure\vLineNr\fNonText\15SignColumn\17CursorLineNr\16EndOfBuffer\rNormalSB\nPmenu\17CocInlayHint\nsetup\16transparent\frequireGhi CursorLine ctermbg=None guibg=None term=underline gui=underline\bcmd\bvim\0", "config", "transparent.nvim")
time([[Config for transparent.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd markdown.nvim ]]

-- Config for: markdown.nvim
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0", "config", "markdown.nvim")

time([[Sequenced loading]], false)
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

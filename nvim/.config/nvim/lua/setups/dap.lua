return {setup = function()
  local dap = require('dap')
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-dap-18', -- adjust as needed, must be absolute path
    name = 'lldb'
  }

  vim.api.nvim_create_user_command('LoadLaunchJSON', function()
    require('dap.ext.vscode').load_launchjs("launch.json",
      { lldb = { 'c', 'cpp' } })
  end, {})

  vim.keymap.set('n', '<F9>', require 'dap'.toggle_breakpoint)
  vim.keymap.set('n', '<F5>', function()
    require 'dap'.continue()
  end)
  vim.keymap.set('n', '<F10>', require 'dap'.step_over)
  vim.keymap.set('n', '<F11>', require 'dap'.step_into)
  vim.keymap.set('n', '<F9>', require 'dap'.toggle_breakpoint)
end}


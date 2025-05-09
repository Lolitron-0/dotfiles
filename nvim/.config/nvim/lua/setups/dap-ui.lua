return {setup = function()
  require("dapui").setup {
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

  local dap, dapui, tree = require("dap"), require("dapui"), require("nvim-tree.api")
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
end}

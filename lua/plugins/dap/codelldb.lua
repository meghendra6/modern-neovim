local M = {}

function M.setup()
  local dap = require "dap"
  dap.adapters.codelldb = {
    type = "server",
    host = "192.168.30.13",
    port = 1234, -- 💀 Use the port printed out or specified with `--port`
    executable = {
      command = "/Users/scottlee/.vimconfig/modern-neovim/lua/plugins/dap/codelldb/extension/adapter/codelldb",
      args = { "--port", "1234" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  local dap = require "dap"
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  -- If you want to use this for Rust and C, add something like this:

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return M

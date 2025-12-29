return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function(_, opts)
      -- Run the default AstroNvim/Mason setup first
      require("dap").listeners.after.event_initialized["dapui_config"] = function() require("dapui").open() end

      local dap = require "dap"

      -- Configure Odin to use codelldb
      dap.configurations.odin = {
        {
          name = "Launch file",
          type = "codelldb", -- This must match the adapter name setup by Mason
          request = "launch",
          -- Ask for the executable path when starting the debugger
          program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- Optional: Allow gdb/lldb to attach to running processes if needed
      dap.configurations.odin[2] = {
        name = "Attach to process",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      }
    end,
  },
}

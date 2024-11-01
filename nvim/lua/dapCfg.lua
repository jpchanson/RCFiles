local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

local dap_ui = require("dapui")
dap_ui.setup()
--dap_ui.setup({
--icons = { expanded = "▾", collapsed = "▸" },
--  mappings = {
--    open = "o",
--    remove = "d",
--    edit = "e",
--    repl = "r",
--    toggle = "t",
--  },
--  expand_lines = vim.fn.has("nvim-0.7"),
--  layouts = {
--    {
--      elements = {
--        "scopes",
--      },
--      size = 0.3,
--      position = "right"
--    },
--    {
--      elements = {
--        "repl",
--        "breakpoints"
--      },
--      size = 0.3,
--      position = "bottom",
--    },
--  },
--  floating = {
--    max_height = nil,
--    max_width = nil,
--    border = "single",
--    mappings = {
--      close = { "q", "<Esc>" },
--    },
--  },
--  windows = { indent = 1 },
--  render = {
--    max_type_length = nil,
--  },
--})

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })
-- Start debugging session
vim.keymap.set("n", "<leader>ds", function()
  dap.continue()
  dap_ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)
 
-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>dC", function()
  dap.clear_breakpoints()
end)
 
-- Close debugger and clear breakpoints
vim.keymap.set("n", "<leader>de", function()
  dap.clear_breakpoints()
  dap_ui.toggle({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
end)

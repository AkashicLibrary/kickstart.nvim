local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
  print 'nvim-dap not installed!'
  return
end

require('dap').set_log_level 'INFO' -- Helps when configuring DAP, see logs with :DapShowLog

dap.configurations = {
  go = {
    {
      type = 'go', -- Which adapter to use
      name = 'Debug', -- Human readable name
      request = 'launch', -- Whether to "launch" or "attach" to program
      program = '${file}', -- The buffer you are focused on when running nvim-dap
    },
  },
}

dap.adapters = {
  go = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.stdpath 'data' .. '/mason/bin/dlv',
      args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
  },
}

local dap_ui_ok, ui = pcall(require, 'dapui')
if not (dap_ok and dap_ui_ok) then
  require 'notify'('dap-ui not installed!', 'warning')
  return
end

ui.setup {
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has 'nvim-0.7',
  layouts = {
    {
      elements = {
        'scopes',
      },
      size = 0.3,
      position = 'right',
    },
    {
      elements = {
        'repl',
        'breakpoints',
      },
      size = 0.3,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = 'single',
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
}
local dap_ok, dap = pcall(require, 'dap')
local dap_ui_ok, ui = pcall(require, 'dapui')

if not (dap_ok and dap_ui_ok) then
  require 'notify'('nvim-dap or dap-ui not installed!', 'warning') -- nvim-notify is a separate plugin, I recommend it too!
  return
end

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

-- Start debugging session
vim.keymap.set('n', '<localleader>ls', function()
  dap.continue()
  ui.toggle {}
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', false, true, true), 'n', false) -- Spaces buffers evenly
end, { desc = 'Start debugging session' })

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set('n', '<localleader>ll', require('dap.ui.widgets').hover, { desc = 'Hover' })
vim.keymap.set('n', '<localleader>lc', dap.continue, { desc = 'Continue' })
vim.keymap.set('n', '<localleader>lb', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<localleader>ln', dap.step_over, { desc = 'Step over' })
vim.keymap.set('n', '<localleader>li', dap.step_into, { desc = 'Step into' })
vim.keymap.set('n', '<localleader>lo', dap.step_out, { desc = 'Step out' })
vim.keymap.set('n', '<localleader>lC', function()
  dap.clear_breakpoints()
  require 'notify'('Breakpoints cleared', 'warn')
end, { desc = 'Clear breakpoints' })

-- Close debugger and clear breakpoints
vim.keymap.set('n', '<localleader>le', function()
  dap.clear_breakpoints()
  ui.toggle {}
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', false, true, true), 'n', false)
  require 'notify'('Debugger session ended', 'warn')
end, { desc = 'End debugger session' })

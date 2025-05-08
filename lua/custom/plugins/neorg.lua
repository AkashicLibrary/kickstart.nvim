return {
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
          ['core.esupports.metagen'] = { config = { type = 'auto', update_date = true } },
          ['core.qol.toc'] = {},
          ['core.qol.todo_items'] = {},
          ['core.looking-glass'] = {},
          ['core.presenter'] = { config = { zen_mode = 'zen-mode' } },
          ['core.export'] = {},
          ['core.export.markdown'] = { config = { extensions = 'all' } },
          ['core.summary'] = {},
          ['core.tangle'] = { config = { report_on_empty = false } },
          ['core.ui.calendar'] = {},
          ['core.journal'] = {
            config = {
              strategy = 'nested',
              workspace = 'notes',
            },
          },
          ['core.keybinds'] = {
            config = {
              default_keybinds = true,
              neorg_leader = '<space>h',
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}

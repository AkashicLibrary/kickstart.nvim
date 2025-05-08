local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>ja', function()
  harpoon:list():add()
end, { desc = 'Add to harpoon list' })

vim.keymap.set('n', '<leader>j1', function()
  harpoon:list():select(1)
end, { desc = 'Select 1st item in list' })
vim.keymap.set('n', '<leader>j2', function()
  harpoon:list():select(2)
end, { desc = 'Select 2nd item in list' })
vim.keymap.set('n', '<leader>j3', function()
  harpoon:list():select(3)
end, { desc = 'Select 3rd item in list' })
vim.keymap.set('n', '<leader>j4', function()
  harpoon:list():select(4)
end, { desc = 'Select 4th item in list' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>jj', function()
  harpoon:list():prev()
end, { desc = 'Previous item in list' })
vim.keymap.set('n', '<leader>jh', function()
  harpoon:list():next()
end, { desc = 'Next item in list' })

local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

vim.keymap.set('n', '<leader>jk', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- vim be good
  'ThePrimeagen/vim-be-good',
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lualine').setup {
        icons_enabled = true,
        theme = 'tokyonight',
      }
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {
        enable_chat = true,
      }
    end,
  },
  {
    'nomnivore/ollama.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    -- All the user commands added by the plugin
    cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oo',
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = 'ollama prompt',
        mode = { 'n', 'v' },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oG',
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = 'ollama Generate Code',
        mode = { 'n', 'v' },
      },
    },

    ---@type Ollama.Config
    opts = {},
  },
  -- {
  -- 'altermo/nwm',
  -- branch = 'x11',
  -- },
  { -- This plugin
    'Zeioth/compiler.nvim',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    dependencies = { 'stevearc/overseer.nvim' },
    opts = {},
  },
  { -- The task runner we use
    'stevearc/overseer.nvim',
    commit = '68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    opts = {
      task_list = {
        direction = 'bottom',
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  'mfussenegger/nvim-dap',
  'nvim-treesitter/nvim-treesitter-context',
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6', --recommended as each new version will have breaking changes
    opts = {
      --Config goes here
    },
  },
  'folke/twilight.nvim',
  'folke/zen-mode.nvim',
  {
    'gennaro-tedesco/nvim-possession',
    dependencies = {
      'ibhagwan/fzf-lua',
    },
    config = true,
    init = function()
      local possession = require 'nvim-possession'
      vim.keymap.set('n', '<leader>bb', function()
        possession.list()
      end, { desc = 'List Sessions' })
      vim.keymap.set('n', '<leader>bn', function()
        possession.new()
      end, { desc = 'New Session' })
      vim.keymap.set('n', '<leader>bu', function()
        possession.update()
      end, { desc = 'Update Session' })
      vim.keymap.set('n', '<leader>bk', function()
        possession.delete()
      end, { desc = 'Kill Session' })
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  'turbio/bracey.vim',
  'alec-gibson/nvim-tetris',
  'seandewar/nvimesweeper',
  'seandewar/killersheep.nvim',
  'rktjmp/playtime.nvim',
  {
    'alanfortlink/blackjack.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'jim-fx/sudoku.nvim',
    cmd = 'Sudoku',
    config = function()
      require('sudoku').setup {}
    end,
  },
  'eandrju/cellular-automaton.nvim',
  'nanotee/zoxide.vim',
  'junegunn/fzf.vim',
  'junegunn/fzf',
  'jay-babu/mason-nvim-dap.nvim',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
  },
  'aserowy/tmux.nvim',
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
}

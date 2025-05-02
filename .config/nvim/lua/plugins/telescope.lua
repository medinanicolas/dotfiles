-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy", -- Load when needed
  branch = '0.1.x',
  dependencies = {
     'nvim-lua/plenary.nvim',
     -- Optional: fzf-native for performance boost
     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        -- Default configuration
      },
      extensions = {
        fzf = { -- Requires telescope-fzf-native.nvim
           fuzzy = true,                    -- false will only do exact matching
           override_generic_sorter = true,  -- override the generic sorter
           override_file_sorter = true,     -- override the file sorter
           case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
    })

    -- Load fzf extension if installed
    pcall(telescope.load_extension, 'fzf')

    -- Keymaps (keep them close to the plugin setup)
    local map = vim.keymap.set
    map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    map('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    map('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld Files'}) -- Example: Add more finders
  end,
}


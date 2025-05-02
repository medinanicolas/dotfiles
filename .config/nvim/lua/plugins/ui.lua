-- ~/.config/nvim/lua/plugins/ui.lua

return {
  -- Bufferline for visual tabs
  {
    'akinsho/bufferline.nvim',
    version = "*", -- Or specify a git tag like "v4.4.0"
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          -- Enable mouse clicks
          clickable = true,
          -- Show buffer numbers
          numbers = "ordinal", -- "buffer_id" | "both" | function(...)
          -- Show close icon
          indicator = { style = 'icon', icon = '▎'},
          buffer_close_icon = '', -- Requires Nerd Font
          modified_icon = '●',
          close_icon = '', -- Requires Nerd Font
          -- Use nvim-web-devicons
          show_devicons = true,
          -- Other options...
          separator_style = "thin", -- "slant" | "thick" | "thin" | { "any", "any" }
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true
            }
          },
        }
      })
    end
  },

  -- Toggleable Terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = 20, -- default size
      open_mapping = [[<c-\>]], -- Map Ctrl+\ to open/toggle
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2, -- Darker shading
      start_in_insert = true,
      insert_mappings = true, -- Close with Esc in Insert mode
      persist_size = true,
      direction = 'float', -- 'vertical' | 'horizontal' | 'float'
      close_on_exit = true, -- Close the terminal window when the process exits
      shell = vim.o.shell, -- Use default shell
      float_opts = {
        -- Options passed to nvim_open_win
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
        winblend = 0, -- Transparency
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      }
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Keymaps for ToggleTerm
      local map = vim.keymap.set
      local term_opts = { noremap = true, silent = true }

      -- Toggle terminal with Ctrl+\ (set in opts.open_mapping)
      -- map('n', '<C-\\>', '<cmd>ToggleTerm<CR>', term_opts) -- Handled by open_mapping

      -- Open specific terminals (Example)
      map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'ToggleTerm [V]ertical' })
      map('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'ToggleTerm [H]orizontal' })
      map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'ToggleTerm [F]loat' })

      -- Custom function to close terminal with Esc in Normal mode
      function _G.set_terminal_keymaps()
        local buf_map = vim.keymap.set
        buf_map('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 }) -- Go to Normal mode first
        buf_map('n', '<esc>', '<cmd>ToggleTerm<CR>', { buffer = 0, desc = 'Close Terminal' }) -- Then toggle term
      end

      -- Use TermOpen autocmd to set keymaps for terminal buffers
      vim.cmd('autocmd TermOpen term://* lua set_terminal_keymaps()')
    end
  },
}



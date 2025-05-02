-- ~/.config/nvim/lua/plugins/core.lua
return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load early
    priority = 1000, -- High priority
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Need icons
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight',
          -- Add other lualine options here if desired
          -- component_separators = '|', item_separators = ' ',
        }
      })
    end,
  },

  -- Icons (Dependency for lualine, nvim-tree, etc.)
  { 'nvim-tree/nvim-web-devicons', lazy = true },
}


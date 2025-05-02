-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort_by = "name",
      view = {
        width = 30, -- Set the width of the tree
      },
      renderer = {
        group_empty = true, -- Show empty folders
      },
      filters = {
        dotfiles = true, -- Show dotfiles
      },
      -- Optional: Disable netrw
      disable_netrw = true,
      hijack_netrw = true,
    })
    -- Keymap is in core/keymaps.lua
  end,
}


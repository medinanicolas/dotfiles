-- ~/.config/nvim/lua/plugins/git.lua
return {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPre", "BufNewFile" }, -- Load when opening files
  config = function()
    require('gitsigns').setup({
      -- signs = { ... }, -- Default signs are usually fine
      -- numhl = true,    -- Highlight line number
      -- linehl = false,  -- Highlight full line
      -- current_line_blame = false, -- Enable blame info on current line
    })
  end
}


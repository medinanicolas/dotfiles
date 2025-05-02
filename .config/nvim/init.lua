-- ~/.config/nvim/init.lua

-- Set Leader keys (before anything else)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- Add lazy to runtime path

-- Setup lazy.nvim: Load plugin specs from lua/plugins directory
require("lazy").setup("plugins", {
  -- You can add lazy.nvim options here if needed later
  -- defaults = { lazy = true }, -- Example: Make plugins lazy load by default
  install = { colorscheme = { "tokyonight" } }, -- Optional: Ensure colorscheme is loaded first
  checker = { enabled = true, notify = false }, -- Optional: Check for plugin updates automatically
})

-- Load core configuration after plugins
require("core.options")
require("core.keymaps")



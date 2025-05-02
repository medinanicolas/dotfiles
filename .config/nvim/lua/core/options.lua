-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt -- Alias for vim.opt

-- ## Appearance ##
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.number = true        -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers
opt.signcolumn = "yes"   -- Always show the sign column to avoid layout shifts
opt.showmode = false     -- Don't show mode in command line (lualine handles this)
opt.linebreak = true     -- Break lines at characters (respects word boundaries)
opt.wrap = false         -- Disable line wrapping

-- ## Behavior ##
opt.mouse = "a"          -- Enable mouse support in all modes
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false     -- Don't create swap files
opt.backup = false       -- Don't create backup files

-- ## Persistent Undo ## -- Corrected Section
opt.undofile = true      -- Enable persistent undo
-- Calculate the path for the undo directory
local undodir_path = vim.fn.stdpath("data") .. "/undodir"
-- Set the Neovim option
vim.opt.undodir = undodir_path
-- Check and create the directory using the path string directly
if vim.fn.isdirectory(undodir_path) == 0 then
   vim.fn.mkdir(undodir_path, "p")
end

-- ## Searching ##
opt.ignorecase = true    -- Ignore case when searching...
opt.smartcase = true     -- ...unless the pattern contains uppercase letters
opt.hlsearch = true      -- Highlight search results
opt.incsearch = true     -- Show search results incrementally

-- ## Performance / Responsiveness ##
opt.updatetime = 300     -- Faster update time for plugins (like Git signs)
opt.timeoutlen = 500     -- Shorter timeout for key sequences (e.g., leader keys)

-- ## Window / Split Management ##
opt.splitright = true    -- Open vertical splits to the right
opt.splitbelow = true    -- Open horizontal splits below

-- ## Scrolling ##
opt.scrolloff = 8        -- Keep cursor N lines away from top/bottom
opt.sidescrolloff = 8    -- Keep cursor N columns away from sides

-- ## Tabs / Indentation ##
opt.tabstop = 4          -- Number of spaces a <Tab> counts for
opt.softtabstop = 4      -- Number of spaces inserted for a <Tab>
opt.shiftwidth = 4       -- Number of spaces for autoindent
opt.expandtab = true     -- Use spaces instead of tabs
opt.autoindent = true    -- Copy indent from current line when starting a new line
opt.smartindent = true   -- Be smart about indentation

-- ## Diagnostics Appearance ##
vim.diagnostic.config({
  virtual_text = true, signs = { active = true, text = {
    [vim.diagnostic.severity.ERROR] = "", [vim.diagnostic.severity.WARN] = "",
    [vim.diagnostic.severity.HINT] = "💡", [vim.diagnostic.severity.INFO] = "",
  }}, underline = true, update_in_insert = false, severity_sort = true,
})

-- print("Core options loaded") -- Optional: Confirmation message (uncomment to debug loading)


-- ~/.config/nvim/lua/core/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ## General ##
-- Leader key set in init.lua

-- ## Navigation ##
-- Example window navigation (uncomment if desired)
-- map('n', '<A-h>', '<C-w>h', { desc = 'Navigate window left' })
-- map('n', '<A-j>', '<C-w>j', { desc = 'Navigate window down' })
-- map('n', '<A-k>', '<C-w>k', { desc = 'Navigate window up' })
-- map('n', '<A-l>', '<C-w>l', { desc = 'Navigate window right' })

-- ## Tabs & Buffers ## -- New Section
map("n", "<leader>tn", ":tabnew<CR>", { desc = "[T]ab [N]ew" }) -- New tab
map("n", "<leader>tc", ":tabclose<CR>", { desc = "[T]ab [C]lose" }) -- Close current tab
map("n", "<leader>to", ":tabonly<CR>", { desc = "[T]ab [O]nly" }) -- Close other tabs
map("n", "<leader>t]", ":tabnext<CR>", { desc = "[T]ab Next (])" }) -- Go to next tab
map("n", "<leader>t[", ":tabprevious<CR>", { desc = "[T]ab Previous ([)" }) -- Go to previous tab

map("n", "<leader>bn", ":enew<CR>", { desc = "[B]uffer [N]ew" }) -- New empty buffer
map("n", "<leader>bd", ":bdelete<CR>", { desc = "[B]uffer [D]elete" }) -- Close/delete current buffer
-- Use <leader>fb (Telescope) to switch buffers

-- ## LSP ##
map("n", "<leader>gD", function()
	vim.lsp.buf.definition({ jump_type = "tabnew" })
end, { desc = "LSP Go to Definition (New Tab)" })
-- ## Nvim Tree ##
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer [E]" })

-- ## Telescope ##
-- Defined within lua/plugins/telescope.lua

-- ## LSP ##
-- Defined within lua/plugins/lsp.lua

-- ## Formatting (Conform) ##
map("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- ## Linting (nvim-lint) ##
map("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting" })

-- ## Window Management ## -- New Section
map('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertical' }) -- Split window vertically
map('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontal' }) -- Split window horizontally
map('n', '<leader>sc', '<cmd>close<CR>', { desc = '[S]plit [C]lose' }) -- Close current window split

-- Inside lua/core/keymaps.lua -> ## Window Management ## section

map('n', '<leader>h', '<C-w>h', { desc = 'Navigate window left' })
map('n', '<leader>j', '<C-w>j', { desc = 'Navigate window down' })
map('n', '<leader>k', '<C-w>k', { desc = 'Navigate window up' })
map('n', '<leader>l', '<C-w>l', { desc = 'Navigate window right' })

-- ## Commenting (Comment.nvim) ##
map("n", "gcc", "<cmd>CommentToggle<CR>", { desc = "Comment toggle current line" })
map("v", "gc", "<cmd>CommentToggle<CR>", { desc = "Comment toggle selection" })

-- ## ToggleTerm ##
-- Keymaps defined within lua/plugins/ui.lua

-- print("Core keymaps loaded") -- Optional: Confirmation message


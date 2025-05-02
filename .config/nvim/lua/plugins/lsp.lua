-- ~/.config/nvim/lua/plugins/lsp.lua
-- Configures LSP, Mason (LSP/Linter/Formatter installer), and related tools
return {
  -- LSP Management (Mason)
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- Make Mason command available without full load
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
        ensure_installed = {
          -- Linters (managed here)
          "luacheck", "shellcheck", "flake8", "eslint_d", "phpcs", "golangci-lint",
          -- Formatters (managed here)
          "stylua", "shfmt", "black", "prettier", "phpcsfixer", "goimports",
        }
      })
    end
  },

  -- Bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        -- Ensure LSPs listed here are installed by Mason and configured by lspconfig
        ensure_installed = {
          "lua_ls", "bashls", "rust_analyzer", "pyright", "ts_ls", "intelephense", "gopls"
        }
        -- automatic_installation = true, -- Optionally install LSPs automatically if not found
      })
    end,
  },

  -- Core LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Load LSP configs early
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- For capabilities integration
      -- Optional: Add plugins for LSP enhancements like UI elements
      -- 'folke/neodev.nvim', -- For Lua development in Neovim config
    },
    config = function()
      -- Optional: Configure neodev for Lua development helper
      -- require('neodev').setup()

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Get capabilities from nvim-cmp

      -- Setup language servers based on what mason-lspconfig finds
      require('mason-lspconfig').setup_handlers({
        -- Default handler: Sets up server with cmp capabilities and common settings
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              -- Standard LSP keymaps (can be moved to core/keymaps.lua if preferred)
              local bufmap = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
              end

              bufmap('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
              bufmap('n', 'gd', vim.lsp.buf.definition, 'LSP Go to Definition')
              bufmap('n', 'gi', vim.lsp.buf.implementation, 'LSP Go to Implementation')
              bufmap('n', 'gr', vim.lsp.buf.references, 'LSP Go to References')
              bufmap('n', '<leader>rn', vim.lsp.buf.rename, 'LSP Rename')
              bufmap('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP Code Action')
              bufmap('n', '<leader>d', vim.diagnostic.open_float, 'Show Line Diagnostics')
              bufmap('n', ']d', vim.diagnostic.goto_next, 'Go to Next Diagnostic')
              bufmap('n', '[d', vim.diagnostic.goto_prev, 'Go to Previous Diagnostic')

              -- Optional: Highlight symbol under cursor
              -- vim.api.nvim_create_autocmd('CursorHold', {
              --   buffer = bufnr,
              --   callback = function() vim.lsp.buf.document_highlight() end
              -- })
              -- vim.api.nvim_create_autocmd('CursorMoved', {
              --   buffer = bufnr,
              --   callback = function() vim.lsp.buf.clear_references() end
              -- })

              -- Set other buffer-local options or autocommands based on LSP attachment if needed
              if client.supports_method("textDocument/formatting") then
                 bufmap('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, 'LSP Format Buffer')
              end
            end,
          })
        end,
        -- Add custom setups for specific servers here if needed:
        ["lua_ls"] = function ()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
               -- Reuse standard on_attach or define custom one
            end,
            settings = {
               Lua = {
                  diagnostics = { globals = {'vim'} } -- Silence warnings about 'vim' global
               }
            }
          }
        end,
      })
    end,
  },
}


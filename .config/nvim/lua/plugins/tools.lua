-- ~/.config/nvim/lua/plugins/tools.lua
return {
  -- Formatting (Conform)
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" }, -- Run formatting before saving buffer
    cmd = { "Format" }, -- Make :Format command available
    dependencies = { "mason.nvim" }, -- Needs mason to install formatters
    opts = {
      notify_on_error = false,
      -- No format_on_save needed, handled by BufWritePre event
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        rust = { "rustfmt" },
        javascript = { "prettier" }, typescript = { "prettier" },
        javascriptreact = { "prettier" }, typescriptreact = { "prettier" },
        html = { "prettier" }, css = { "prettier" }, json = { "prettier" },
        yaml = { "prettier" }, markdown = { "prettier" },
        php = { "phpcsfixer" }, go = { "goimports" }, sh = { "shfmt" },
      },
      -- Optional: Add setup for formatters that need specific args or config
    },
     config = function(_, opts)
       require("conform").setup(opts)
       -- Keymap is in core/keymaps.lua
    end,
  },

  -- Linting (nvim-lint)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile", "BufWritePost", "InsertLeave" }, -- When to check for linting
    dependencies = { "mason.nvim" }, -- Needs mason to install linters
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
		lua = { "luacheck" }, -- Explicitly set output format
		python = { "flake8" }, javascript = { "eslint_d" },
        typescript = { "eslint_d" }, javascriptreact = { "eslint_d" }, typescriptreact = { "eslint_d" },
        php = { "phpcs" }, go = { "golangci-lint" }, sh = { "shellcheck" }, rust = { "clippy" },
      }

      -- Autocommand to run linting automatically
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function(args)
          -- Use a timer to debounce linting on rapid events like InsertLeave
          if vim.bo[args.buf].buftype == "" then -- Only lint normal buffers
             vim.defer_fn(function()
                lint.try_lint()
             end, 100) -- Delay in ms
          end
        end,
      })
      -- Keymap is in core/keymaps.lua
    end,
  },
}


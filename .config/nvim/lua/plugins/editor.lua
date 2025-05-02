-- ~/.config/nvim/lua/plugins/editor.lu
return {
  -- Treesitter for Syntax Highlighting & More
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" }, -- Load early
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { -- Ensure parsers for languages you use are installed
          "c", "lua", "vim", "vimdoc", "query", "rust", "python", "javascript",
          "typescript", "tsx", "php", "go", "html", "css", "json", "yaml", "toml", "bash"
        },
        sync_install = false, -- Install parsers asynchronously
        auto_install = true, -- Automatically install missing parsers
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        -- Other modules can be enabled here
      })
    end,
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy", -- Load when needed
    opts = {}, -- Uses default config and keymaps (gcc, gc)
    config = function(_, opts)
       require("Comment").setup(opts)
    end,
  },

  -- Auto Pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter", -- Load when entering insert mode
    opts = {}, -- Uses default config
     config = function(_, opts)
       require("nvim-autopairs").setup(opts)
       -- Optional: If you have trouble with autopairs and cmp interaction
       local cmp_autopairs = require("nvim-autopairs.completion.cmp")
       local cmp = require("cmp")
       cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Indent Lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    event = "VeryLazy", -- Load when needed
    opts = { -- Optional: Customize appearance
      -- char = "▏", -- Example: Use a different character
      -- show_current_context = true,
      -- show_current_context_start = true,
    },
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
}


-- ~/.config/nvim/lua/plugins/completion.lua
return {
  -- Autocompletion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load when entering insert mode
    dependencies = {
      -- Sources
      "hrsh7th/cmp-nvim-lsp", -- LSP suggestions
      "hrsh7th/cmp-buffer",   -- Suggestions from current buffer text
      "hrsh7th/cmp-path",     -- Filesystem path suggestions
      "hrsh7th/cmp-cmdline",  -- Command line suggestions
      "saadparwaiz1/cmp_luasnip", -- Snippet suggestions
      -- Snippet Engine
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
          -- Use Tab/Shift-Tab to navigate completion options or jump through snippets
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }), -- i = insert mode, s = select mode
          ['<S-Tab>'] = cmp.mapping(function(fallback)
             if cmp.visible() then cmp.select_prev_item()
             elseif luasnip.jumpable(-1) then luasnip.jump(-1)
             else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- Optional: Setup cmdline completion
      cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = 'buffer' } }
      })
      cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
      })
    end,
  },
}


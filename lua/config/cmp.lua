-- =====================================
-- cmp.lua
-- Autocompletion engine
-- =====================================

local cmp = require("cmp")

cmp.setup({
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),            -- manual trigger
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- accept
    ["<Tab>"] = cmp.mapping.select_next_item(),        -- next suggestion
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),      -- previous
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP suggestions (rust-analyzer, lua_ls)
    { name = "luasnip" },  -- snippets
    { name = "buffer" },   -- words from current file
    { name = "path" },     -- file paths
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        buffer = "[Buf]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

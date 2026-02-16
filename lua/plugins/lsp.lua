-- =====================================
-- plugins/lsp.lua
-- LSP related plugins
-- =====================================

return {
  -- Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        -- rust_analyzer installed via rustup
      })
    end,
  },

  -- LSP Config
  { "neovim/nvim-lspconfig" },
}

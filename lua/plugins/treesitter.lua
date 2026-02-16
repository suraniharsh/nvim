-- =====================================
-- plugins/treesitter.lua
-- Syntax highlighting
-- =====================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "json",
      "yaml",
      "rust",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

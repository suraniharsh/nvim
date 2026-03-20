-- =====================================
-- plugins/init.lua
-- Plugin specs aggregator
-- =====================================

return {
  require("plugins.theme"),
  require("plugins.telescope"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.autopairs"),
  require("plugins.gitsigns"),
  require("plugins.indent-blankline"),
  require("plugins.treesitter"),
  require("plugins.ui"),
}

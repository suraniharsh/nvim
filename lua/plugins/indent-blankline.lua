-- =====================================
-- plugins/indent-blankline.lua
-- Indentation guides
-- =====================================

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = { char = "│" },
    scope = { enabled = false },
  },
}
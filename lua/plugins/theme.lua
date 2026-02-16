-- =====================================
-- plugins/theme.lua
-- Colorscheme
-- =====================================

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = true,
        native_lsp = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

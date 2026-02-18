-- =====================================
-- plugins/neotree.lua
-- Visual file explorer sidebar
-- =====================================

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
     filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      }
     },
      window = {
        position = "right", -- 👈 this makes it right sidebar
        width = 30,
      },
    })
  end,
}


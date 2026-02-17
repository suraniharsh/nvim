-- =====================================
-- plugins/telescope.lua
-- Fuzzy finder
-- =====================================

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help tags" },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          hidden = true,      -- show dotfiles
          no_ignore = false,  -- still respect .gitignore
        },
      },
      defaults = {
        file_ignore_patterns = {
          "target/",
          "node_modules/",
          "%.git/",
          "%.lock",
          "%.meta",
          "%.d",
        },
        preview = {
          treesitter = false, -- REQUIRED for Neovim 0.11 stability
        },
        prompt_prefix = "🔍 ",
        selection_caret = "➜ ",
        path_display = { "smart" },
      },
    })
  end,
}

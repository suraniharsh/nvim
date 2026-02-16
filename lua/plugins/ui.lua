-- =====================================
-- plugins/ui.lua
-- UI components (statusline, bufferline, dashboard)
-- =====================================

-- Helper function to read ASCII art from file
local function read_ascii_art()
  local config_path = vim.fn.stdpath("config")
  local art_file = config_path .. "/ascii-art.txt"
  local lines = {}

  local file = io.open(art_file, "r")
  if file then
    for line in file:lines() do
      table.insert(lines, line)
    end
    file:close()
  else
    -- Fallback if file doesn't exist
    lines = { "Neovim", "" }
  end

  return lines
end

return {
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        section_separators = "",
        component_separators = "",
        globalstatus = true,
      },
    },
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Load ASCII art from file
      dashboard.section.header.val = read_ascii_art()

      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("g", "󰊄  Live grep", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("r", "󰋚  Recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("c", "󰒓  Config", "<cmd>edit ~/.config/nvim/init.lua<cr>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<cr>"),
      }

      dashboard.section.footer.val = {
        "",
        "🚀 Ready to build something great",
      }

      alpha.setup(dashboard.opts)
    end,
  },
}

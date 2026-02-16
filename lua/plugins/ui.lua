-- =====================================
-- plugins/ui.lua
-- UI components (statusline, bufferline, dashboard)
-- =====================================

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

      dashboard.section.header.val = {
        "   _____                        _ _          _____            __                    __           ",
        "  / ___/__  ___________ _____  (_| )_____   / ___/__  _______/ /____  ____ ___     / /___  ____ _",
        "  \\__ \\/ / / / ___/ __ `/ __ \\/ /|// ___/   \\__ \\/ / / / ___/ __/ _ \\/ __ `__ \\   / / __ \\/ __ `/",
        " ___/ / /_/ / /  / /_/ / / / / /  (__  )   ___/ / /_/ (__  ) /_/  __/ / / / / /  / / /_/ / /_/ / ",
        "/____/\\__,_/_/   \\__,_/_/ /_/_/  /____/   /____/\\__, /____/\\__/\\___/_/ /_/ /_/  /_/\\____/\\__, /  ",
        "                                               /____/                                   /____/   ",
        "",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("g", "󰊄  Live grep", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("r", "󰋚  Recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("c", "  Config", "<cmd>edit ~/.config/nvim/init.lua<cr>"),
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

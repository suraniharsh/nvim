-- =====================================
-- lazy.lua
-- Plugin manager setup
-- =====================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- ======================
  -- Theme
  -- ======================
  {
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
  },

  -- ======================
  -- Telescope (preview ON, treesitter OFF)
  -- ======================
  {
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
        defaults = {
          preview = {
            treesitter =  false -- REQUIRED for Neovim 0.11 stability
          },
          prompt_prefix = "🔍 ",
          selection_caret = "➜ ",
          path_display = { "smart" },
        },
      })
    end,
  },

  -- ======================
  -- LSP Plugins (config in lua/config/lsp/)
  -- ======================
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
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
  { "neovim/nvim-lspconfig" },

  -- ======================
  -- Completion
  -- ======================
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- ======================
  -- Treesitter
  -- ======================
  {
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
  },

  -- ======================
  -- Statusline
  -- ======================
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

  -- ======================
  -- Bufferline
  -- ======================
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

  -- ======================
-- Dashboard (Alpha)
-- ======================
{
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header (clean, not cringe)
    dashboard.section.header.val = {
      "   _____                        _ _          _____            __                    __           ",
      "  / ___/__  ___________ _____  (_| )_____   / ___/__  _______/ /____  ____ ___     / /___  ____ _",
      "  \\__ \\/ / / / ___/ __ `/ __ \\/ /|// ___/   \\__ \\/ / / / ___/ __/ _ \\/ __ `__ \\   / / __ \\/ __ `/",
      " ___/ / /_/ / /  / /_/ / / / / /  (__  )   ___/ / /_/ (__  ) /_/  __/ / / / / /  / / /_/ / /_/ / ",
      "/____/\\__,_/_/   \\__,_/_/ /_/_/  /____/   /____/\\__, /____/\\__/\\___/_/ /_/ /_/  /_/\\____/\\__, /  ",
      "                                               /____/                                   /____/   ",
      "",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<cr>"),
      dashboard.button("g", "󰊄  Live grep", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("r", "󰋚  Recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("c", "  Config", "<cmd>edit ~/.config/nvim/init.lua<cr>"),
      dashboard.button("q", "󰅚  Quit", "<cmd>qa<cr>"),
    }

    -- Footer
    dashboard.section.footer.val = {
      "",
      "🚀 Ready to build something great",
    }

    alpha.setup(dashboard.opts)
  end,
}



})


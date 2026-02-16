-- ================================
-- init.lua
-- Main Neovim entry point
-- ================================

-- Load general editor options

require("config.lazy")		-- plugin manager
require("config.options")	-- editor settings
require("config.keymaps")	-- keymaps settings
require("config.cmp")       -- completion
require("config.lsp")       -- LSP configurations


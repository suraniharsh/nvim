-- ================================
-- init.lua
-- Main Neovim entry point
-- ================================

-- Load general editor options

require("config.lazy")		-- plugin manager
require("config.options")	-- editor settings
require("config.keymaps")	-- keymaps settings

-- vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")


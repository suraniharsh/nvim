-- =====================================
-- options.lua
-- Editor configuration and behavior
-- =====================================

-------------------------------------------------
-- LINE NUMBERS
-------------------------------------------------

-- Show absolute line number on the current line
-- Example: the line you're on shows "42"
vim.opt.number = true

-- Show relative line numbers on all other lines
-- Example: lines above/below show "1, 2, 3..."
-- This makes movement commands like 5j / 3k faster
vim.opt.relativenumber = true


-------------------------------------------------
-- SMART RELATIVE NUMBERS
-------------------------------------------------
-- Disable relative numbers while typing (Insert mode)
-- Reason: relative numbers are useful for navigation,
-- but distracting while editing text

-- Triggered when entering Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

-- Triggered when leaving Insert mode (back to Normal mode)
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})


-------------------------------------------------
-- OPTIONAL: QUICK TOGGLE KEYBIND
-------------------------------------------------
-- <leader>n toggles relative numbers on/off
-- Useful if you want manual control
-- <leader> is usually "\" unless you changed it

vim.keymap.set("n", "<leader>n", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, {
  desc = "Toggle relative line numbers",
})


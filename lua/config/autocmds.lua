-- =====================================
-- config/autocmds.lua
-- auto command manager 
-- =====================================

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      require("neo-tree.command").execute({ toggle = false })
    end
  end,
})


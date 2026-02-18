local builtin = require("telescope.builtin") vim.keymap.set("n", "ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "fg", builtin.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "fb", builtin.buffers,    { desc = "Buffers" })
vim.keymap.set("n", "fh", builtin.help_tags,  { desc = "Help tags" })

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")



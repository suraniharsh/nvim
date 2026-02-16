-- =====================================
-- lsp/rust.lua
-- Rust LSP (Neovim 0.11+ compliant)
-- =====================================

-------------------------------------------------
-- Capabilities
-------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()

pcall(function()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end)

-------------------------------------------------
-- on_attach
-------------------------------------------------
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-------------------------------------------------
-- rust-analyzer (VALID schema)
-------------------------------------------------
vim.lsp.config("rust_analyzer", {
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "rust" },

  root_markers = { "Cargo.toml", "rust-project.json" },

  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,

      check = {
        command = "clippy",
      },

      cargo = {
        allFeatures = true,
      },

      procMacro = {
        enable = true,
      },
    },
  },
})

-------------------------------------------------
-- Enable server
-------------------------------------------------
vim.lsp.enable("rust_analyzer")

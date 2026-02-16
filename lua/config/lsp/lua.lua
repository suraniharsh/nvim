-- =====================================
-- lsp/lua.lua
-- Lua LSP (Neovim 0.11+ compliant)
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
-- lua_ls configuration
-------------------------------------------------
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-------------------------------------------------
-- Enable server
-------------------------------------------------
vim.lsp.enable("lua_ls")

return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "astro",
        "bashls",
        "clangd",
        "gopls",
        "lua_ls",
        "ocamllsp",
        "prismals",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "ts_ls",
      },
      automatic_enable = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clang-format",
        "prettier",
        "eslint_d",
        "stylua",
      },
      automatic_installation = true,
    })
  end,
}

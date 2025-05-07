return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup()

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "astro",
        "bashls",
        "clangd",
        "gopls",
        "lua_ls",
        "mdx_analyzer",
        "nil_ls",
        "ocamllsp",
        "prismals",
        "pyright",
        "rust_analyzer",
        "solc",
        "solidity",
        "tailwindcss",
        "tinymist",
        "ts_ls",
        "volar",
        "zls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clang-format",
        "nixpkgs-fmt",
        "prettier",
        "prettierd",
        "eslint_d",
        "stylua",
      },
      automatic_installation = true,
    })
  end,
}

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
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    ---@diagnostic disable-next-line: missing-fields
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "bashls",
        "html",
        "lua_ls",
        "ltex",
        "marksman", -- markdown jumper
        "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "beautysh",
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "markdownlint-cli2", -- markdown linter
        "markdown-toc", -- markdown toc
        "cspell", -- markdown jumper
        "pylint",
      },
    })
  end,
}

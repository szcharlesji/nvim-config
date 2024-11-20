return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                move = { "move_analyzer" },
                lua = { "stylua" },
                python = { "black" },
            },

            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },

            -- Configure formatters
            formatters = {
                prettier = {
                    prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
                },
                ["clang-format"] = {
                    prepend_args = {
                        "--style",
                        "{IndentCaseLabels: true, IndentWidth: 4, AllowShortFunctionsOnASingleLine: None}",
                    },
                },
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
                black = {
                    prepend_args = { "--line-length", "88", "--skip-string-normalization" },
                },
            },
        })
    end,
}

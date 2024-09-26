return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- local sui_move_analyzer = {
        --     command = "/Users/chengji/.cargo/bin/sui-move-analyzer",
        --     args = { "format", "--stdin" },
        --     stdin = true,
        -- }

        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                move = { "move_analyzer" },
                graphql = { "prettier" },
                liquid = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },

            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },

            -- Configure formatters
            formatters = {
                -- sui_move_analyzer = sui_move_analyzer,
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
                isort = {
                    prepend_args = { "--profile", "black" },
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}

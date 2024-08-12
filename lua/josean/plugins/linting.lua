return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "pylint" },
        }
        local root_dir = vim.fn.getcwd()
        local eslint_config_path = root_dir .. "/eslint.config.js"

        lint.linters.eslint_d.args = {
            "--no-warn-ignored",
            "--config",
            eslint_config_path,
            "--format",
            "json",
            "--stdin",
            "--stdin-filename",
            function()
                return vim.api.nvim_buf_get_name(0)
            end,
        }

        lint.linters.eslint_d.cwd = root_dir
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local filepath = vim.api.nvim_buf_get_name(bufnr)
                -- print("Linting file: " .. filepath)
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            local bufnr = vim.api.nvim_get_current_buf()
            local filepath = vim.api.nvim_buf_get_name(bufnr)
            print("Manually linting file: " .. filepath)
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}

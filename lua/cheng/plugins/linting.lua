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
            python = { "pylint" },
        }

        local function get_eslint_config_path()
            local root_dir = vim.fn.getcwd()
            local eslint_config_js = root_dir .. "/eslint.config.js"
            local eslintrc_json = root_dir .. "/.eslintrc.json"

            if vim.fn.filereadable(eslint_config_js) == 1 then
                return eslint_config_js
            elseif vim.fn.filereadable(eslintrc_json) == 1 then
                return eslintrc_json
            else
                return nil
            end
        end

        local eslint_config_path = get_eslint_config_path()

        if eslint_config_path then
            lint.linters.eslint_d.args = {
                "--format",
                "json",
                "--stdin",
                "--stdin-filename",
                function()
                    return vim.api.nvim_buf_get_name(0)
                end,
            }
        else
            print("No ESLint config file found. Using default configuration.")
        end

        lint.linters.eslint_d.cwd = vim.fn.getcwd()
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
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

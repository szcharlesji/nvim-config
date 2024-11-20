return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Function to check if eslint config exists in project
        local function has_eslint_config()
            local eslint_files = {
                ".eslintrc.js",
                ".eslintrc.json",
                ".eslintrc",
                "eslint.config.js",
            }

            local current_dir = vim.fn.getcwd()
            for _, file in ipairs(eslint_files) do
                if vim.fn.filereadable(current_dir .. "/" .. file) == 1 then
                    return true
                end
            end
            return false
        end

        -- Only setup eslint if config exists in project
        if has_eslint_config() then
            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
            }

            -- Basic eslint_d configuration
            lint.linters.eslint_d.args = {
                "--format",
                "json",
                "--stdin",
                "--stdin-filename",
                function()
                    return vim.api.nvim_buf_get_name(0)
                end,
            }

            -- Auto-lint on changes
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end
    end,
}

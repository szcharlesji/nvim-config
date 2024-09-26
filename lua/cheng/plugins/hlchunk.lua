return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true,
                use_treesitter = true,
                notify = true,
                chars = {
                    left_arrow = "━",
                    horizontal_line = "━",
                    vertical_line = "┃",
                    -- vertical_line = "│",
                    left_top = "┏",
                    left_bottom = "┗",
                    right_arrow = "━",
                },
                style = {
                    -- { fg = cb },
                    { fg = "#ffc777" },
                    { fg = "#f35336" },
                },
                textobject = "ic",
                duration = 100,
                delay = 50,
            },

            indent = {
                enable = true,
                -- use_treesitter = false,
                notify = true,
                chars = {
                    -- " ",
                    "│",
                    -- "¦",
                    -- "┆",
                    -- "┊",
                },
                delay = 80,
                -- filter_list = {
                --     function(v)
                --         return v.level ~= 1
                --     end,
                -- },
            },

            line_num = {
                enable = false,
            },

            blank = {
                enable = false,
                chars = {
                    " ",
                    "․",
                    -- "⁚",
                    -- "⁖",
                    -- "⁘",
                    -- "⁙",
                },
                -- style = {
                --     -- "#806d9c",
                --
                --     { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
                --     { bg = "", fg = "" },
                -- },
                style = {
                    { bg = "#434437" },
                    { bg = "#2f4440" },
                    { bg = "#433054" },
                    { bg = "#284251" },
                },
            },
        })
    end,
}

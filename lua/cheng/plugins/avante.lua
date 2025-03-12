return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        provider = "copilot",
        -- auto_suggestions_provider = "copilot",
        copilot = {
            endpoint = "https://api.githubcopilot.com",
            -- model = "claude-3.5-sonnet",
        },
        vendors = {
            -- Available
            copilot_claude = {
                __inherited_from = "copilot",
                model = "claude-3.7-sonnet",
            },
            -- Unavailable
            copilot_claude_thinking = {
                __inherited_from = "copilot",
                model = "claude-3.7-sonnet-thought",
            },
            -- Available
            copilot_o1 = {
                __inherited_from = "copilot",
                model = "o1",
            },
            -- Available
            copilot_o3_mini = {
                __inherited_from = "copilot",
                model = "o3-mini",
            },
            -- Unavailable
            copilot_gemini = {
                __inherited_from = "copilot",
                model = "gemini-2.0-flash-100",
            },
        },
        behaviour = {
            auto_suggestions = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
            minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        },
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}

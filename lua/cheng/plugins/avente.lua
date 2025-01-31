return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        provider = "copilot",
        -- auto_suggestions_provider = "copilot",
        copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "claude-3.5-sonnet",
            proxy = nil, -- [protocol://]host[:port] Use this proxy
            allow_insecure = false, -- Allow insecure server connections
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8192,
        },
        behaviour = {
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
            minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        },
    },
    build = "make",
    dependencies = {
        {
            "MunifTanjim/nui.nvim",
            lazy = true,
        },
        --- The below dependencies are optional,
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                },
            },
        },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}

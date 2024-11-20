return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        provider = "copilot",
        auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20240620",
            temperature = 0,
            max_tokens = 4096,
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
                    -- required for Windows users
                    use_absolute_path = true,
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

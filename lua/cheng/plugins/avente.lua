return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        provider = "copilot",
        auto_suggestions_provider = "copilot",
        copilot = {
            endpoint = "https://api.githubcopilot.com/",
            -- model = "o1",
            model = "claude-3.5-sonnet",
            proxy = nil, -- [protocol://]host[:port] Use this proxy
            allow_insecure = false, -- Allow insecure server connections
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8192,
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

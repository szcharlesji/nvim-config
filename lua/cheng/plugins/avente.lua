return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        provider = "copilot",
        auto_suggestions_provider = "copilot",
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

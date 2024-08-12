return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    branch = "main",
    version = "*",
    opts = {
        options = {
            mode = "tabs",
            numbers = "ordinal",
            separator_style = "thin",
            hover = {
                enabled = true,
                delay = 200,
                reveal = { "close" },
            },
            indicator = {
                icon = "▎", -- this should be omitted if indicator style is not 'icon'
                style = "icon",
            },
        },
    },
}

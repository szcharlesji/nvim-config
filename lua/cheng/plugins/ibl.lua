return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = {
            char = "▏", -- thinner character
            highlight = {
                "IblIndent",
            },
        },
        scope = {
            char = "▏",
            highlight = {
                "IblScope",
            },
        },
    },
}

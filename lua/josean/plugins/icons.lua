return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup({
            default = true,
            override_by_extension = {
                ["toml"] = {
                    icon = "",
                    name = "Log",
                },
                ["move"] = {
                    icon = "󰸊",
                    name = "Move",
                },
            },
        })
    end,
}

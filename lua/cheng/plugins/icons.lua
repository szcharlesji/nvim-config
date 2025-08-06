return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  event = "VeryLazy",
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
      override_by_filename = {
        [".env.example"] = {
          icon = "",
          color = "#FBF700",
          name = "EnvFile",
        },
        [".env.local"] = {
          icon = "",
          color = "#FBF700",
          name = "EnvFile",
        },
        [".env.production"] = {
          icon = "",
          color = "#FBF700",
          name = "EnvFile",
        },
      },
    })
  end,
}

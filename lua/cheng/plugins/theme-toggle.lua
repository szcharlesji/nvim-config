return {
  "SyedFasiuddin/theme-toggle-nvim",
  config = function()
    require("theme-toggle-nvim").setup({
      colorscheme = {
        light = "github_light_default",
        dark = "github_dark_default",
      },
    })
  end,
}

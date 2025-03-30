return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = true

    local border = "#E9AD5B"

    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.border = border
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}

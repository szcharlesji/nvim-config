return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
      ordered_icons = {},
      left_pad = 0,
      right_pad = 2,
      highlight = "RenderMarkdownBullet",
    },
  },
}

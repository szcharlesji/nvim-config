return {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
        -- add options here
        -- or leave it empty to use the default settings
        -- Use relative path to save images
        relative_to_current_file = true,
        dir_path = "assets",
        use_absolute_path = false,
        file_name = "%Y%m%d-%H%M%S",
    },
    keys = {
        -- suggested keymap
        { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
}

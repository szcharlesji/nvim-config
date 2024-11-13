return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        local keymap = vim.keymap

        -- REQUIRED
        harpoon:setup()
        -- OPTIONAL: Configure keymaps
        keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Append to the list of files" }) -- Append to the list of files
        keymap.set("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open the list of files" }) -- Open the list of files

        keymap.set("n", "<leader>h1", function()
            harpoon:list():select(1)
        end, { desc = "Go to the first file in the list" }) -- Go to the first file in the list
        keymap.set("n", "<leader>h2", function()
            harpoon:list():select(2)
        end, { desc = "Go to the second file in the list" }) -- Go to the second file in the list
        keymap.set("n", "<leader>h3", function()
            harpoon:list():select(3)
        end, { desc = "Go to the third file in the list" }) -- Go to the third file in the list
        keymap.set("n", "<leader>h4", function()
            harpoon:list():select(4)
        end, { desc = "Go to the fourth file in the list" }) -- Go to the fourth file in the list

        -- Toggle previous & next buffers stored within Harpoon list
        keymap.set("n", "<leader>hp", function()
            harpoon:list():prev()
        end, { desc = "Go to the previous file in the list" }) -- Go to the previous file in the list
        keymap.set("n", "<leader>hn", function()
            harpoon:list():next()
        end, { desc = "Go to the next file in the list" }) -- Go to the next file in the list

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        vim.keymap.set("n", "<leader>ht", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open harpoon window" })
    end,
}

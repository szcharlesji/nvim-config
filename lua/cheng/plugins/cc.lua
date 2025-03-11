return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },
        },
        build = "make tiktoken",
        init = function()
            -- Copilot autosuggestions
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_hide_during_completion = false
            vim.g.copilot_proxy_strict_ssl = false
            vim.g.copilot_integration_id = "vscode-chat"
            vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
            vim.keymap.set("i", "<M-l>", 'copilot#Accept("\\<M-l>")', { expr = true, replace_keycodes = false })
        end,
        opts = function()
            local select = require("CopilotChat.select")

            return {
                -- model = "claude-3.7-sonnet",
                references_display = "write",
                selection = select.visual,
                context = "buffers",
                mappings = {
                    reset = {
                        normal = "",
                        insert = "",
                    },
                    show_diff = {
                        full_diff = true,
                    },
                },
                prompts = {
                    Explain = {
                        mapping = "<leader>ae",
                        description = "AI Explain",
                    },
                    Review = {
                        mapping = "<leader>ar",
                        description = "AI Review",
                    },
                    Tests = {
                        mapping = "<leader>at",
                        description = "AI Tests",
                    },
                    Fix = {
                        mapping = "<leader>af",
                        description = "AI Fix",
                    },
                    Optimize = {
                        mapping = "<leader>ao",
                        description = "AI Optimize",
                    },
                    Docs = {
                        mapping = "<leader>ad",
                        description = "AI Documentation",
                    },
                    Commit = {
                        mapping = "<leader>ac",
                        description = "AI Generate Commit",
                        selection = select.buffer,
                    },
                },
            }
        end,
        config = function(_, opts)
            local chat = require("CopilotChat")

            chat.setup(opts)

            vim.keymap.set({ "n" }, "<leader>aa", chat.toggle, { desc = "AI Toggle" })
            vim.keymap.set({ "v" }, "<leader>aa", chat.open, { desc = "AI Open" })
            vim.keymap.set({ "n" }, "<leader>ax", chat.reset, { desc = "AI Reset" })
            vim.keymap.set({ "n" }, "<leader>as", chat.stop, { desc = "AI Stop" })
            vim.keymap.set({ "n" }, "<leader>am", chat.select_model, { desc = "AI Models" })
            vim.keymap.set({ "n" }, "<leader>ag", chat.select_agent, { desc = "AI Agents" })
            vim.keymap.set({ "n", "v" }, "<leader>ap", chat.select_prompt, { desc = "AI Prompts" })
            vim.keymap.set({ "n", "v" }, "<leader>aq", function()
                vim.ui.input({
                    prompt = "AI Question> ",
                }, function(input)
                    if input ~= "" and input then
                        chat.ask(input)
                    end
                end)
            end, { desc = "AI Question" })
        end,
    },
}

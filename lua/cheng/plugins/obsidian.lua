return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.env.OBSIDIAN_DIR,
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- Frontmatter settings
    disable_frontmatter = false,

    -- Image
    ---@param img string
    follow_img_func = function(img)
      vim.fn.jobstart({ "qlmanage", "-p", img }) -- Mac OS quick look preview
    end,

    -- URL
    ---@param url string
    follow_url_func = function(url)
      vim.ui.open(url) -- need Neovim 0.10.0+
    end,

    -- Optional, customize how note IDs are generated given an optional title.
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      if title then
        return title
      else
        -- If no title is provided, generate a random string
        local suffix = ""
        for _ = 1, 8 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        return "Untitled_" .. suffix
      end
    end,

    -- Specify how to handle attachments.
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "assets", -- This is the default

      -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
      ---@return string
      img_name_func = function()
        -- Prefix image names with timestamp.
        return string.format("%s-", os.time())
      end,

      -- A function that determines the text to insert in the note when pasting an image.
      -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
      -- This is the default implementation.
      ---@param client obsidian.Client
      ---@param path obsidian.Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
}

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Add filetype detection for .env.* files
vim.filetype.add({
    extension = {
        env = "sh",
    },
    filename = {
        [".env"] = "sh",
    },
    pattern = {
        ["%.env%.[%w_.-]+"] = "sh",
    },
})

opt.relativenumber = true
opt.number = true
opt.conceallevel = 1

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.showtabline = 2 -- always show tabs
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

-- scroll offset
opt.scrolloff = 12

-- show matching brackets
opt.showmatch = true

vim.lsp.set_log_level("error")

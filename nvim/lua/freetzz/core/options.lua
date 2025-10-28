vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:tmux_navigator_disable_netrw_workaround = 1")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

opt.iskeyword:append("-")

-- new files
opt.fileencoding = "utf-8"
opt.endofline = true
opt.fixendofline = true

-- spell check
opt.spell = true
opt.spelllang = { "en", "pl" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown,tex,txt", -- List of file types
  command = "setlocal spell", -- Enable spell checking locally for each file type
})

vim.opt.spellfile:append("/home/freetzz/.dotfiles/txt/whitelists/global.add")

-- Set suggestions behavior
opt.spellsuggest = "best,9"

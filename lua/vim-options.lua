--[[

	Base Settings

]]

-- Add line numbers
vim.opt.number = true

-- Highlight the current line the cursor is on
vim.opt.cursorline = true

-- Dont' let the cursor scroll below or above the N lines
vim.opt.scrolloff = 10

-- Don't let the cursor scoll too far left or right of N column position
vim.opt.sidescrolloff = 20

-- Don't line wrap
vim.opt.wrap = false

-- Draw a line at column position N to show an ideal column max
vim.opt.colorcolumn = "160"

--[[

	Useful things to remember as vim settings

]]
--vim.cmd("set cursorcolumn")

-- Highlight matching characters while searching
vim.opt.incsearch = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Override above to allow to search specifically for capitialized characters
vim.opt.smartcase = true

--[[

	Tab/Space Settings

]]
-- Use spaces instead of tabs by default
--vim.cmd("set expandtab")

-- Set the width of tabs
vim.opt.tabstop = 4

-- How many chars are created/removed when hitting tab/backspace
vim.opt.softtabstop = 4

-- Number of spaces used for each step
vim.opt.shiftwidth = 4

-- Automatically indent correctly
vim.opt.autoindent = true

-- Allows custom characters given certain scenarios
-- Needed to do the vim.opt method due to odd behavior to get my tab right
vim.opt.list = true
vim.opt.listchars = {
	tab = "▸ ",
	trail = "·",
	nbsp = "␣",
	multispace = "·",
}

--[[

	Base Settings

]]

-- Vim's leader character declaration
vim.g.mapleader = " "

-- Add line numbers
vim.cmd("set number")

-- Highlight the current line the cursor is on
vim.cmd("set cursorline")

-- Dont' let the cursor scroll below or above the N lines
vim.cmd("set scrolloff=10")

-- Don't let the cursor scoll too far left or right of N column position
vim.cmd("set sidescrolloff=40")

-- Don't line wrap
vim.cmd("set nowrap")

-- Draw a line at column position N to show an ideal column max
vim.cmd("set colorcolumn=160")

--[[

	Useful things to remember as vim settings

]]
--vim.cmd("set cursorcolumn")

-- Highlight matching characters while searching
vim.cmd("set incsearch")

-- Ignore case when searching
vim.cmd("set ignorecase")

-- Override above to allow to search specifically for capitialized characters
vim.cmd("set smartcase")

--[[

	Tab/Space Settings

]]
-- Use spaces instead of tabs by default
--vim.cmd("set expandtab")

-- Set the width of tabs
vim.cmd("set tabstop=4")

-- How many chars are created/removed when hitting tab/backspace
vim.cmd("set softtabstop=4")

-- Number of spaces used for each step
vim.cmd("set shiftwidth=4")

-- Automatically indent correctly
vim.cmd("set autoindent")

-- Allows custom characters given certain scenarios
-- Needed to do the vim.opt method due to odd behavior to get my tab right
vim.opt.list = true
vim.opt.listchars:append({
	tab = "▸ ",
	trail = "·",
	nbsp = "␣",
	multispace = "·",
})

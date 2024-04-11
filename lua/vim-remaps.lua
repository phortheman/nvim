--[[

	Core Remaps for basic functionality

]]

-- Remap for copying to the system clipboard
-- Only applicable for visual mode
vim.keymap.set(
	{ "v", "x" },
	"<leader>y",
	'"+y',
	{ noremap = true, silent = true, desc = "Copy content into the system clipboard" }
)

-- Remap for pasting from clipboard
vim.keymap.set(
	{ "n", "v", "x" },
	"<leader>p",
	'"+p',
	{ noremap = true, silent = true, desc = "Paste content from the system clipboard" }
)

-- Clear highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Better window moving
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--[[

	Core Remaps for basic functionality

]]

-- Remap for copying to the system clipboard
-- Only applicable for visual mode
vim.keymap.set({ "v", "x" }, "<C-c>", '"+y', { noremap = true, silent = true })

-- Remap for pasting from clipboard
vim.keymap.set({ "n", "i", "v", "x" }, "<C-v>", '"+p', { noremap = true, silent = true })

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

-- Plain text related remaps
vim.keymap.set("n", "<leader>ww", "<CMD>setlocal wrap!<CR>", { desc = "Toggle [w]ord [w]rap on current buffer" })
vim.keymap.set("n", "<leader>sc", "<CMD>setlocal spell spelllang=en_us<CR>",
	{ desc = "Turn on [s]pell [c]heck on the current buffer. [/]s to goto next and z= to see suggestion" })

-- Clear highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Better window moving
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Quicker access to small macros
vim.keymap.set("n", "Q", "@q", { desc = "Run the macros stored in the 'q' registry" })

-- I want these. Need to figure out a keymap
-- vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv", { desc = "Move highlighted up" })
-- vim.keymap.set("v", "J", ":m '>-2<CR>gv=gv", { desc = "Move highlighted down" })

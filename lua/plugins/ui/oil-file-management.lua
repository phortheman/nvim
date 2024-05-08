return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"size",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 10,
				max_width = 60,
				max_height = 80,
			}
		})
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { silent = true, desc = "Open parent directory" })
	end,
}

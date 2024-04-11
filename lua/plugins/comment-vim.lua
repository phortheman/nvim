return {
	{
		-- "tpope/vim-commentary", cool but uses vimscript and unsure how to customize the mappings
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<leader>cl",
					block = "<leader>cb",
				},
				opleader = {
					line = "<leader>cl",
					block = "<leader>cb",
				},
				extra = {
					above = "<leader>cO",
					below = "<leader>co",
					eol = "<leader>cA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}

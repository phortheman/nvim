return {
	-- "tpope/vim-commentary", cool but uses vimscript and unsure how to customize the mappings
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<leader>gcc",
				block = "<leader>gbc",
			},
			opleader = {
				line = "<leader>gcc",
				block = "<leader>gbc",
			},
			extra = {
				above = "<leader>gcO",
				below = "<leader>gco",
				eol = "<leader>gcA",
			},
			mappings = {
				basic = false,
				extra = false,
			},
		})
	end,
}

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.goimports,
			},
		})

		-- Shortcut to format the current buffer
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- Auto format on buffer write
		vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
	end,
}

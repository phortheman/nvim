return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Map of filetype to formatters
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
			-- Conform will notify you when a formatter errors
			notify_on_error = true,
			-- Custom formatters and changes to built-in formatters
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format the file or range in visual mode" })
	end,
}

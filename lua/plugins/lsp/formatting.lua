return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					lsp_fallback = true,
					timeout_ms = 1000,
					async = true,
				})
			end,
			mode = "",
			desc = "[F]ormat the file or range in visual mode",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			xml = { "xmlformatter" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		-- Conform will notify you when a formatter errors
		notify_on_error = true,
		-- Custom formatters and changes to built-in formatters
	},
}

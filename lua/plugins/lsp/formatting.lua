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
		-- Conform will notify you when a formatter errors
		notify_on_error = true,
		-- Custom formatters and changes to built-in formatters
	},
	config = function()
		local conform = require("conform")

		-- List of file types to exclude from auto formatting
		local excludedFiles = {
			"xml",
		}

		-- The exact same thing as the auto format opt but with my exlcude list
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				for i = 1, #excludedFiles do
					if vim.bo.filetype == excludedFiles[i] then
						return
					end
				end
				conform.format({
					bufnr = args.buf,
					timeout_ms = 500,
					lsp_fallback = true,
				})
			end,
		})
	end,
}

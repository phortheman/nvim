return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Automatically setup servers using the default capabilities
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- Add custom settings required below
		})

		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Show declaration" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
		vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
	end,
}

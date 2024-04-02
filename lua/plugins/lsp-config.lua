return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Show declaration" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}

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

		-- LSP functions that can use Telescope UI
		vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions, { desc = "Go to definition" })
		vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, { desc = "Find references" })
		vim.keymap.set(
			"n",
			"<leader>gI",
			require("telescope.builtin").lsp_implementations,
			{ desc = "[G]oto [I]mplementation" }
		)
		vim.keymap.set(
			"n",
			"<leader>D",
			require("telescope.builtin").lsp_type_definitions,
			{ desc = "Type [D]efinition" }
		)
		vim.keymap.set(
			"n",
			"<leader>ds",
			require("telescope.builtin").lsp_document_symbols,
			{ desc = "[D]ocument [S]ymbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>ws",
			require("telescope.builtin").lsp_dynamic_workspace_symbols,
			{ desc = "[W]orkspace [S]ymbols" }
		)

		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Documentation Hover" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame symbol" })
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
		vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
	end,
}

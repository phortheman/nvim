return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			pip = {
				upgrade_pip = true,
			},
		})

		mason_lspconfig.setup({
			lazy = false,
			ensure_installed = {
				"lua_ls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
			},
		})
	end,
}

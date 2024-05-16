return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = (function()
			-- NOTE: You may need to do this manually. Required for VS Code snippets to do subsitutions
			if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local vscode_snippets = require("luasnip.loaders.from_vscode")

		-- Custom logic to load project .code-snippets that are stored in the .vscode dir
		-- Neovim must be launch in the projects root dir to work
		local cwd = vim.fn.getcwd()
		local vscode_path = vim.fn.fnamemodify(cwd, ":p") .. ".vscode/"
		local glob_pattern = vscode_path .. "*.code-snippets"
		local snippet_files = vim.fn.glob(glob_pattern, false, true)

		vscode_snippets.lazy_load()

		for _, snippet_file in ipairs(snippet_files) do
			vscode_snippets.load_standalone({
				path = snippet_file
			})
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-P>"] = cmp.mapping.scroll_docs(-4),
				["<C-N>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
				{ name = "buffer" },
			}),
		})

	end,
}

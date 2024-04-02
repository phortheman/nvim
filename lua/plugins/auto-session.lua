return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_session_sepress_dirs = { "~/" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
			vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
				noremap = true,
				desc = "List current auto sessions",
			}),
		})
	end,
}

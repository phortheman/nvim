return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependency = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
			{ desc = "Add current buffer to harpoon list" })
		vim.keymap.set("n", "<C-q>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = "Toggle harpoon quick menu" })

		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Goto 1st harpoon buffer" })
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Goto 2nd harpoon buffer" })
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Goto 3rd harpoon buffer" })
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Goto 4th harpoon buffer" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>h]", function() harpoon:list():prev() end, { desc = "Prev harpoon buffer" })
		vim.keymap.set("n", "<leader>h[", function() harpoon:list():next() end, { desc = "Next harpoon buffer" })


		vim.keymap.set("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end,
			{ desc = "[S]earch [h]arpoon" })
	end
}

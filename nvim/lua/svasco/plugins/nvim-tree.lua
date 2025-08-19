return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- Setting recommended settings from the nvim-tree docs
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrPlugin = 1

		nvimtree.setup({
			view = {
				relativenumber = true,
			},
			-- Changing the icons for the folders
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			-- Disabling window_pickers when window splitting to prevent bugs
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			-- Show files ignored by git
			git = {
				ignore = false,
			},
		})

		-- Setting custom keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", { desc = "Toggles the file explorer." })
		keymap.set("n", "<leader>fc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapses the file explorer." })
		keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refreshes the file explorer." })
	end,
}

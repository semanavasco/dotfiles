return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- treesitter's configuration
		treesitter.setup({
			sync_install = false,
			ignore_install = {},
			auto_install = true,
			highlight = { enable = true, disable = { "latex" } },
			indent = { enable = true },

			-- ensure these language servers are installed
			ensure_installed = {
				"bash",
				"lua",
				"gitignore",
				"c",
				"cpp",
				"python",
				"json",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			modules = {},
		})
	end,
}

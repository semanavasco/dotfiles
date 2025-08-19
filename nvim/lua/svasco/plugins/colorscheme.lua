return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000, -- loads before everything else
	config = function()
		vim.cmd("colorscheme catppuccin-macchiato")
	end,
}

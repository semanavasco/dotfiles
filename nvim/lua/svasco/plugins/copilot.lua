return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_filetypes = {
			["*"] = false,
			-- python = true,
			javascript = true,
			typescript = true,
			json = true,
			lua = true,
			html = true,
			css = true,
			rust = false,
			cpp = true,
			c = true,
			typst = true,
		}
	end,
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig") -- You still need to require it
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- setting keymaps
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				-- buffer local mappings
				local opts = { buffer = event.buf, silent = true }

				-- setting keybinds (your existing keymaps remain here)
				opts.desc = "Shows LSP references."
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Goes to declaration."
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Shows LSP definitions."
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Shows LSP implementations."
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Shows LSP type definitions."
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions."
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename."
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Shows buffer diagnostics."
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Shows line diagnostics."
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Goes to the previous diagnostic."
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Goes to the next diagnostic."
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Shows documentation for what is under the cursor."
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restarts the LSP."
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup({
			handlers = {
				-- Default handler for all servers not explicitly listed below
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Custom configuration for lua_ls
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						-- If you have a global on_attach, you might want to call it here too
						-- on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
								workspace = {
									checkThirdParty = false, -- Recommended for performance
									library = {
										vim.env.VIMRUNTIME,
									},
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
				["ts_ls"] = function()
					lspconfig["ts_ls"].setup({
						capabilities = capabilities,
					})
				end,
				["eslint_lsp"] = function()
					lspconfig["eslint_lsp"].setup({
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}

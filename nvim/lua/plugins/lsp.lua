return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- experimental
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local default_setup = function(server)
			require("lspconfig")[server].setup({
				capabilities = capabilities,
			})
		end

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				default_setup,
				lua_ls = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
				-- end lua_ls
				emmet_ls = function()
					lspconfig.emmet_ls.setup({
						capabilities = vim.lsp.protocol.make_client_capabilities(),
						filetypes = {
							"blade",
							"css",
							"html",
							"javascript",
							"javascriptreact",
							"less",
							"sass",
							"scss",
							"svelte",
							"typescript",
							"vue",
						},
						init_options = {
							html = {
								["bem.enabled"] = true,
							},
						},
						on_attach = function(client, bufnr)
							print("emmet_ls attached")
						end,
					})
				end,
				-- end emmet_language_server
			},
		})
	end,
}

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				--php = { "php" },
				php = { "phpcbf" },
				blade = { "blade-formatter" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout = 500,
			},

			formatters = {
				php = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"$FILENAME",
						"--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
					},
					stdin = false,
				},
				blade = {
					command = "blade-formatter",
					args = {
						"$FILENAME",
					},
					stdin = false,
				},
			},
			vim.keymap.set("n", "<leader>f", function()
				conform.format({
					lsp_fallback = true,
					async = true,
				})
			end, {
				desc = "Format code (conform with LSP fallback)",
			}),
		})
	end,
}

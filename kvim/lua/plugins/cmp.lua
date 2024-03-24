return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		require("luasnip.loaders.from_vscode")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/kvim/snippets" } })

		local lspkind = require("lspkind")
		local cmp = require("cmp")

		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			luasnip.jump(1)
		end, { silent = true, desc = "Jump to next arg" })
		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			luasnip.jump(-1)
		end, { silent = true, desc = "Jump to prev arg" })

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {},
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				--["<C-Space>"] = cmp.mapping.complete(),
				--["<C-f>"] = cmp_action.luasnip_jump_forward(),
				--["<C-b>"] = cmp_action.luasnip_jump_backward(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})
	end,
}

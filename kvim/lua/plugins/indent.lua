return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local highlight = {
			"whitespace",
		}
		vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
		vim.g.indent_blankline_filetype_exclude = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		}
		vim.g.indentLine_enabled = 1
		--vim.g.indent_blankline_char = "│"
		vim.g.indent_blankline_char = "▏"
		-- vim.g.indent_blankline_char = "▎"
		vim.wo.colorcolumn = "9999"

		require("ibl").setup({
			indent = { highlight = highlight, char = "▏" },
			scope = { enabled = true },
		})
	end,
}

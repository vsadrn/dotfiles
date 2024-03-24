return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	cmd = "WhichKey",
	config = function()
		vim.o.timeout = 300
		vim.o.timeoutlen = 150

		local wk = require("which-key")
		local mappings = {}
		local opts = {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true,
		}

		wk.register(mappings, opts)
	end,
}

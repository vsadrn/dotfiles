return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		--	"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},

	command = { ":Neotree position=current" },
	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			close_if_last_window = true,
			bind_to_cwd = true,
			name = {
				trailing_slash = true,
				use_git_status_colors = true,
				highlight = "NeoTreFileName",
			},
			window = {
				position = "current",
				width = 50,
			},
		})
		vim.keymap.set("n", "<C-f>", ":Neotree reveal reveal_force_cwd<cr>", { desc = "NeoTree" })
	end,
}

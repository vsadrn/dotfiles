return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 13,
			open_mapping = [[<c-\>]],
			start_in_insert = true,
			direction = "float",
		})
	end,
}

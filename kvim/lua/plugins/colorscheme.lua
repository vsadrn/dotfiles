return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
			palettes = {
				carbonfox = {
					red = "#c94f6d",
				},
			},
		})
		vim.cmd.colorscheme("nightfox")
	end,
}

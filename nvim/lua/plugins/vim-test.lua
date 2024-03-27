return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		local vim = vim
		vim.cmd("let test#strategy = 'vimux'")
		vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Test nearest" })
		vim.keymap.set("n", "<leader>tT", ":TestFile<CR>", { desc = "Test file" })
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test all" })
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last" })
		vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Visit last test file" })
	end,
}

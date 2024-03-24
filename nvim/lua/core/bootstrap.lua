local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(path)
if not vim.loop.fs_stat(path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		path,
	})
end
vim.opt.rtp:prepend(path)
require("lazy").setup({
	{ import = "plugins" },
	--{ import = "config.plugins.lsp"}
})

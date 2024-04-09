local vim = vim
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }
		local keymap = vim.keymap
		opts.desc = "Show code actions"
		keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)

		opts.desc = "LSP: Go to definition"
		keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)

		opts.desc = "LSP Show immpementation"
		keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)

		opts.desc = "LSP: Rename"
		keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)

		opts.desc = "LSP: Show diagnostics (Telescope)"
		keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)

		opts.desc = "Show documentation"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "php",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank({ timeout = 200 })
	end,
})

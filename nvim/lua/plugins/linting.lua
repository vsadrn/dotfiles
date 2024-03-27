return {
	"https://github.com/mfussenegger/nvim-lint.git",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			php = { "phpcs" },
			javascript = { "eslint_d" },
			svelte = { "eslint_d" },
			blade = { "phpcs" },
			lua = { "selene" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ln", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current buffer" })
	end,
}

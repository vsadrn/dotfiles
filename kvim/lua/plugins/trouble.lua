return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local remap = vim.keymap.set

		remap("n", "<leader>xq", function()
			require("trouble").toggle("quickfix")
		end, { desc = "Trouble: toggle quickfix" })
		remap("n", "<leader>xd", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "Trouble: toggle document diagnostics" })
		remap("n", "<leader>xw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Trouble: toggle workspace diagnostics" })
		remap("n", "<leader>xl", function()
			require("trouble").toggle("workspace_loclist")
		end, { desc = "Trouble: toggle loclist" })
		remap("n", "<leader>xx", function()
			require("trouble").toggle("lsp_references")
		end, { desc = "Trouble: toggle LSP refferences" })
	end,
}

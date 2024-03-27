return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	lazy = true,
	priority = 9999,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			file_ignore_patterns = { "node%_modules/.*", "storage/.*", "storage" },
			path_display = { "truncate" },
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorted = true,
					case_mode = "smart_case",
				},
			},
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-h>"] = "which_key",
					},
				},
			},
		})
		telescope.load_extension("fzf")
		local builtin = require("telescope.builtin")

		local vim = vim

		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope: find available in git" })
		vim.keymap.set("n", "<C-S-p>", builtin.find_files, { desc = "Telescope: find files" })
		vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "Telescope: old files" })
		vim.keymap.set("n", "<leader>gr", builtin.live_grep, { desc = "Telescope: live grep" })

		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope: Lists git commits" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope: Lists git branches" })
		vim.keymap.set("n", "<leader>gs", builtin.git_stash, { desc = "Telescope: Lists git stash" })
		--vim.keymap.set("n", "<leader>fj", builtin.help_tags, { desc = "Telescope: help tags" })
	end,
}

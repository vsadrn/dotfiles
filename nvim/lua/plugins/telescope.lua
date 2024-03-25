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
					},
				},
			},
		})
		telescope.load_extension("fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope: find files" })
		vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "Telescope: old files" })
		vim.keymap.set("n", "<leader>gr", builtin.live_grep, { desc = "Telescope: live grep" })
		--vim.keymap.set("n", "<leader>fj", builtin.help_tags, { desc = "Telescope: help tags" })
	end,
}

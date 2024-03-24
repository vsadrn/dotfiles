return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "TSInstallInfo", "TSInstall" },
		build = { ":TSUpdate" },
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}

			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
					filetypes = { "html", "xml" },
				},
			})
		end,
	},
}

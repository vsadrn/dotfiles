local opts = {
	nu = true,
	rnu = true,
	expandtab = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	wrap = false,
	autoindent = true,
	smartindent = true,
	cursorline = true,
	ignorecase = true,
	smartcase = true,
	backup = false,
	undofile = false,
	undodir = os.getenv("HOME") .. "./vim/undodiir",
	hlsearch = true,
	incsearch = true,
	termguicolors = true,
	signcolumn = "yes",
	ttimeoutlen = 300,
	completeopt = "menu,menuone,noinsert,noselect",
	autochdir = false,
	confirm = false,
	splitright = true,
	splitbelow = true,
	scrolloff = 4,
	sidescrolloff = 4,
	updatetime = 200,
	virtualedit = "block",
	clipboard = "unnamedplus",
	swapfile = false,
	foldcolumn = "1",
	foldenable = false,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

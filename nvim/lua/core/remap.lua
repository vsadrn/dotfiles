---leader@dleaderiagnostic disable-next-line: undefined_variable
local vim = vim
vim.g.mapleader = ","
vim.g.localleader = ","

local keymap = vim.keymap

local function desc(text)
	return { desc = text }
end

vim.g.mapleader = ","

keymap.set("n", "n", "nzzzv", desc("Go to next match, center line"))
keymap.set("n", "N", "Nzzzv", desc("Go to prev match, center line"))

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", desc("Move selected lines down"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", desc("Move selected lines up"))

vim.keymap.set("n", "<space>w", ":w<CR>", desc("Save file"))
vim.keymap.set("n", "<space>Q", ":q!<CR>", desc("Quit file without saving"))
vim.keymap.set("n", "<space>q", ":q<CR>", desc("Quit file"))
vim.keymap.set("n", "<space>W", ":wq<CR>", desc("Save and quit file"))
vim.keymap.set("n", "<c-c><c-c>", ":wq!<CR>", desc("Save and quit file without saving"))
vim.keymap.set("n", "Q", "@q")

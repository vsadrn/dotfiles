vim.g.mapleader = ","
vim.g.localleader = ","

local keymap = vim.keymap

local function desc(text)
	return { desc = text }
end

vim.g.mapleader = ","
keymap.set("n", "n", "nzzzv", desc("Go to next match, center line"))
keymap.set("n", "N", "Nzzzv", desc("Go to prev match, center line"))

--keymap.set("n", "<leader>]", "za<cr>", desc("Toggle fold"))

keymap.set("n", "x", '"_x', desc("Delete one character in fron of cursor without copying to clipboard")) -- make x delete a character without copying it to clipboard

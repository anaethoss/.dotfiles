-- mode
--  "n" - normal mode
--  "i" - insert mode
--  "x" - visual mode
--  "v" - visual and select mode

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlights" })

-- better indenting
keymap("n", "<", "<<", { desc = "Left indent" })
keymap("n", ">", ">>", { desc = "Right indent" })
keymap("v", "<", "<gv", { desc = "Left visual indent" })
keymap("v", ">", ">gv", { desc = "Right visual indent" })

-- -- better move
-- keymap("n", "j", "gj", { desc = "Move down" })
-- keymap("n", "k", "gk", { desc = "Move up" })

-- Better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Move down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Move up", expr = true, silent = true })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
keymap({ "n", "x" }, "p", "P", { desc = "Dont copy replaced text" })
keymap("v", "p", '"_dP')
keymap("x", "p", "P")
keymap("n", "dD", '"_dd')

keymap({ "i", "n" }, "<C-s>", "<CMD> w <CR>", { desc = "Save file" })

-- Not yanking with 'c' and 'x'
keymap({ "n", "v" }, "c", '"_c')
keymap("n", "C", '"_C')

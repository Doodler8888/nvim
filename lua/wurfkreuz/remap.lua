vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Keep center view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Void a pasted upon word
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Start replacing the word that you was on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make a file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Buffers
vim.keymap.set("n", "S-n", ":bn<CR>")
vim.keymap.set("n", "S-p", ":bp<CR>")
-- Alternative o
vim.api.nvim_set_keymap("n", "<leader>O", ":execute 'normal! O' | :execute 'normal! j'<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>o", ":execute 'normal! o' | :execute 'normal! k'<CR>", {noremap = true, silent = true})

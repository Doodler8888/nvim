vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.api.nvim_set_keymap('n', '<leader>pp', ':Git push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', ':Git add .<CR>', {noremap = true, silent = true})

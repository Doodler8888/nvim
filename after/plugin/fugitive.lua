vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.api.nvim_set_keymap('n', '<leader>pu', ':Git push<CR>', { noremap = true })

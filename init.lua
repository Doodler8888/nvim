require("wurfkreuz")

vim.o.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>play", "<cmd>CellularAutomaton make_it_rain<CR>")

--  Prevent auto commenting on new lines
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Terraform ls
vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tf setfiletype terraform
]], false)


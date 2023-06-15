require("wurfkreuz")

vim.cmd('colorscheme rose-pine')
vim.o.clipboard = "unnamedplus"

vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tf setfiletype terraform
]], false)

require('leap').add_default_mappings()

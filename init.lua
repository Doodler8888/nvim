require("wurfkreuz")

vim.cmd('colorscheme rose-pine')
vim.o.clipboard = "unnamedplus"

--  Prevent auto commenting on new lines
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tf setfiletype terraform
]], false)

require('leap').add_default_mappings()

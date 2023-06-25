require("wurfkreuz")

vim.cmd('colorscheme rose-pine')
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NonText guibg=NONE ctermbg=NONE')
vim.cmd('highlight LineNr guibg=NONE ctermbg=NONE')
vim.cmd('highlight CursorLineNr guibg=NONE ctermbg=NONE')
vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')

vim.o.clipboard = "unnamedplus"

--  Prevent auto commenting on new lines
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tf setfiletype terraform
]], false)

require('leap').add_default_mappings()

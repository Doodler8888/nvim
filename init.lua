-- Define custom highlight groups
vim.cmd [[
highlight NormalFloat guibg=#282c34
highlight FloatBorder guifg=#282c34 guibg=#61afef
]]

-- Define custom border for hover windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded"
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded"
})

require("wurfkreuz")

vim.o.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>play", "<cmd>CellularAutomaton make_it_rain<CR>")

--  Prevent auto commenting on new lines
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Terraform ls
vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tf setfiletype terraform
]], false)



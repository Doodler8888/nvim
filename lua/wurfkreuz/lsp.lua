local nvim_lsp = require('lspconfig')
local util = nvim_lsp.util
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

nvim_lsp.terraformls.setup{
  on_attach = function(client, bufnr)
  end,
  filetypes = {"tf", "hcl", "terraform"},
}


nvim_lsp.sqlls.setup{
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql" },
  on_attach = function(client, bufnr)
    -- your custom on_attach
  end,
  root_dir = function()
    return vim.loop.cwd()
  end,
}


nvim_lsp.ansiblels.setup{
  on_attach = function(client, bufnr)
  end,
  filetypes = {"yaml"},
}


nvim_lsp.pyright.setup{
  on_attach = function(client, bufnr)
    -- Your on_attach configuration here
  end,
  -- Add settings if needed
}

-- nvim_lsp.pylsp.setup{
--   settings = {
--     pylsp = {
--       configurationSources = {"pylint"},
--       plugins = {
--         pylint = {enabled = true},
--         pyflakes = {enabled = true},
--       },
--     },
--   },
--   on_attach = function(client, bufnr)
--   end,
-- }
--

nvim_lsp.lua_ls.setup({
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = {'vim'},
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

nvim_lsp.gopls.setup {
    cmd = {"gopls", "--verbose", "-rpc.trace", "serve"},
    filetypes = {"go", "gomod"},
    -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
 --    settings = {
 --      gopls = {
	-- analyses = {
	--   unusedparams = true,
	--   fieldalignment = true,
	--   nilness = true,
	--   -- Add more checks as desired.
	-- },
	-- staticcheck = true,
	-- gofumpt = true,  -- To format code according to 'gofumpt' style.
 --      },
 --    },
  }

-- Setup nvim-cmp.
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'codeium' },
    { name = 'luasnip' },
  },
})

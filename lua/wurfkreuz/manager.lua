local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'ThePrimeagen/harpoon',
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{
	  'nvim-treesitter/nvim-treesitter',
	  build = ':TSUpdate'
	},
	{
	  'numToStr/Comment.nvim',
	  config = function()
	    require('Comment').setup()
	  end
	},
	 'mbbill/undotree',
	 'tpope/vim-fugitive',
	 'fatih/vim-go',
	 'neovim/nvim-lspconfig',
	 'hashivim/vim-terraform',
	 'tpope/vim-repeat',
	 'farmergreg/vim-lastplace',
	 'LnL7/vim-nix',
	 'eandrju/cellular-automaton.nvim',
	 'dense-analysis/ale',
	 'mg979/vim-visual-multi',
	 'svermeulen/text-to-colorscheme.nvim',
	 {
	   "folke/trouble.nvim",
	   dependencies = { "nvim-tree/nvim-web-devicons" },
	   opts = {
	     -- your configuration comes here
	     -- or leave it empty to use the default settings
	     -- refer to the configuration section below
	   },
	 },
	 {
	   'Exafunction/codeium.vim',
	   config = function ()
	     vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true })
	   end
	 },
	 'pearofducks/ansible-vim',
	 {
	   "kylechui/nvim-surround",
	   version = "*", -- Use for stability; omit to use `main` branch for the latest features
	   event = "VeryLazy",
	   config = function()
	     require("nvim-surround").setup({
	       -- Configuration here, or leave empty to use defaults
	     })
	   end	 },
	   {
	     "folke/flash.nvim",
	     event = "VeryLazy",
	     ---@type Flash.Config
	     opts = {},
	     keys = {
	       {
		 "s",
		 mode = { "n", "x", "o" },
		 function()
		   -- default options: exact mode, multi window, all directions, with a backdrop
		   require("flash").jump({
		     search = {
		       mode = function(str)
			 return "\\<" .. str
		       end,
		     },
		   })
		 end,
		 desc = "Flash",
	       },
	       {
		 "S",
		 mode = { "n", "o", "x" },
		 function()
		   -- show labeled treesitter nodes around the cursor
		   require("flash").treesitter()
		 end,
		 desc = "Flash Treesitter",
	       },
	       {
		 "r",
		 mode = "o",
		 function()
		   -- jump to a remote location to execute the operator
		   require("flash").remote()
		 end,
		 desc = "Remote Flash",
	       },
	       {
		 "R",
		 mode = { "n", "o", "x" },
		 function()
		   -- show labeled treesitter nodes around the search matches
		   require("flash").treesitter_search()
		 end,
		 desc = "Treesitter Search",
	       }
	     },
	   },

	 -- cmp
	 {
	   "neovim/nvim-lspconfig",
	   opts = {
	     inlay_hints = { enabled = true },
	   },
	 },
	 'hrsh7th/cmp-buffer',
	 'hrsh7th/cmp-path',
	 'hrsh7th/cmp-cmdline',
	 'hrsh7th/nvim-cmp',
	 'L3MON4D3/LuaSnip',
}

require("lazy").setup(plugins, opts)

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use ({
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  })
  use {
	  'numToStr/Comment.nvim',
	  config = function()
		  require('Comment').setup()
	  end
  }
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'fatih/vim-go'
  use 'neovim/nvim-lspconfig'
  use 'hashivim/vim-terraform'
  use 'tpope/vim-repeat'
  use 'ggandor/leap.nvim'
  use 'farmergreg/vim-lastplace'
  use 'LnL7/vim-nix'
  use 'eandrju/cellular-automaton.nvim'
  use 'dense-analysis/ale'
  use 'mg979/vim-visual-multi'
  use {
      "folke/trouble.nvim",
       dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
},
}
  use {
	  'Exafunction/codeium.vim',
	  config = function ()
		  vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true })
	  end
  }
  use 'pearofducks/ansible-vim'
  use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
  

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

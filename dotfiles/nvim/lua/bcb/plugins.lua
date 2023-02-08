local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'neovim/nvim-lspconfig',
        config = [[require('bcb.lsp')]]
    }
    use {
        'hrsh7th/nvim-compe',
        config = [[require('bcb.compe')]]
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        },
        config = [[require('bcb.telescope')]]
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {'lervag/vimtex', ft = {'tex'}}
    use 'SirVer/ultisnips'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    -- use {
    --     'TimUntersberger/neogit',
    --     requires = {
    --         { 'nvim-lua/plenary.nvim' },
    --         { 'sindrets/diffview.nvim' }
    --     }
    -- }
    use {
        'dense-analysis/ale',
        ft = {'sh', 'haskell', 'bash', 'lua', 'python',}
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        -- config = require('nvim-treesitter.configs').setup{highlight = { enable = true }}
    }
    -- use 'dbeniamine/cheat.sh-vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'chrisbra/Colorizer'
    use 'rstacruz/vim-closer'
    -- use 'junegunn/vim-easy-align'

    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        -- run = '{ -> mkdp#util#install() }',
        ft = {'markdown'}
    }

    use {
      "folke/trouble.nvim",
      requires = {
          { "kyazdani42/nvim-web-devicons" },
          { "folke/lsp-colors.nvim" }
      },
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
        }
      end
    }

    use 'romainl/vim-qf'

    use 'rktjmp/lush.nvim'
    use 'morhetz/gruvbox'
    use 'sjl/badwolf'
    use 'hugolgst/vimsence'
    use 'NLKNguyen/papercolor-theme'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = [[require('bcb.lualine')]]
    }

    use 'ThePrimeagen/harpoon'

    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

    if packer_bootstrap then
        require('packer').sync()
    end
end)

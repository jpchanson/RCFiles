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

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'joshdick/onedark.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'ixru/nvim-markdown'
    use 'majutsushi/tagbar'
    use 'ludovicchabant/vim-gutentags'

    -- status lines
    use 'akinsho/bufferline.nvim'
    use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons'}
    }

--     treesitter
    use {
	    'nvim-treesitter/nvim-treesitter',
	    run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	    end
    }

    -- telescope
    use {
	    'nvim-telescope/telescope.nvim', branch = '0.1.x',
	    requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- autocompletion and snippets
    use 'neovim/nvim-lspconfig'
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use"onsails/lspkind-nvim"
    use { 
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        } 
    }
    use { "lervag/vimtex" }
    use { 
        "plasticboy/vim-markdown", 
        requires = { "godlygeek/tabular" }
        }
    use {
        'gelguy/wilder.nvim',
        --config = function()
        -- config goes here
        --end,
    }

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup{
            shade_terminals = false,
            shade_filetypes = {"none", "fzf"},
            winbar = {
                enabled = true,
                name_formatter = function(term)
                    return term.name
                end
            },
        }
    end}

    use {"lewis6991/gitsigns.nvim"}
    use "sindrets/diffview.nvim"
    use {'madskjeldgaard/cppman.nvim',
	        requires = {
		        { 'MunifTanjim/nui.nvim' }
            }
        }
    use {'declance/maximize.nvim',
            config = function() require('maximise').setup() end
        }

    use {
        "nvim-neotest/neotest",
        requires = {
                "nvim-neotest/nvim-nio",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "alfaix/neotest-gtest"
            }
    }

    if packer_bootstrap then
	require('packer').sync()
    end
end)

require('lualine').setup({
    options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''}
    }
})
require('bufferline').setup({})
require('nvim-tree').setup({})
require("mason").setup()
require("luasnip").filetype_extend("all", {"_"})
require("luasnip.loaders.from_snipmate").lazy_load()
require("gitsigns").setup({})
require('diffviewConf')

require 'nvim-treesitter.configs'.setup {
     ensure_installed = { "cpp", "python", "java", "lua", "vim", "markdown" },
     sync_install = true,
     auto_install = true,
     highlight = {
    	enable = true
     }
 }
require('cppman').setup()
require('wilderConf')
--require('indent_blankline').setup {
--    show_current_context = true,
--    show_current_context_start = true,
--}

--require("neotest").setup({
-- adapters = {
--        require("neotest-gtest").setup({
--            debug_adapter="gdb"
--        })
--  }
--})


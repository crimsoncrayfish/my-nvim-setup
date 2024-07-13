return {
{'williamboman/mason.nvim', opts = {ensure_installed= { "gopls", },}, },
{'williamboman/mason-lspconfig.nvim'},
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig',
    config = function ()
    end,
},
{ 'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
}

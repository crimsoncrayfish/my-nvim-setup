local lsp = require('lsp-zero')

lsp.preset("recommended")

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp.set_preferences({
	sign_icons = { }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({select = true}),

	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

lsp.on_attach(function (client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	local map = vim.keymap.set
	map("n", "gd", function () vim.lsp.buf.definition() end, opts)
	map("n", "K", function () vim.lsp.buf.hover() end, opts)
	map("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
	map("n", "<leader>vd", function () vim.diagnostic.open_float() end, opts)
	map("n", "[d", function () vim.diagnostic.goto_next() end, opts)
	map("n", "]d", function () vim.diagnostic.goto_prev() end, opts)
	map("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
	map("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
	map("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
	map("n", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'gopls', 'tsserver', 'eslint', 'rust_analyzer' },
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

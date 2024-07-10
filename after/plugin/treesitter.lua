require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'lua', 'go', 'javascript', 'typescript', 'html', 'vim' },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	},
}

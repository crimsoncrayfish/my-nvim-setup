local dapGo = require("dap-go")

dapGo.setup({
	ft = "go",
	dependencies = "mfussenegger/nvim-dap",
	config = function(_, opts)
		require("dap-go").setup(opts)
	end,
})
local map = vim.keymap.set
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader>dus", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end)
map("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end)
map("n", "<leader>dgl", function()
	require("dap-go").debug_last()
end)

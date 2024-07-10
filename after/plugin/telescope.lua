

local builtin = require('telescope.builtin')
local map = vim.keymap.set
map('n', '<leader>pf', builtin.find_files, {})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end, {})

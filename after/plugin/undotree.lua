vim.g.undotree_DiffCommand = "FC"

local map = vim.keymap.set
map("n", "<leader>u", vim.cmd.UndotreeToggle)

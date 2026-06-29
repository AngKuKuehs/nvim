-- Maps " " to <leader>
vim.g.mapleader = " "

-- Maps <leader>pv to :Explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Maps <leader>e to show diagnostics in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })


-- Maps " " to <leader>
vim.g.mapleader = " "

-- Maps <leader>e to show diagnostics in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })


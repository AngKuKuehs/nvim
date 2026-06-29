require("bryanang")

-- Show absolute line numbers
vim.opt.number = true

-- Show relative line numbers (absolute number for current line
vim.opt.relativenumber = true

-- show line numbers in explorer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    -- vim.opt_local.number = true          -- Show absolute numbers
    vim.opt_local.relativenumber = true   -- Show relative numbers (highly recommended for jumping)
  end,
})

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Number of spaces for a tab or when auto-indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Number of spaces used for each step of indentation
vim.opt.shiftwidth = 4

-- nvim-cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

-- lsps
vim.lsp.enable('luals')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('jdtls')

-- windows
vim.o.winborder = 'rounded'

-- Maps <leader>e to show diagnostics in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })



-- disable netrw, recommended by nvim-tree since it replaces it
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        number = true,          -- absolute line numbers, same as the editor
        relativenumber = true,  -- relative numbers, same as the editor
    },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status (fugitive)" })
vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiffsplit, { desc = "Diff file against index (side by side)" })
vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<CR>", { desc = "Blame whole file" })

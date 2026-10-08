return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- deferred: calling require("nvim-treesitter").install() synchronously
            -- here fails (module isn't fully ready yet during lazy.nvim's config step)
            vim.schedule(function()
                require("nvim-treesitter").install({
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "javascript",
                    "typescript",
                    "rust",
                    "java",
                    "c",
                    "markdown",
                    "markdown_inline",
                })
            end)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "javascript",
                    "typescript",
                    "rust",
                    "java",
                    "c",
                    "markdown",
                },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}

return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                colors = {
                    theme = {
                        -- Remove the gutter background so the sign column
                        -- (gitsigns, diagnostics) stays transparent
                        all = { ui = { bg_gutter = "none" } },
                    },
                },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    },
}

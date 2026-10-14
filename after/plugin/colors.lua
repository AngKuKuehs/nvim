function ColourMe(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Readable block cursor: light text on a dim bg so the cursor looks translucent and the character stays visible
    vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
    vim.api.nvim_set_hl(0, "Cursor",  { fg = "#DCD7BA", bg = "#54546D" })
    vim.api.nvim_set_hl(0, "lCursor", { fg = "#DCD7BA", bg = "#54546D" })

    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    vim.cmd [[ highlight EndOfBuffer guifg=#6a6a76 ]]

    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { bg = "none" })

    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "✘",
                [vim.diagnostic.severity.WARN]  = "▲",
                [vim.diagnostic.severity.INFO]  = "◆",
                [vim.diagnostic.severity.HINT]  = "⚑",
            },
        },
    })

end

ColourMe()

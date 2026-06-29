function ColourMe(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

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

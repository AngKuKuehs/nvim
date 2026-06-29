return {
    cmd = { 'lua-language-server' },  -- the executable to start the server
    filetypes = { 'lua' },            -- which filetypes this server handles
    root_markers = { '.luarc.json', '.luarc.jsonc' }, -- how to detect project root
    diagnostics = {
        globals = { 'vim', 'require' },
    },
    workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
    },
}

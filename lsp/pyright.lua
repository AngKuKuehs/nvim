return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'pyproject.toml', '.git' }, { upward = true })[1] or vim.loop.cwd())
}

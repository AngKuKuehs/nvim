return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'Cargo.toml', '.git' }, { upward = true })[1] or vim.loop.cwd())
}

return {
  cmd = { 'jdtls' },
  filetypes = { 'java' },
  root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1] or vim.loop.cwd())
}

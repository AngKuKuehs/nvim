# bryan's nvim conf

Lazy.nvim-managed config. Entry point: `init.lua` -> `lua/bryanang/{remap,lazy}.lua` -> `lua/bryanang/plugins/*.lua`.

## plugins
 - `nvim-cmp` - autocompletion (lsp, buffer, path, luasnip sources)
 - `nvim-treesitter` - syntax highlighting (lua, vim, vimdoc, query, javascript, typescript, rust, java, c, markdown)
 - `mbbill/undotree` - undo history visualizer
 - `ThePrimeagen/harpoon` (branch `harpoon2`) - quick file marking/jumping
 - `tpope/vim-fugitive` - git integration
 - `nvim-telescope/telescope.nvim` - fuzzy finder
 - `rebelot/kanagawa.nvim` - colorscheme
 - `neovim/nvim-lspconfig` + `mason-org/mason.nvim` - LSP client/installer
 - `nvim-tree/nvim-tree.lua` - file explorer sidebar (replaces netrw)

## LSPs
Enabled via `vim.lsp.enable(...)` in `init.lua`, configured under `lsp/`:
 - `luals` (Lua)
 - `pyright` (Python)
 - `rust_analyzer` (Rust)
 - `jdtls` (Java)

## leader
`<Space>` is `<leader>` (set in `lua/bryanang/remap.lua`).

## keybindings

### default (built-in neovim)
| key | action |
|---|---|
| `K` | show type/signature/doc from lsp (hover) |
| `K` (again, cursor unmoved) | move focus into the hover popup — scroll with `j`/`k` or `<C-d>`/`<C-u>`, close with `q`/`<Esc>` |
| `<C-w>h` | move to left pane |
| `<C-w>l` | move to right pane |
| `<C-w>j` | move to pane below |
| `<C-w>k` | move to pane above |
| `<C-w>s` | split horizontally |
| `<C-w>v` | split vertically |

### general remaps
| key | action |
|---|---|
| `<leader>e` | show line diagnostics in floating window |

### nvim-tree
| key | action |
|---|---|
| `<leader>pv` | toggle file explorer sidebar |

### telescope (`<leader>p*`, `<leader>s`)
| key | action |
|---|---|
| `<leader>pf` | find files |
| `<C-p>` | find git-tracked files |
| `<leader>ps` | grep for a string (prompts for input) |

### harpoon
| key | action |
|---|---|
| `<leader>a` | add current file to harpoon list |
| `<C-e>` | toggle harpoon quick menu |
| `<C-h>` | jump to harpoon file 1 |
| `<C-t>` | jump to harpoon file 2 |
| `<C-n>` | jump to harpoon file 3 |
| `<C-s>` | jump to harpoon file 4 |

### undo-tree
| key | action |
|---|---|
| `<leader>u` | toggle undotree |

### fugitive (git)
| key | action |
|---|---|
| `<leader>gs` | open `:Git` status |

### completion (nvim-cmp, insert mode)
| key | action |
|---|---|
| `<Tab>` | select next completion item |
| `<S-Tab>` | select previous completion item |
| `<CR>` | confirm selected completion |
| `<M-c>` | trigger completion manually |

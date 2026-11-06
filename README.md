# bryan's nvim conf

Lazy.nvim-managed config. Entry point: `init.lua` -> `lua/bryanang/{remap,lazy}.lua` -> `lua/bryanang/plugins/*.lua`.

## get started

1. **Install neovim 0.11 or newer.** The config uses `vim.lsp.enable` and `winborder`, which need 0.11+. Also make sure `git` is installed. Mason, which installs the LSP servers, needs `curl`, `unzip`, and `tar`.
2. **Clone this repo to the neovim config path:**
   ```sh
   git clone https://github.com/AngKuKuehs/nvim.git ~/.config/nvim
   ```
   If you already have a config there, back it up first with `mv ~/.config/nvim ~/.config/nvim.bak`.
3. **Start neovim.** `lazy.nvim` bootstraps itself on the first launch and installs every plugin. Wait for the install window to finish, then press `q` to close it.
4. **Restart neovim** so treesitter parsers and plugin config load cleanly.
5. **Install the LSP servers.** Run `:Mason`, then install the servers you need:
   - `lua-language-server` (Lua)
   - `pyright` (Python)
   - `rust-analyzer` (Rust)
   - `jdtls` (Java)

   Open a file of each type and run `:LspInfo` to confirm the server attached.
6. **Run `:checkhealth`** and fix anything it flags.
7. **Learn the leader key.** `<Space>` is `<leader>`, so most custom mappings start with it. The [keybindings](#keybindings) section lists them all.

## iterm2 setup

Optional, macOS only. `iterm/Default.json` is my iTerm2 profile (font, colors, key mappings, and terminal settings), exported as a dynamic profile.

1. **Install the font.** The profile uses JetBrainsMono Nerd Font Mono:
   ```sh
   brew install --cask font-jetbrains-mono-nerd-font
   ```
   Or download it from [nerdfonts.com](https://www.nerdfonts.com/).
2. **Copy the profile into iTerm2's dynamic profiles folder:**
   ```sh
   mkdir -p "$HOME/Library/Application Support/iTerm2/DynamicProfiles"
   cp ~/.config/nvim/iterm/Default.json "$HOME/Library/Application Support/iTerm2/DynamicProfiles/"
   ```
3. **Check that it loaded.** iTerm2 picks up dynamic profiles automatically. Open **Settings → Profiles** and look for "Default".
4. **Make it your default.** Select the profile and click **Other Actions → Set as Default**.
5. **Open a new iTerm2 window** so the profile applies.

The profile sets the left Option key to send `Esc+`, which lets neovim see it as Meta. Mappings like `<M-c>` need this, so use left Option for them.

See [`iterm/README.md`](iterm/README.md) for more detail.

## lazy.nvim basics

[lazy.nvim](https://github.com/folke/lazy.nvim) is the plugin manager. It is bootstrapped in `lua/bryanang/lazy.lua`, and it loads every file under `lua/bryanang/plugins/` automatically.

### common commands
| command | action |
|---|---|
| `:Lazy` | open the lazy.nvim dashboard |
| `:Lazy sync` | install missing plugins, update plugins, and remove unused ones |
| `:Lazy update` | update plugins to the latest version |
| `:Lazy restore` | roll plugins back to the commits pinned in `lazy-lock.json` |
| `:Lazy clean` | remove plugins that are no longer in the config |
| `:Lazy health` | check lazy.nvim's own setup |
| `:Lazy profile` | show what slowed startup |

### dashboard keys
Inside the `:Lazy` window:
| key | action |
|---|---|
| `I` | install missing plugins |
| `U` | update plugins |
| `S` | sync |
| `C` | check for updates |
| `X` | clean unused plugins |
| `L` | show the log |
| `<CR>` or `d` | show details for the plugin under the cursor |
| `?` | show help |
| `q` | close the window |

### adding a plugin
1. Add a spec to a file in `lua/bryanang/plugins/`. Each file returns a table of specs, for example:
   ```lua
   return {
       { "owner/plugin-name" },
       {
           "owner/other-plugin",
           opts = {},            -- passed to require("other-plugin").setup(opts)
       },
   }
   ```
2. Restart neovim, or run `:Lazy sync`.
3. Commit the change together with the updated `lazy-lock.json`, so other machines get the same plugin versions.

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
 - `christoomey/vim-tmux-navigator` - move between nvim splits and tmux panes with `<C-h/j/k/l>` (see tmux section below)

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

### tmux navigation (vim-tmux-navigator)
Works in both directions when nvim runs inside tmux. Ctrl-h/j/k/l move between nvim splits and tmux panes, and leave nvim when the cursor is at the edge of the split.
| key | action |
|---|---|
| `<C-h>` | move left (nvim split or tmux pane) |
| `<C-j>` | move down |
| `<C-k>` | move up |
| `<C-l>` | move right |

Needs the tmux side loaded through tpm in `~/.tmux.conf`. See `~/.tmux/README.md`.

### nvim-tree
| key | action |
|---|---|
| `<leader>pv` | toggle file explorer sidebar |
| `a` | create file or directory (end with `/` for a directory, e.g. `foo/bar/` or `foo/bar/baz.lua`) |
| `d` | delete file or directory (permanent, asks to confirm) |
| `D` | move file or directory to trash |

Keys are pressed with the cursor on the node inside the tree window. The tree buffer is read-only, so `<C-a>` (vim's normal-mode increment) and typing letters like `i`/`o` fail with `E21: Cannot make changes, 'modifiable' is off`. Use `a` to create instead.

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
| `<leader>1` | jump to harpoon file 1 |
| `<leader>2` | jump to harpoon file 2 |
| `<leader>3` | jump to harpoon file 3 |
| `<leader>4` | jump to harpoon file 4 |

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

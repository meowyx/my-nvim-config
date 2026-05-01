# My Neovim Config

A complete Neovim setup built around Rust development, with LSP, autocomplete, formatting, git integration, and a polished UI.

If you're brand new to Neovim, read this top-to-bottom. If you already know Vim, skip to the [shortcuts cheat sheet](#shortcuts-cheat-sheet).

---

## Table of contents

1. [What you get](#what-you-get)
2. [Install](#install)
3. [The most important Vim concept: modes](#the-most-important-vim-concept-modes)
4. [Doing the basics](#doing-the-basics)
5. [Shortcuts cheat sheet](#shortcuts-cheat-sheet)
6. [Plugin list](#plugin-list)
7. [Common workflows](#common-workflows)
8. [Troubleshooting](#troubleshooting)

---

## What you get

- LSP (autocomplete, go-to-definition, error highlighting, hover docs) for Rust + Lua, with `mason` to install language servers automatically
- Inline error squiggles via clippy on save (Rust)
- Inlay hints showing inferred types and parameter names
- Format-on-save via `conform.nvim` (rustfmt for Rust, stylua for Lua, prettier for JS/TS/JSON/Markdown/YAML, taplo for TOML)
- Fuzzy file/text finder (`telescope`)
- File tree sidebar (`neo-tree`)
- Git markers in the gutter + hunk navigation (`gitsigns`)
- Cargo.toml live version annotations (`crates.nvim`)
- Auto-close brackets/quotes (`nvim-autopairs`)
- Surround motions for changing/adding/deleting wrapper chars (`nvim-surround`)
- Comment toggling with `gcc` (`Comment.nvim`)
- VS Code-style buffer tabs at the top (`bufferline`)
- Color highlighting for hex/rgb/Tailwind (`nvim-colorizer`)
- Inline labels at the end of long blocks (`nvim-biscuits`)
- Status bar (`lualine`)
- Leader-key cheat popup (`which-key`)
- Transparent background (`transparent.nvim`)
- Catppuccin theme

---

## Install

### Prerequisites

You need:
- **Neovim 0.11 or newer** — `brew install neovim`
- **Rust toolchain** (for rustfmt + clippy via rust-analyzer) — `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- **Node** (for prettier) — `brew install node`
- **A Nerd Font** (for icons) — e.g. `brew install --cask font-jetbrains-mono-nerd-font`, then set your terminal to use it

Optional:
- `stylua` and `taplo` will be auto-installed by `mason`
- `prettier` — install globally with `npm install -g prettier`

### Setup

```bash
# Back up any existing config first
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null

# Clone this repo to where Neovim looks for config
git clone https://github.com/<your-username>/my-nvim-config ~/.config/nvim

# Launch Neovim — Lazy will auto-install all plugins on first run
nvim
```

The first launch downloads ~25 plugins. Wait for it to finish (you'll see a green checkmark on each), close the Lazy window with `q`, then quit with `:qa!` and reopen for a clean start.

---

## The most important Vim concept: modes

Vim has **modes**. Pressing the same key does different things in different modes. This is the #1 thing that confuses beginners.

| Mode | What it's for | How to enter |
|---|---|---|
| **Normal** | Navigation + commands. The default mode. You move around and run commands here. | `Esc` from anywhere |
| **Insert** | Typing text into the file. | `i`, `a`, `o`, `O` from normal mode |
| **Visual** | Selecting text. | `v`, `V`, or `Ctrl+v` from normal mode |
| **Command** | Running `:save`, `:quit`, etc. | `:` from normal mode |

**The big mental shift:** you can't just open a file and start typing. You're in normal mode by default. Press `i` to enter insert mode and *then* type. Press `Esc` to leave insert mode when you're done typing.

You will press `Esc` thousands of times. That's normal.

### How to know which mode you're in

Look at the bottom-left of the screen. The lualine status bar shows the current mode:
- `NORMAL`
- `INSERT`
- `VISUAL`
- `COMMAND`

---

## Doing the basics

### Open a file or project

From your terminal:

```bash
nvim                    # opens with no file (you can browse from here)
nvim somefile.rs        # opens that file
nvim .                  # opens the current directory (browse with the file tree)
cd ~/Projects/foo && nvim .   # open a whole project
```

Inside Neovim:

```
:e path/to/file         # open a specific file by path
```

### Enter insert mode (start typing)

Press one of these in normal mode:
- `i` — insert *before* the cursor
- `a` — insert *after* the cursor (good for appending)
- `o` — open a new line *below* and enter insert mode
- `O` — open a new line *above* and enter insert mode

Now you can type freely.

### Leave insert mode

Press `Esc`. You're back in normal mode.

### Save

In normal mode, type:
```
:w
```
and press `Enter`. Or use the shortcut `Space + w` (the leader key is `Space`).

### Quit

```
:q          # quit current window
:qa         # quit all windows
:qa!        # quit all without saving
:wq         # save and quit
```

Or `Space + q` to quit the current window.

### Undo / redo

- `u` — undo
- `Ctrl+r` — redo

---

## Shortcuts cheat sheet

The **leader key** is `Space`. So `<leader>w` means "press Space then w."

### Movement (normal mode)

| Shortcut | Action |
|---|---|
| `h` `j` `k` `l` | Left, down, up, right (use these, not arrows) |
| `w` | Jump forward one word |
| `b` | Jump back one word |
| `e` | Jump to end of word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `Ctrl+d` | Half-page down |
| `Ctrl+u` | Half-page up |
| `{` / `}` | Jump by paragraph |
| `%` | Jump to matching bracket |
| `f<char>` | Jump to next occurrence of `<char>` on the line |
| `*` | Search for the word under cursor |

### Editing (normal mode)

| Shortcut | Action |
|---|---|
| `i` `a` `o` `O` | Enter insert mode (see [above](#enter-insert-mode-start-typing)) |
| `x` | Delete the character under cursor |
| `dd` | Delete the entire line |
| `5dd` | Delete 5 lines |
| `yy` | Yank (copy) the line |
| `p` | Paste below cursor / after cursor |
| `P` | Paste above / before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `dw` | Delete word |
| `cw` | Change word (delete it + enter insert mode) |
| `ci"` | Change inside `"` (cursor anywhere on the string) |
| `ci(` | Change inside `()` |
| `da{` | Delete around `{}` (including the braces) |
| `gcc` | Toggle comment on the line |
| `gc` (visual) | Toggle comment on selection |

### Saving / quitting

| Shortcut | Action |
|---|---|
| `Space + w` | Save file |
| `Space + q` | Quit current window |
| `:w` | Save (command form) |
| `:qa!` | Force quit everything |

### Window splits

| Shortcut | Action |
|---|---|
| `:vsplit` | Split vertically |
| `:split` | Split horizontally |
| `Ctrl+w` then `h` `j` `k` `l` | Move between splits |
| `Ctrl+w` then `=` | Equalize split sizes |
| `Ctrl+w` then `q` | Close current split |

### Buffer tabs (bufferline)

| Shortcut | Action |
|---|---|
| `Shift+l` | Next tab |
| `Shift+h` | Previous tab |
| `Space + b + d` | Close current tab |

### File tree (neo-tree)

| Shortcut | Action |
|---|---|
| `Ctrl+n` | Toggle the file tree sidebar |
| (inside tree) `j` `k` | Move up/down |
| (inside tree) `Enter` | Open file / expand folder |
| (inside tree) `a` | Add new file (end name with `/` for folder) |
| (inside tree) `d` | Delete file |
| (inside tree) `r` | Rename |
| (inside tree) `c` | Copy |
| (inside tree) `m` | Move |
| (inside tree) `H` | Toggle hidden files |
| (inside tree) `?` | See all neo-tree shortcuts |

### Find files / search content (telescope)

| Shortcut | Action |
|---|---|
| `Ctrl+p` | Fuzzy find files by name |
| `Ctrl+f` | Search file contents (live grep) |
| (inside telescope) `Enter` | Open the highlighted result |
| (inside telescope) `Esc` | Cancel |

### LSP (when in a code file)

| Shortcut | Action |
|---|---|
| `K` | Show hover documentation |
| `gd` | Go to definition |
| `gr` | Show all references |
| `Space + r + n` | Rename symbol everywhere |
| `Space + c + a` | Code actions (quick fixes / refactors) |
| `[d` | Jump to previous diagnostic |
| `]d` | Jump to next diagnostic |
| `Ctrl+o` | Jump back to previous location |

### Autocomplete (insert mode, while menu is open)

| Shortcut | Action |
|---|---|
| `Ctrl+Space` | Trigger completion menu |
| `Tab` / `Shift+Tab` | Navigate suggestions |
| `Enter` | Accept selected suggestion |
| `Ctrl+e` | Dismiss menu |
| `Ctrl+d` / `Ctrl+u` | Scroll long doc popups |

### Formatting

| Shortcut | Action |
|---|---|
| `Space + f` | Format current file (or selection) |
| (auto) | Saves automatically format the file via the right tool |

### Surround (changing wrapper characters)

| Shortcut | Action |
|---|---|
| `cs"'` | Change `"hello"` to `'hello'` |
| `ds"` | Delete surrounding `"` from `"hello"` → `hello` |
| `ysiw"` | Wrap inner word in `"` → `hello` becomes `"hello"` |
| `ysiw)` | Wrap inner word in tight parens → `hello` becomes `(hello)` |
| `ysiw{` | Wrap inner word in spaced braces → `hello` becomes `{ hello }` |
| `S"` (visual mode) | Wrap selection in `"` |

### Git (gitsigns)

| Shortcut | Action |
|---|---|
| `]c` | Jump to next changed hunk |
| `[c` | Jump to previous changed hunk |
| `Space + h + s` | Stage hunk under cursor |
| `Space + h + r` | Reset/discard hunk |
| `Space + h + p` | Preview hunk diff |
| `Space + h + b` | Blame current line |

### Cargo.toml (crates.nvim)

| Shortcut | Action |
|---|---|
| `Space + c + t` | Toggle inline annotations |
| `Space + c + u` | Update crate under cursor |
| `Space + c + U` | Upgrade all crates |
| `Space + c + v` | Show available versions |
| `Space + c + f` | Show available features |

### Plugin manager

| Command | Action |
|---|---|
| `:Lazy` | Open the Lazy plugin manager UI |
| `:Lazy sync` | Install missing + update existing plugins |
| `:Lazy update` | Update all plugins |
| `:Mason` | Open Mason (manage language servers / formatters) |
| `:MasonInstall <name>` | Install a tool via Mason |
| `:TSUpdate` | Update treesitter parsers |

### Misc

| Shortcut | Action |
|---|---|
| `Space` (then wait) | which-key popup shows all shortcuts starting with Space |
| `:checkhealth` | Diagnose plugin/config issues |
| `:LspInfo` | See active language servers for current buffer |
| `:TransparentEnable` / `:TransparentDisable` | Toggle background transparency |

---

## Plugin list

Each plugin lives in its own file under `lua/plugins/`.

| File | Plugin | What it does |
|---|---|---|
| `catppuccin.lua` | catppuccin/nvim | Color theme |
| `telescope.lua` | nvim-telescope/telescope.nvim | Fuzzy finder |
| `treesitter.lua` | nvim-treesitter/nvim-treesitter | Syntax highlighting |
| `neo-tree.lua` | nvim-neo-tree/neo-tree.nvim | File tree sidebar |
| `lsp-config.lua` | mason + mason-lspconfig + nvim-lspconfig | Language server setup |
| `completions.lua` | nvim-cmp + LuaSnip + friendly-snippets | Autocomplete + snippets |
| `formatting.lua` | stevearc/conform.nvim | Format on save |
| `lualine.lua` | nvim-lualine/lualine.nvim | Status bar |
| `gitsigns.lua` | lewis6991/gitsigns.nvim | Git markers + hunk operations |
| `which-key.lua` | folke/which-key.nvim | Leader-key cheat popup |
| `comment.lua` | numToStr/Comment.nvim | `gcc` to toggle comments |
| `autopairs.lua` | windwp/nvim-autopairs | Auto-close brackets/quotes |
| `surround.lua` | kylechui/nvim-surround | Surround motions |
| `biscuits.lua` | code-biscuits/nvim-biscuits | Inline labels at end of long blocks |
| `colorizer.lua` | catgoose/nvim-colorizer.lua | Color highlighting (hex/rgb/Tailwind) |
| `crates.lua` | saecki/crates.nvim | Cargo.toml version annotations |
| `bufferline.lua` | akinsho/bufferline.nvim | VS Code-style tabs |
| `transparent.lua` | xiyaowong/transparent.nvim | Transparent background |

---

## Common workflows

### Open a project, navigate, edit, save

```
cd ~/Projects/foo
nvim .
```

You see the file tree on the right. To open `src/main.rs`:

1. Press `Ctrl+p` (telescope fuzzy find)
2. Type `main.rs`
3. `Enter`

You're now in `main.rs` in normal mode. To edit:

1. Move your cursor to where you want to type (`hjkl` or arrows or `/searchterm`)
2. Press `i` to enter insert mode
3. Type your changes
4. `Esc` to leave insert mode
5. `:w` (or `Space+w`) to save

### Jump between files

If you've opened multiple files, switch between them with:

- `Shift+l` / `Shift+h` (next/prev tab)
- Or `Ctrl+p` (filename) / `Ctrl+f` (search content) to find a different one

### Find an error and fix it

After saving a Rust file, clippy runs and you'll see error/warning markers:

1. `]d` — jump to the next diagnostic
2. `K` — read the hover docs about why it's flagged
3. `Space + c + a` — get suggested code actions (often "apply suggestion" auto-fixes it)
4. `Esc` to dismiss popups

### Rename a function across the project

1. Move cursor onto the function name
2. `Space + r + n`
3. Type the new name
4. `Enter`

LSP renames every reference across all files in the project.

### Comment out a block

1. Position cursor on the first line
2. `V` (visual line mode)
3. Move down to select more lines (`j` or arrows)
4. `gc`

To uncomment, do the same thing again.

### Stage a single git hunk

You changed several things in a file but only want to commit one of them.

1. In the file, jump to the hunk: `]c` (next hunk) or `[c` (previous)
2. `Space + h + p` to preview what that hunk is
3. `Space + h + s` to stage just that hunk
4. Repeat for any other hunks you want
5. Commit normally from your terminal: `git commit`

---

## Troubleshooting

### Markdown files show treesitter errors

Known issue with nvim 0.12 + nvim-treesitter master. Already worked around in `treesitter.lua` (autocmd stops treesitter for markdown buffers). Markdown files load with no syntax coloring but no errors. Remove the autocmd when upstream catches up.

### Icons appear as `?` boxes

You haven't installed (or your terminal isn't using) a Nerd Font. Install `font-jetbrains-mono-nerd-font` (or any other Nerd Font), then set your terminal profile to use it.

### LSP shows "deprecated" warnings

A plugin is calling an old nvim API. Run `:checkhealth vim.deprecated` to see which one. Usually fixed by `:Lazy update` once upstream ships a fix. Harmless until then.

### Clippy lints don't appear

Run `:LspInfo` in a `.rs` file. If `rust_analyzer` isn't attached, check that `rust-analyzer` is installed (`rust-analyzer --version` in your shell). Mason should auto-install it on first launch — if it didn't, run `:Mason`, find rust-analyzer, press `i` to install.

### Format on save isn't working

Check that the formatter for that filetype is on your PATH:
- Rust: `rustfmt --version` (ships with rustup)
- Lua: `stylua --version` (Mason installs it; `:MasonInstall stylua`)
- JS/TS/etc: `prettier --version` (`npm install -g prettier`)

### Plugins didn't install

Run `:Lazy sync`. If a plugin is stuck on "Working", check `:Lazy log` for errors. Usually a network or git issue.

---

## Notes for future-me

- `init.lua` does the bootstrap and loads everything via `require("lazy").setup("plugins")` — that auto-imports every `.lua` file under `lua/plugins/`.
- Editor settings live in `lua/vim-options.lua`.
- Each plugin is one file. To add a plugin, drop a new `.lua` file in `lua/plugins/` returning the spec — Lazy picks it up automatically.
- Commit `lazy-lock.json` so other machines reproduce the exact plugin versions.

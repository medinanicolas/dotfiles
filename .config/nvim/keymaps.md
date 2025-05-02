# Neovim Setup - Keymap Cheatsheet

**Leader Key:** `Space` (Press `Space` before the rest of the sequence)

| Category             | Keymap                    | Description                                | File Location (for changes)        |
| :------------------- | :------------------------ | :----------------------------------------- | :--------------------------------- |
| **General** | `<leader>e`               | Toggle File Explorer (NvimTree)            | `lua/core/keymaps.lua`             |
| **Tabs & Buffers** | `<leader>tn`              | New Tab                                    | `lua/core/keymaps.lua`             |
|                      | `<leader>tc`              | Close Current Tab                          | `lua/core/keymaps.lua`             |
|                      | `<leader>to`              | Close Other Tabs                           | `lua/core/keymaps.lua`             |
|                      | `<leader>t]`              | Next Tab                                   | `lua/core/keymaps.lua`             |
|                      | `<leader>t[`              | Previous Tab                               | `lua/core/keymaps.lua`             |
|                      | `<leader>bn`              | New Empty Buffer                           | `lua/core/keymaps.lua`             |
|                      | `<leader>bd`              | Delete/Close Current Buffer                | `lua/core/keymaps.lua`             |
|                      | `<leader>fb`              | Find/Switch Buffer (Telescope)             | `lua/plugins/telescope.lua`        |
| **Window Mgmt** | `<leader>sv`              | Split Vertical                             | `lua/core/keymaps.lua`             |
|                      | `<leader>sh`              | Split Horizontal                           | `lua/core/keymaps.lua`             |
|                      | `<leader>sc`              | Close Current Split                        | `lua/core/keymaps.lua`             |
|                      | `<leader>h`               | Navigate Left Split                        | `lua/core/keymaps.lua`             |
|                      | `<leader>j`               | Navigate Down Split                        | `lua/core/keymaps.lua`             |
|                      | `<leader>k`               | Navigate Up Split                          | `lua/core/keymaps.lua`             |
|                      | `<leader>l`               | Navigate Right Split                       | `lua/core/keymaps.lua`             |
| **In-File Navigation** | `gg`                      | Go to First Line                           | Built-in                           |
|                      | `G`                       | Go to Last Line                            | Built-in                           |
|                      | `NG` or `:N`              | Go to Line Number `N`                      | Built-in                           |
|                      | `N|`                      | Go to Column `N` on Current Line           | Built-in                           |
|                      | `0`                       | Go to Start of Line (first char)           | Built-in                           |
|                      | `^`                       | Go to Start of Line (first non-blank)      | Built-in                           |
|                      | `$`                       | Go to End of Line                          | Built-in                           |
|                      | `w` / `b`                 | Move Forward/Backward by Word              | Built-in                           |
|                      | `e` / `ge`                | Move to End of Word (Forward/Backward)     | Built-in                           |
|                      | `}` / `{`                 | Move by Paragraph (Forward/Backward)       | Built-in                           |
|                      | `Ctrl+f` / `Ctrl+b`       | Page Down / Page Up                        | Built-in                           |
|                      | `Ctrl+d` / `Ctrl+u`       | Half Page Down / Half Page Up              | Built-in                           |
|                      | `%`                       | Jump to Matching Brace/Paren/Bracket       | Built-in                           |
|                      | `/pattern<CR>`            | Search Forward for `pattern`               | Built-in                           |
|                      | `?pattern<CR>`            | Search Backward for `pattern`              | Built-in                           |
|                      | `n` / `N`                 | Repeat Search (Forward/Backward)           | Built-in                           |
| **Editing & Insert** | `i`                       | Enter Insert Mode (before cursor)          | Built-in                           |
|                      | `I`                       | Enter Insert Mode (at start of line)       | Built-in                           |
|                      | `a`                       | Enter Insert Mode (after cursor)           | Built-in                           |
|                      | `A`                       | Enter Insert Mode (at end of line)         | Built-in                           |
|                      | `o`                       | Open New Line Below & Enter Insert Mode    | Built-in                           |
|                      | `O`                       | Open New Line Above & Enter Insert Mode    | Built-in                           |
|                      | `x`                       | Delete Character Under Cursor              | Built-in                           |
|                      | `dw` / `db`               | Delete Word (Forward/Backward)             | Built-in                           |
|                      | `dd`                      | Delete Current Line                        | Built-in                           |
|                      | `D`                       | Delete from Cursor to End of Line          | Built-in                           |
|                      | `cc`                      | Change (Delete + Insert) Current Line      | Built-in                           |
|                      | `C`                       | Change (Delete + Insert) to End of Line    | Built-in                           |
|                      | `yy`                      | Yank (Copy) Current Line                   | Built-in                           |
|                      | `p` / `P`                 | Paste After / Before Cursor                | Built-in                           |
|                      | `u`                       | Undo                                       | Built-in                           |
|                      | `Ctrl+r`                  | Redo                                       | Built-in                           |
|                      | `.`                       | Repeat Last Change                         | Built-in                           |
|                      | `>` / `<` (Visual Mode)   | Indent / Un-indent Selected Block          | Built-in                           |
|                      | `gv` (Normal Mode)        | Re-select Last Visual Selection            | Built-in                           |
|                      | `=` (Visual Mode)         | Auto-indent Selection (uses filetype rules)| Built-in                           |
| **Telescope** | `<leader>ff`              | Find Files                                 | `lua/plugins/telescope.lua`        |
|                      | `<leader>fg`              | Find Text in Files (Live Grep)             | `lua/plugins/telescope.lua`        |
|                      | `<leader>fb`              | Find Open Buffers                          | `lua/plugins/telescope.lua`        |
|                      | `<leader>fh`              | Find Help Tags                             | `lua/plugins/telescope.lua`        |
|                      | `<leader>fo`              | Find Old Files (Recently Opened)           | `lua/plugins/telescope.lua`        |
| **LSP** | `K`                       | Show Hover Info/Documentation              | `lua/plugins/lsp.lua`              |
|                      | `gd`                      | Go to Definition                           | `lua/plugins/lsp.lua`              |
|                      | `<leader>gD`              | Go to Definition (New Tab)                 | `lua/core/keymaps.lua`             |
|                      | `gi`                      | Go to Implementation                       | `lua/plugins/lsp.lua`              |
|                      | `gr`                      | Go to References                           | `lua/plugins/lsp.lua`              |
|                      | `<leader>rn`              | Rename Symbol                              | `lua/plugins/lsp.lua`              |
|                      | `<leader>ca`              | Show Code Actions                          | `lua/plugins/lsp.lua`              |
|                      | `<leader>d`               | Show Line Diagnostics                      | `lua/plugins/lsp.lua`              |
|                      | `]d`                      | Go to Next Diagnostic                      | `lua/plugins/lsp.lua`              |
|                      | `[d`                      | Go to Previous Diagnostic                  | `lua/plugins/lsp.lua`              |
| **Formatting/Linting** | `<leader>f`               | Format Current Buffer (Manual)             | `lua/core/keymaps.lua`             |
|                      | `<leader>l`               | Lint Current Buffer (Manual)               | `lua/core/keymaps.lua`             |
| **Commenting** | `gcc` (Normal Mode)       | Toggle Comment for Current Line            | `lua/core/keymaps.lua` / Plugin Default |
|                      | `gc` (Visual Mode)        | Toggle Comment for Selection               | `lua/core/keymaps.lua` / Plugin Default |
| **Terminal** | `<C-\>` (Ctrl+Backslash) | Toggle Floating Terminal                   | `lua/plugins/ui.lua` (ToggleTerm Opts) |
|                      | `<Esc>` (Term Mode)       | Close Terminal                             | `lua/plugins/ui.lua` (ToggleTerm Config) |
|                      | `<leader>tv`              | Toggle Vertical Terminal                   | `lua/plugins/ui.lua` (ToggleTerm Config) |
|                      | `<leader>th`              | Toggle Horizontal Terminal                 | `lua/plugins/ui.lua` (ToggleTerm Config) |
|                      | `<leader>tf`              | Toggle Floating Terminal                   | `lua/plugins/ui.lua` (ToggleTerm Config) |

**Note:** The "File Location" column indicates where the keymap is *most likely* defined or if it's a built-in Vim/Neovim command.


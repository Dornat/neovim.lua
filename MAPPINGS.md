# Usefull and Custom Key Mappings

Leader key: `<Space>`

## General

| Mode | Key | Action |
|------|-----|--------|
| i | `jk` | Escape |
| n | `<C-f>` | Scroll 10 columns right |
| n | `<C-b>` | Scroll 10 columns left |
| i | `<C-f>` | Move cursor right |
| i | `<C-b>` | Move cursor left |
| n | `<leader>il` | Toggle invisible characters |
| n | `<leader>ig` | Toggle indent guides |
| n | `<leader>rnu` | Toggle relative line numbers |
| n | `<leader>f` | Format (formatter.nvim) |

## Window Resizing

| Key | Action |
|-----|--------|
| `<Alt-j>` | Decrease height by 2 |
| `<Alt-k>` | Increase height by 2 |
| `<Alt-h>` | Decrease width by 2 |
| `<Alt-l>` | Increase width by 2 |

## Quickfix

| Key | Action |
|-----|--------|
| `<Alt-f>` | Next quickfix item |
| `<Alt-d>` | Previous quickfix item |

## Navigation / Go-to

| Key | Action |
|-----|--------|
| `<C-]>` | Definition (LSP -> ctags -> references fallback) |
| `gd` | LSP definitions (Telescope) |
| `gr` | LSP references (Telescope) |
| `gD` | Go to declaration |
| `gi` | Go to implementation |

## LSP (attached buffers)

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<leader>grd` | Go to definition |
| `<leader>gr` | References |
| `<leader>D` | Type definition |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>n` | Open diagnostic float |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>q` | Diagnostics to location list |
| `<leader>wa` | Add workspace folder |
| `<leader>wr` | Remove workspace folder |
| `<leader>wl` | List workspace folders |

## Telescope (Find)

| Key | Action |
|-----|--------|
| `<leader>ff` | Project files (git_files -> find_files) |
| `<leader>fd` | Find files (all, including hidden) |
| `<leader>fg` | Live grep |
| `<leader>ft` | Grep string under cursor |
| `<leader>fo` | Live grep in specific directory |
| `<leader>fs` | Fuzzy find in current buffer |
| `<leader>fb` | Buffers |
| `<leader>fm` | Marks |
| `<leader>fq` | Quickfix list |
| `<leader>fu` | Jump list |
| `<leader>fr` | LSP references |
| `<leader>fw` | Workspace symbols (with prompt) |
| `<leader>fl` | Dynamic workspace symbols |

## Git (Fugitive)

| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |
| `<leader>gb` | Git blame |
| `<leader>gd` | Git diff (vertical split) |

## Git (Gitsigns)

| Mode | Key | Action |
|------|-----|--------|
| n | `]c` | Next hunk |
| n | `[c` | Previous hunk |
| n,v | `<leader>hs` | Stage hunk |
| n,v | `<leader>hr` | Reset hunk |
| n | `<leader>hS` | Stage buffer |
| n | `<leader>hu` | Undo stage hunk |
| n | `<leader>hR` | Reset buffer |
| n | `<leader>hp` | Preview hunk |
| n | `<leader>hb` | Blame line (full) |
| n | `<leader>hd` | Diff this |
| n | `<leader>hD` | Diff this (~) |
| n | `<leader>td` | Toggle deleted |
| o,x | `ih` | Select hunk (text object) |

## Diffview

| Key | Action |
|-----|--------|
| `<leader>dvo` | Open diffview |
| `<leader>dvc` | Close diffview |
| `<leader>dvh` | Open diffview with ref (prompts for input) |
| `<leader>dvf` | File history for current file |
| `<leader>co` | Choose OURS version of conflict (in merge tool) |
| `<leader>ct` | Choose THEIRS version of conflict (in merge tool) |
| `<leader>cb` | Choose BASE version of conflict (in merge tool) |
| `<leader>ca` | Choose ALL versions of conflict (in merge tool) |
| `]x` / `[x` | Next / previous conflict (in merge tool) |

## File Tree (nvim-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle tree |
| `<leader>-` | Collapse all folders |
| `<leader>=` | Find current file in tree |
| `l` | Open file/folder (in tree buffer) |
| `<C-]>` | Change root to selected folder (in tree buffer) |
| `<C-t>` | Change root to parent (in tree buffer) |
| `?` | Toggle help (in tree buffer) |

## Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<Tab>` | Next item / expand snippet |
| `<S-Tab>` | Previous item / jump snippet back |
| `<C-n>` | Next item |
| `<C-p>` | Previous item |
| `<C-e>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-c>` | Close completion |
| `<C-j>` | Scroll docs down |
| `<C-k>` | Scroll docs up |

## Comments (nvim-comment)

| Mode | Key | Action |
|------|-----|--------|
| n | `gcc` | Toggle comment on line |
| n | `gc{motion}` | Toggle comment over motion |
| v | `gc` | Toggle comment on selection |

## Yank

| Mode | Key | Action |
|------|-----|--------|
| v | `<leader>ya` | Yank selection with absolute path |
| v | `<leader>yr` | Yank selection with relative path |
| v | `<leader>yy` | Yank selection without path |
| n | `<leader>ypa` | Yank absolute path of current file |
| n | `<leader>ypr` | Yank relative path of current file |




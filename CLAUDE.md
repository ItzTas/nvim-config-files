# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This is a personal **Neovim configuration** (Lua, LuaJIT runtime), managed with the
[lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.

## Commands

There is no build/test suite — changes are validated by loading them in Neovim.

- **Sync / install / update plugins (headless):** `nvim --headless "+Lazy! sync" +qa`
  (this exact command is pre-approved in `.claude/settings.local.json`)
- **Manage plugins interactively:** `:Lazy` (then `S` sync, `U` update, `X` clean)
- **Diagnose problems:** `:checkhealth`
- **Format Lua:** files are formatted with `stylua` via `conform.nvim`; in-editor `<leader>f`
  runs conform with LSP fallback (see `lua/functions/format.lua`).
- **Reload after editing config:** restart Neovim, or `:source` the changed file. `lazy.nvim`'s
  `change_detection` is on, so plugin-spec edits prompt a reload.

`lazy-lock.json` is **gitignored**, so plugin versions are not pinned in the repo and the
`checker` is enabled — plugins float to latest.

## Architecture

### Boot sequence (`init.lua`)
1. Sets `mapleader` / `maplocalleader` and installs a `vim.tbl_flatten` shim (some plugins,
   e.g. the telescope live-grep helper, still call the deprecated function).
2. `require("manager")` — bootstraps lazy.nvim and discovers all plugin specs.
3. `require("commands")` and `require("config")` — auto-load their directories (see below).
4. Sets the colorscheme (`rose-pine-moon`) and applies a transparent background.
5. `require("autocmds")`.

### Three auto-loading mechanisms
These directory loaders mean **you add behavior by dropping a new file in the right folder** — no
central registry to edit:

- **Plugins** (`lua/manager/init.lua` → `get_specs()`): globs `lua/plugins/**/*.lua` recursively
  and converts each file path into a `{ import = "plugins.<dotted.path>" }` spec. The directory
  tree under `lua/plugins/` (`lsp/`, `ui/`, `languages/`, etc.) is **purely organizational and
  carries no semantic meaning** — every `.lua` file anywhere under it is loaded. Each file must
  `return` a lazy.nvim spec: either a single spec table or a list of spec tables.
- **Config & commands** (`lua/config/init.lua`, `lua/commands/init.lua`): each globs its own
  directory and `require`s every sibling `.lua` except `init.lua`. `lua/config/` holds editor
  options (`set.lua`) and global keymaps (`remaps.lua`); `lua/commands/` holds `nvim_create_user_command` definitions.
- **Autocmds** (`lua/autocmds/init.lua`): a single file required directly (not a dir-globber).

### Shared helpers (`lua/functions/`)
Plain modules returning an `M` table, required by name (e.g. `require("functions.format")`):
`background.lua` (transparent-bg highlight groups) and `format.lua` (conform-or-LSP formatter).

### Plugin spec conventions
- A **lone string** inside a spec table (the first positional value, or an entry in
  `dependencies`) is lazy.nvim shorthand for a **`owner/repo` source**, resolved against GitHub
  by default — e.g. `"oxfist/night-owl.nvim"`, `"nvim-lua/plenary.nvim"`. It identifies a user
  and one of their repositories on a code-hosting site (GitHub / GitLab / etc.).
- A **full URL** string is used when the host must be explicit or isn't the default
  — e.g. `"https://github.com/benlubas/molten-nvim"` (see `lua/plugins/languages/python/molten.lua`).
- Colorscheme specs set `name = "..."` so the theme can be selected by a stable name regardless of
  the repo name (the master list of available scheme names lives in the unused `local _` table in
  `init.lua`).

### LSP / completion / formatting stack (`lua/plugins/lsp/`)
- `lsp.lua` — the core: `lsp-zero` + `nvim-cmp` + `LuaSnip`. Servers are turned on with a single
  `vim.lsp.enable({ ... })` list; per-server overrides use `vim.lsp.config("<name>", { ... })`.
  LSP keymaps (`gd`, `K`, `<leader>ca`, `<leader>rn`, …) are defined in the `lsp_attach` callback.
- `mason.lua` — `mason` + `mason-lspconfig` (relies on `automatic_installation`; the
  `ensure_installed` list is mostly commented out). `mason-null-ls` is `enabled = false`.
- `conform.lua` — formatters per filetype (the source of truth for formatting).
- `null-ls.lua` (none-ls) — extra diagnostics/code-actions; only loaded via the disabled
  mason-null-ls spec, so effectively dormant.

### Treesitter
Parsers are managed by `tree-sitter-manager.nvim` (`lua/plugins/syntax/`), which is gated behind
`cond = tree-sitter CLI is on PATH` and uses `auto_install`. Folding is treesitter-based
(`foldexpr = v:lua.vim.treesitter.foldexpr()`).

## Gotchas
- **Leader keys:** `mapleader` is space, `maplocalleader` is `\`. Both are set in a single place —
  the top of `init.lua`, before `require("manager")` (and therefore before `lazy.setup` evaluates
  any plugin spec).
- **Python provider:** `set.lua` points `python3_host_prog` at `~/.virtualenvs/neovim/bin/python3`;
  molten uses the `python3` kernel.
- **Indentation is inconsistent** across files (config/manager files use 4 spaces; many plugin
  files use tabs, stylua's default). Match the file you're editing rather than the repo as a whole.

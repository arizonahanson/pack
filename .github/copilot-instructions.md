# Copilot Instructions

## Repository Overview

This is a dotfiles repository with an integrated management tool called **topaz**. The repo has two distinct parts:

- `topaz/` — the tool itself (POSIX shell), wraps GNU stow with conflict handling, file adoption, and cross-platform package management
- `packages/` — stow packages (zsh, vim, tmux, bspwm, freebsd) whose contents mirror `$HOME` and are symlinked into place

## Tool Architecture

`topaz/bin/topaz` is the entry point. It sources modular libraries from `topaz/lib/`:

- `util.sh` — logging, colors, portable `resolve_path`, interactive prompts
- `platform.sh` — OS detection (`uname -s`) and package manager identification (apt/brew/pkg/dnf/pacman)
- `link.sh` — stow wrapping with dry-run conflict detection, status reporting
- `adopt.sh` — moves unmanaged files into packages, replaces them with symlinks
- `pkg.sh` — reads `pkgs` map file, installs platform-appropriate packages

## Key Conventions

- **POSIX shell only** — no bash/zsh-isms. All scripts must run under `sh`, `dash`, or FreeBSD's `/bin/sh`. Avoid `readlink -f` (not available on stock macOS) — use the `resolve_path` helper instead.
- **Cross-platform**: Linux (apt/dnf/pacman), macOS (brew), FreeBSD (pkg). Test changes against all three where possible.
- **`pkgs` format**: tab/space-delimited columns: `name  apt  brew  pkg`. Use `--` for unavailable packages.
- **`.topazrc.d/` convention**: Packages drop shell fragments into `.topazrc.d/` for runtime config. Numeric prefixes control load order (e.g., `00-zsh.sh`).
- **Unified color palette**: The same 16-color scheme is used across `.Xresources`, `.alacritty.toml`, `freebsd/loader.conf`, zsh syntax highlighting, vim syntax, and tmux/bspwm borders. Update all locations when modifying colors.
- **Vi keybindings everywhere**: zsh (`bindkey -v`), tmux (`mode-keys vi`), vim. Maintain this consistency.
- **Plugin managers**: Antigen for zsh, vim-plug for vim. No plugin manager for tmux.
- **EditorConfig**: 2-space indent, UTF-8, LF endings, trim trailing whitespace. Makefiles use tabs.

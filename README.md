# topaz

Dotfiles manager — wraps GNU stow with conflict handling, file adoption, and cross-platform package installation.

## Usage

```sh
topaz/bin/topaz link <package...>        # Symlink packages into $HOME
topaz/bin/topaz unlink <package...>      # Remove symlinks
topaz/bin/topaz adopt <file> <package>   # Move a file into a package
topaz/bin/topaz status [<package>]       # Show link status
topaz/bin/topaz install [<package...>]   # Install system packages
topaz/bin/topaz list                     # List available packages
```

## Quick Start

```sh
./install.sh
```

This links the `zsh` package and tells you to source `$HOME/.packrc.sh` in your `.zshrc`.

## Layout

- `topaz/` — the tool (POSIX shell)
- `packages/` — dotfile stow packages (zsh, vim, tmux, bspwm, freebsd)
- `pkgs` — cross-platform package map

## Requirements

- GNU stow (`brew install stow` on macOS, `pkg install stow` on FreeBSD)
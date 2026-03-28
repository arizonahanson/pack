#!/bin/sh
# Bootstrap topaz: link the topaz runtime, then link zsh config.

set -e

_resolve() {
  _t="$1"
  while [ -L "$_t" ]; do
    _d="$(cd "$(dirname "$_t")" && pwd)"
    _t="$(readlink "$_t")"
    case "$_t" in /*) ;; *) _t="$_d/$_t" ;; esac
  done
  _d="$(cd "$(dirname "$_t")" && pwd)"
  printf '%s/%s\n' "$_d" "$(basename "$_t")"
}

TOPAZ_ROOT="$(dirname "$(_resolve "$0")")"
TOPAZ="$TOPAZ_ROOT/topaz/bin/topaz"

# Link the zsh package (includes shell config fragments)
"$TOPAZ" link zsh

echo 'add `source $HOME/.packrc.sh` to your $HOME/.zshrc'

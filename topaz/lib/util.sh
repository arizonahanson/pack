#!/bin/sh
# topaz/lib/util.sh — shared helpers

# Colors (disabled if not a terminal)
if [ -t 1 ]; then
  _C_RED='\033[31m'
  _C_GREEN='\033[32m'
  _C_YELLOW='\033[33m'
  _C_BLUE='\033[34m'
  _C_BOLD='\033[1m'
  _C_RESET='\033[0m'
else
  _C_RED='' _C_GREEN='' _C_YELLOW='' _C_BLUE='' _C_BOLD='' _C_RESET=''
fi

log_info()  { printf "${_C_BLUE}::${_C_RESET} %s\n" "$*"; }
log_ok()    { printf "${_C_GREEN}::${_C_RESET} %s\n" "$*"; }
log_warn()  { printf "${_C_YELLOW}::${_C_RESET} %s\n" "$*" >&2; }
log_error() { printf "${_C_RED}::${_C_RESET} %s\n" "$*" >&2; }
die()       { log_error "$@"; exit 1; }

# Portable readlink -f (works on macOS without coreutils)
resolve_path() {
  _target="$1"
  # resolve symlinks
  while [ -L "$_target" ]; do
    _dir="$(cd "$(dirname "$_target")" && pwd)"
    _target="$(readlink "$_target")"
    case "$_target" in
      /*) ;;
      *)  _target="$_dir/$_target" ;;
    esac
  done
  _dir="$(cd "$(dirname "$_target")" && pwd)"
  printf '%s/%s\n' "$_dir" "$(basename "$_target")"
}

# Interactive prompt: prompt_choice "message" "choices" default
# choices is a string like "b/s/a/q"
# returns the chosen character in $REPLY
prompt_choice() {
  _msg="$1"
  _choices="$2"
  _default="$3"
  while true; do
    printf "${_C_BOLD}%s${_C_RESET} [%s] " "$_msg" "$_choices" >&2
    read -r REPLY </dev/tty || REPLY="$_default"
    REPLY="$(printf '%s' "$REPLY" | tr '[:upper:]' '[:lower:]')"
    [ -z "$REPLY" ] && REPLY="$_default"
    # validate
    case "$_choices" in
      *"$REPLY"*) return 0 ;;
    esac
    printf "  invalid choice: %s\n" "$REPLY" >&2
  done
}

# Check if a command exists
has_cmd() { command -v "$1" >/dev/null 2>&1; }

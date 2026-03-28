#!/bin/sh
# topaz/lib/adopt.sh — adopt unmanaged files into packages

topaz_adopt() {
  _file="$1"
  _pkg="$2"

  if [ -z "$_file" ] || [ -z "$_pkg" ]; then
    die "usage: topaz adopt <file> <package>"
  fi

  # resolve to absolute path
  case "$_file" in
    /*) ;;
    *)  _file="$(cd "$(dirname "$_file")" && pwd)/$(basename "$_file")" ;;
  esac

  if [ ! -e "$_file" ]; then
    die "file not found: $_file"
  fi

  if [ -L "$_file" ]; then
    die "already a symlink: $_file"
  fi

  _pkg_dir="$TOPAZ_PACKAGES/$_pkg"
  if [ ! -d "$_pkg_dir" ]; then
    die "package not found: $_pkg (create $TOPAZ_PACKAGES/$_pkg/ first)"
  fi

  # compute relative path from $HOME
  case "$_file" in
    "$HOME"/*)
      _rel="${_file#"$HOME"/}"
      ;;
    *)
      die "file must be inside \$HOME: $_file"
      ;;
  esac

  _dest="$_pkg_dir/$_rel"

  if [ -e "$_dest" ]; then
    die "already exists in package: $_dest"
  fi

  # move file into the package
  mkdir -p "$(dirname "$_dest")"
  mv "$_file" "$_dest" || die "failed to move file"
  log_ok "moved $_rel into $_pkg"

  # link the package to create the symlink
  topaz_link_one "$_pkg"
}

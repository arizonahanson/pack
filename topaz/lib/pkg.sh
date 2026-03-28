#!/bin/sh
# topaz/lib/pkg.sh — cross-platform package installation

# pkgs file format (tab or space delimited):
#   # name    apt       brew      pkg
#   git       git       git       git
#   terminal  alacritty --        alacritty
#
# Use -- to mark a package as unavailable on a platform.

_get_pkg_column() {
  case "$TOPAZ_PKG_MGR" in
    apt)    echo 2 ;;
    dnf)    echo 2 ;;
    pacman) echo 2 ;;
    brew)   echo 3 ;;
    pkg)    echo 4 ;;
    *)      echo 0 ;;
  esac
}

topaz_install() {
  _pkgs_file="$TOPAZ_ROOT/pkgs"

  if [ ! -f "$_pkgs_file" ]; then
    die "package map not found: $_pkgs_file"
  fi

  detect_platform

  if [ -z "$TOPAZ_PKG_MGR" ]; then
    die "no supported package manager found on $TOPAZ_OS"
  fi

  _col="$(_get_pkg_column)"
  if [ "$_col" -eq 0 ]; then
    die "unsupported package manager: $TOPAZ_PKG_MGR"
  fi

  # collect packages to install
  _to_install=""
  _filter="$*"

  while IFS= read -r _line; do
    # skip comments and blank lines
    case "$_line" in
      '#'*|'') continue ;;
    esac

    _name="$(echo "$_line" | awk '{print $1}')"
    _pkg_name="$(echo "$_line" | awk -v col="$_col" '{print $col}')"

    # skip unavailable packages
    [ "$_pkg_name" = "--" ] && continue
    [ -z "$_pkg_name" ] && continue

    # if specific packages requested, filter
    if [ -n "$_filter" ]; then
      _match=false
      for _f in $_filter; do
        [ "$_name" = "$_f" ] && _match=true
      done
      $_match || continue
    fi

    _to_install="$_to_install $_pkg_name"
  done < "$_pkgs_file"

  if [ -z "$_to_install" ]; then
    log_warn "no packages to install"
    return 0
  fi

  log_info "installing via $TOPAZ_PKG_MGR:$_to_install"
  # shellcheck disable=SC2086
  $TOPAZ_PKG_INSTALL $_to_install
}

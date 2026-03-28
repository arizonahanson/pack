#!/bin/sh
# topaz/lib/link.sh — stow wrapping with conflict detection

_stow_cmd() {
  stow -d "$TOPAZ_PACKAGES" -t "$HOME" "$@"
}

# Run stow dry-run and collect conflicting file paths
_stow_dryrun() {
  _stow_cmd --no --verbose=2 "$@" 2>&1 | \
    grep '^\s*\* existing target' | \
    sed 's/.*: //'
}

# Link a single package with interactive conflict resolution
topaz_link_one() {
  _pkg="$1"
  _pkg_dir="$TOPAZ_PACKAGES/$_pkg"

  if [ ! -d "$_pkg_dir" ]; then
    log_error "package not found: $_pkg"
    return 1
  fi

  log_info "linking $_pkg..."

  # detect conflicts via dry-run
  _conflicts="$(_stow_dryrun "$_pkg")"

  if [ -n "$_conflicts" ]; then
    _skip_all=false
    _abort=false

    printf '%s\n' "$_conflicts" | while IFS= read -r _file; do
      [ -z "$_file" ] && continue
      _target="$HOME/$_file"

      printf "  ${_C_YELLOW}conflict:${_C_RESET} %s\n" "$_file" >&2

      prompt_choice "  (b)ackup, (s)kip, (a)dopt, (q)uit?" "b/s/a/q" "s"
      case "$REPLY" in
        b)
          _backup="${_target}.topaz-backup"
          mv "$_target" "$_backup"
          log_ok "  backed up to ${_backup##*/}"
          ;;
        s)
          log_warn "  skipped"
          ;;
        a)
          # adopt: pull existing file into the package
          _dest="$_pkg_dir/$_file"
          mkdir -p "$(dirname "$_dest")"
          mv "$_target" "$_dest"
          log_ok "  adopted into $_pkg"
          ;;
        q)
          log_warn "aborted"
          return 1
          ;;
      esac
    done

    # check if the subshell aborted
    if [ $? -ne 0 ]; then
      return 1
    fi
  fi

  # run stow for real
  if _stow_cmd "$_pkg" 2>&1; then
    log_ok "linked $_pkg"
  else
    log_error "failed to link $_pkg"
    return 1
  fi
}

topaz_link() {
  for _pkg in "$@"; do
    topaz_link_one "$_pkg" || return 1
  done
}

topaz_unlink() {
  for _pkg in "$@"; do
    _pkg_dir="$TOPAZ_PACKAGES/$_pkg"
    if [ ! -d "$_pkg_dir" ]; then
      log_error "package not found: $_pkg"
      return 1
    fi
    log_info "unlinking $_pkg..."
    if _stow_cmd -D "$_pkg" 2>&1; then
      log_ok "unlinked $_pkg"
    else
      log_error "failed to unlink $_pkg"
      return 1
    fi
  done
}

topaz_status() {
  _filter="${1:-}"

  for _pkg_dir in "$TOPAZ_PACKAGES"/*/; do
    _pkg="$(basename "$_pkg_dir")"
    [ -n "$_filter" ] && [ "$_pkg" != "$_filter" ] && continue

    _counts="$(_count_package_status "$_pkg_dir")"
    _total="$(echo "$_counts" | cut -d' ' -f1)"
    _linked="$(echo "$_counts" | cut -d' ' -f2)"
    _conflicts="$(echo "$_counts" | cut -d' ' -f3)"

    if [ "$_total" -eq 0 ]; then
      printf "  %-16s ${_C_YELLOW}empty${_C_RESET}\n" "$_pkg"
    elif [ "$_linked" -eq "$_total" ]; then
      printf "  %-16s ${_C_GREEN}linked${_C_RESET}\n" "$_pkg"
    elif [ "$_linked" -gt 0 ]; then
      printf "  %-16s ${_C_YELLOW}partial${_C_RESET} (%d/%d" "$_pkg" "$_linked" "$_total"
      [ "$_conflicts" -gt 0 ] && printf ", %d conflicts" "$_conflicts"
      printf ")\n"
    elif [ "$_conflicts" -gt 0 ]; then
      printf "  %-16s ${_C_RED}conflicts${_C_RESET} (%d)\n" "$_pkg" "$_conflicts"
    else
      printf "  %-16s not linked\n" "$_pkg"
    fi
  done
}

_count_package_status() {
  _pkg_dir="$1"
  _total=0
  _linked=0
  _conflicts=0

  for _src in $(find "$_pkg_dir" -type f -not -name '.keep'); do
    _rel="${_src#"$_pkg_dir"}"
    _target="$HOME/$_rel"
    _total=$((_total + 1))

    if [ -L "$_target" ]; then
      _link_dest="$(readlink "$_target")"
      case "$_link_dest" in
        *"$_rel")
          _linked=$((_linked + 1))
          ;;
        *)
          _conflicts=$((_conflicts + 1))
          ;;
      esac
    elif [ -e "$_target" ]; then
      _conflicts=$((_conflicts + 1))
    fi
  done

  printf '%d %d %d\n' "$_total" "$_linked" "$_conflicts"
}

topaz_list() {
  log_info "available packages:"
  for _pkg_dir in "$TOPAZ_PACKAGES"/*/; do
    printf "  %s\n" "$(basename "$_pkg_dir")"
  done
}

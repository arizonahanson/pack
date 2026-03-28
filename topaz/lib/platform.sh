#!/bin/sh
# topaz/lib/platform.sh — OS and package manager detection

detect_platform() {
  TOPAZ_OS="$(uname -s)"
  case "$TOPAZ_OS" in
    Linux)
      if has_cmd apt-get; then
        TOPAZ_PKG_MGR="apt"
        TOPAZ_PKG_INSTALL="sudo apt-get install -y"
      elif has_cmd dnf; then
        TOPAZ_PKG_MGR="dnf"
        TOPAZ_PKG_INSTALL="sudo dnf install -y"
      elif has_cmd pacman; then
        TOPAZ_PKG_MGR="pacman"
        TOPAZ_PKG_INSTALL="sudo pacman -S --noconfirm"
      else
        TOPAZ_PKG_MGR=""
        TOPAZ_PKG_INSTALL=""
      fi
      ;;
    Darwin)
      if has_cmd brew; then
        TOPAZ_PKG_MGR="brew"
        TOPAZ_PKG_INSTALL="brew install"
      else
        TOPAZ_PKG_MGR=""
        TOPAZ_PKG_INSTALL=""
      fi
      ;;
    FreeBSD)
      if has_cmd pkg; then
        TOPAZ_PKG_MGR="pkg"
        TOPAZ_PKG_INSTALL="sudo pkg install -y"
      else
        TOPAZ_PKG_MGR=""
        TOPAZ_PKG_INSTALL=""
      fi
      ;;
    *)
      TOPAZ_PKG_MGR=""
      TOPAZ_PKG_INSTALL=""
      ;;
  esac
}

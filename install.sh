#!/bin/sh

PACK_DIR="$(dirname "$0")"

"$PACK_DIR/pack/bin/pack" pack zsh
echo 'add `source $HOME/.packrc.sh` to your $HOME/.zshrc'

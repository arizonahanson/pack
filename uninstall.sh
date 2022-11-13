#!/bin/sh

PACK_DIR="$(dirname "$(readlink -f "$0")")"

"$PACK_DIR/pack/bin/pack" -D zsh pack
echo 'remove `source $HOME/.packrc.sh` from your $HOME/.zshrc'

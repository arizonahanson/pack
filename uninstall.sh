#!/bin/sh

PACK_DIR="$(dirname "$(readlink -f "$0")")"

"$PACK_DIR/pack/bin/pack" -D $(cat "$PACK_DIR/.packs")
echo 'remove `source $HOME/.packrc.sh` from your $HOME/.zshrc'

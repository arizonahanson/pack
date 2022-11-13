#!/bin/sh

PACK_DIR="$(dirname "$(readlink -f "$0")")"

"$PACK_DIR/pack/bin/pack" pack

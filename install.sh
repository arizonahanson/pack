#!/bin/sh
# Bootstrap topaz: link the zsh package into $HOME.

set -e

cd "$(dirname "$0")"

./topaz/bin/topaz link zsh

echo 'add `source $HOME/.packrc.sh` to your $HOME/.zshrc'

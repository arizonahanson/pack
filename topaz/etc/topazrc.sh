setopt NULL_GLOB
if [ -e "$HOME/.topazrc.d" ]; then
  for psh in "$HOME/.topazrc.d/"*.sh; do
    source "$psh"
  done
fi
unsetopt NULL_GLOB

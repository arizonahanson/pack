if [ -e "$HOME/.packrc.d" ]; then
  for psh in "$HOME/.packrc.d/"*.sh; do
    source "$psh"
  done
fi

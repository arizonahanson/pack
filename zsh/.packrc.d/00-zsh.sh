# Only execute this file once per interactive shell.
if [ -n "$__ZSH_SOURCED" ]; then return; fi
__ZSH_SOURCED=1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=8999
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# antigen
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} ma='48;5;7;38;5;11'

source "$HOME/.antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen apply

setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
# spellcheck commands
setopt correct
# turn off completion beeps
unsetopt LIST_BEEP
# vi-like editing
bindkey -v
# backspace
bindkey -a '^?' vi-backward-delete-char
# home
bindkey -a '\e[1~' vi-first-non-blank
bindkey '\e[1~' vi-first-non-blank
# insert
bindkey -a '\e[2~' vi-insert
bindkey '\e[2~' vi-insert # noop?
# delete
bindkey '\e[3~' vi-delete-char
bindkey -a '\e[3~' vi-delete-char
# end
bindkey -a '\e[4~'  vi-end-of-line
bindkey '\e[4~'  vi-end-of-line
bindkey  "${terminfo[khome]}" vi-beginning-of-line
bindkey -a "${terminfo[khome]}" vi-beginning-of-line
bindkey  "${terminfo[kend]}" vi-end-of-line
bindkey -a "${terminfo[kend]}" vi-end-of-line
# complete word
bindkey '^w' vi-forward-word
bindkey '^ ' autosuggest-accept
# save prompt status
ZLE_RPROMPT_INDENT=0
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-line-init
zle-keymap-select () {
  if [ ! "$TERM" = "linux" ]; then
    if [ $KEYMAP = vicmd ]; then
      echo -ne "\e[1 q"
    else
      if [[ $ZLE_STATE == *insert* ]]; then
        echo -ne "\e[5 q"
      else
        echo -ne "\e[3 q"
      fi
    fi
  fi
  () { return $__prompt_status }
  zle reset-prompt
}
zle -N zle-keymap-select
precmd() {
  if [ ! "$TERM" = "linux" ]; then
    echo -ne "\e[5 q"
  fi
}

source "$HOME/.zsh_aliases"

#!/usr/bin/env zsh
# Only execute this file once per interactive shell.
if [ -n "$__ZSH_SOURCED" ]; then return; fi
__ZSH_SOURCED=1

EDITOR=vim
TERM=xterm-256color
# history
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=8999
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt correct
unsetopt LIST_BEEP

export GREP_COLORS="mt=38;5;3:sl=:cx=:fn=38;5;4:ln=38;5;8:bn=38;5;5:se=38;5;7"
export GREP_COLOR="1;35;47"
export KEYTIMEOUT="1"
export LESS="-erFX"

# compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} ma='47;30'

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
bindkey '^k' vi-forward-word
bindkey '^e' vi-end-of-line
# save prompt status
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

# antigen
source "$HOME/.antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# zsh-syntax-highlighting
ZLE_RPROMPT_INDENT=2
export ZSH_HIGHLIGHT_STYLES[cursor]='fg=8'
export ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=9'
export ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
export ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
export ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=9'
export ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=12'
export ZSH_HIGHLIGHT_STYLES[globbing]='fg=12'
export ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=11'
export ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=11'
export ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
export ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan'
export ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
export ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=8'
export ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=8'
export ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
export ZSH_HIGHLIGHT_STYLES[precommand]='fg=9'
export ZSH_HIGHLIGHT_STYLES[command]='fg=green'
export ZSH_HIGHLIGHT_STYLES[builtin]='fg=12'
export ZSH_HIGHLIGHT_STYLES[redirection]='fg=10'
export ZSH_HIGHLIGHT_STYLES[arg0]='fg=10'
export ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=10'
export ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=10'
export ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=13'
export ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=13'
export ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
export ZSH_HIGHLIGHT_STYLES[default]='fg=0'

# zsh-auto-suggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
export ZSH_AUTOSUGGEST_STRATEGY=("match_prev_cmd" "history")
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=vi-forward-char

# theme
PROMPT="%(?.%F{green}.%F{red})%#%f "

ZSH_THEME_PWD='%F{blue}%3~%f'
ZSH_THEME_GIT_PROMPT_PREFIX='%F{magenta} '
ZSH_THEME_GIT_PROMPT_DIRTY='%f%F{yellow}*'
ZSH_THEME_GIT_PROMPT_CLEAN=''
ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
RPROMPT=" ${ZSH_THEME_PWD}\$(git_prompt_info)"

source "$HOME/.zsh_aliases"

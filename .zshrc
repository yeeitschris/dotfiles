	################
# ~/.zshrc
################

# --------- General ---------
export ZDOTDIR="$HOME"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# ---------- Prompt ----------
autoload -Uz compinit
compinit

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias cl='clear'

alias gs='git status'
alias ga='git add'
alias gc='git checkout'
alias gp='git push'
alias gb='git branch'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ---------- Starship ----------
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

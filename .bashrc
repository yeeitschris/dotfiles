#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
set -o vi

# ~~~~~~~~~~ Environment Variables ~~~~~~~~~~
# neovim
export VISUAL=nvim
export EDITOR=nvim

# browser
export BROWSER="firefox"

# directories
export XDG_CONFIG_HOME="$HOME/.config"
export REPOS="$HOME/Repos"
export GITUSER="yeeitschris"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"

# ~~~~~~~~~~ History ~~~~~~~~~~
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

# ~~~~~~~~~~ Aliases ~~~~~~~~~~
alias v=nvim

# cd
alias ..="cd .."
alias scripts="cd $SCRIPTS"
alias dot="cd $GHREPOS/dotfiles"
alias repos="cd $REPOS"
alias c="clear"

# ls
alias ls="ls --color=auto"
alias ll="ls -la"
alias la="ls -lathr"

# finds all files recursively and sorts by last modification, ignore hidden files
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias sv='sudoedit'
alias t='tmux'
alias e='exit'

# git
alias gp='git pull'
alias gs='git status'

# ricing
alias eb='v ~/.bashrc'
alias ev='cd ~/.config/nvim/ && v init.lua'
alias sbr='source ~/.bashrc'

# Only needed for npm install on WSL
#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

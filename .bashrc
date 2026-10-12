#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
set -o vi

# ~~~~~~~~~~ Environment Variables ~~~~~~~~~~
# editor
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# browser
export BROWSER="firefox"

# directories
export XDG_CONFIG_HOME="$HOME/.config"
export REPOS="$HOME/repos"
export GITUSER="yeeitschris"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"

# ~~~~~~~~~~ History ~~~~~~~~~~
export HISTFILE=~/.histfile
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoreboth   # ignore dups + commands starting with a space
export HISTTIMEFORMAT="%F %T "  # timestamps, like zsh EXTENDED_HISTORY
shopt -s histappend
# write + reload history every prompt so sessions share it (zsh SHARE_HISTORY)
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# ~~~~~~~~~~ Aliases ~~~~~~~~~~
# alias v=nvim

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias scripts="cd $SCRIPTS"
alias dot="cd $GHREPOS/dotfiles"
alias repos="cd $REPOS"
alias c="clear"
alias cl="clear"

# ls
alias ls="ls --color=auto"
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

# finds all files recursively and sorts by last modification, ignore hidden files
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias sv='sudoedit'
alias t='tmux'
alias e='exit'

# git
alias gs='git status'
alias ga='git add'
alias gc='git checkout'
alias gp='git push'
alias gb='git branch'

# claude from root
alias notes='cd ~/Notes/Obsidian/yeeitsvault && claude'

# ricing
alias eb='v ~/.bashrc'
alias ev='cd ~/.config/nvim/ && v init.lua'
alias sbr='source ~/.bashrc'

# Add homebrew to PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ~~~~~~~~~~ Completion ~~~~~~~~~~
if ! shopt -oq posix && [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# ~~~~~~~~~~ Vanilla bashrc settings ~~~~~~~~~~
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ~~~~~~~~~~ Machine-local overrides (not tracked) ~~~~~~~~~~
[ -f ~/.bashrc.local ] && . ~/.bashrc.local

# ~~~~~~~~~~ Starship (must be last; overrides PS1 above) ~~~~~~~~~~
command -v starship >/dev/null && eval "$(starship init bash)"

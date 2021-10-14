# ~/.bashrc: executed by bash(1) for non-login shells.
echo $(tput setaf 15)$(tput bold)$(fortune) | sed 's/-- /\n    -- /'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$TERM" != "xterm-256color" ]; then
    export TERM=xterm-256color
fi

export TERM=xterm-256color
# Set Vim as my default editor
export EDITOR=vim

# display branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;94m\]\u\[\033[01;97m\]@\[\033[01;33m\]\h \[\033[01;32m\]\W \[\033[01;31m\]$(parse_git_branch)\[\033[01;97m\]-> \[\033[00m\]'
#PS1='${debian_chroot:+($debian_chroot)}\e[0;33;1m\u\e[0;97;1m@\e[0;33;1m\h\e[0;32;1m \W \e[0;97;1m-> \e[m'
#PS1='$(tput bold)\n$(tput setaf 209)\u$(tput setaf 15)@$(tput setaf 221)\h $(tput setaf 035)\w$(tput setaf 161)$(parse_git_branch) $(tput setaf 15)-> '
export PS1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_DIR_HOME_BACKGROUND='033'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='033'
POWERLEVEL9K_DIR_ETC_BACKGROUND='033'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='033'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='177'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv dir vcs)
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=false

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   zsh-autosuggestions
   docker
   history
)

source $ZSH/oh-my-zsh.sh
export EDITOR=vim

### GLOBAL ###
export GPG_TTY=$(tty)

### PYENV ###
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init --path)"
fi

### JENV ###
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# added by Snowflake SnowSQL installer
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

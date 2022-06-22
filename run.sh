#!/bin/sh

set -e
set -u
set -x


#############################################
############## MAC OSX SETUP ################
#############################################
# Install Command Line Tools
if [[ $(command -v xcode-select) == "" ]]
then
    echo "Installing CLT"
    xcode-select --install
else
    echo "CLT already installed"
fi
# If you get an error, run xcode-select -r to reset xcode-select

# Install Homebrew 
if [[ $(command -v brew) == "" ]]
then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi

# Iterm2
if [ ! -d '/Applications/iTerm.app' -a ! -d "$HOME/Applications/iTerm.app" ]
then
    echo 'Installing Iterm2'
    brew install --cask iterm2
else
    echo 'iTerm is already installed'
fi

# GPG
if [[ $(command -v gpg) == "" ]]
then
    echo "Installing GPG suite"
    brew install gnupg
fi

#############################################
#################### ZSH ####################
#############################################
# Zsh
if [[ $(command -v zsh) == "" ]] || [[ $(command -v zsh) != '/usr/local/bin/zsh' ]]
then
    echo "Installing zsh"
    brew install zsh
fi

if [[ $SHELL != $(which zsh) ]] && [[ $(which zsh) == '/usr/local/bin/zsh' ]]
then
    echo "Set zsh as default shell"
    sudo sh -c "echo $(which zsh) >> /etc/shells"
    chsh -s $(which zsh)
fi

if [ -f ~/.zshrc.bak ]
then
    rm ~/.zshrc.bak
fi
if [ -f ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.bak
fi

if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    $ZSH/tools/upgrade.sh
fi

# Install fonts
git clone https://github.com/powerline/fonts.git ~/fonts/
sh ~/fonts/install.sh
rm -rf ~/fonts

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]
then
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi

ln -sf $(pwd)/.zshrc ~/.zshrc

# #############################################
# ################### GIT #####################
# #############################################

if [[ $(command -v git) == "" ]]
then
    echo "Installing GIT"
    brew install git
fi

git config --global alias.c 'commit'
git config --global alias.co 'checkout'
git config --global alias.s 'status'
git config --global alias.pra 'git pull --rebase --autostash'
git config --global alias.ap 'add -p'
git config --global user.email "jonathan.chansin@clinia.com"
git config --global user.name "CHANSIN Jonathan"
git config --global credential.helper osxkeychain

ln -sf $(pwd)/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

git config --global commit.gpgsign true

#############################################
################### PYENV ###################
#############################################

if [ ! -d ~/.pyenv ]
then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi
~/.pyenv/bin/pyenv install 3.8.10
~/.pyenv/bin/pyenv global 3.8.10

# Install poetry
pip install poetry

#############################################
#################### VIM ####################
#############################################

if [ -f ~/.vimrc.bak ]
then
    rm ~/.vimrc.bak
fi
if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.bak
fi
if [ -d ~/.vim/bundle/Vundle.vim ]
then
    rm -rf ~/.vim/bundle/Vundle.vim
fi
if [ ! -d ~/.vim/colors ]
then
    mkdir -p ~/.vim/colors
fi

if [ -d ~/.vim/snippets ]
then
    rm -r ~/.vim/snippets
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $(pwd)/.vimrc ~/.vimrc

#############################################
################### TMUX ####################
#############################################

if [ ! -d ~/.tmux/ ];
then
    mkdir -p ~/.tmux/plugins/
fi

if [ ! -d ~/.tmux/plugins/tpm ];
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -f ~/.tmux.conf.bak ]
then
    rm ~/.tmux.conf.bak
fi
if [ -f ~/.tmux.conf ]
then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -s $(pwd)/.tmux.conf ~/.tmux.conf


#############################################
################### AWS-CLI #################
#############################################
if [[ $(command -v aws) == "" ]]
then
    brew install awscli
fi
if [[ $(command -v aws-vault) == "" ]]
then
    brew install --cask aws-vault
fi

#############################################
################### JAVA ####################
#############################################
if [[ $(command -v java) == "" ]]
then
    brew install java
    brew install openjdk@8
fi

if [[ $(command -v jenv) == "" ]]
then
    git clone https://github.com/jenv/jenv.git ~/.jenv
    sudo ln -sfn /usr/local/opt/java/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    jenv add /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home/

    sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
    jenv add /Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home/
fi

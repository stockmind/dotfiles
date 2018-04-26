#!/usr/bin/env bash

# Prompt for developers tools install (git, etc...)
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew update
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Install: $line"
    brew install $line
done < brewfile

brew tap caskroom/cask
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Install cask: $line"
    brew cask install $line
done < brewcaskfile

# Complete install of python3 for pip
brew postinstall python3

# Download scotch-box-pro vagrant file
git clone https://github.com/stockmind/scotch-box-pro ~/scotch-box-pro

# Install fsnotify plugin for vagrant 
vagrant plugin install vagrant-fsnotify

# Install nerd fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# Install oh-my-zsh
echo "##### TYPE 'exit' IN ZSH SHELL TO CONTINUE INSTALL ######"
read -p "Press any key..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Copy .zshrc
cp .zshrc ~/.zshrc

# Install Vundle for Vim plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vimrc
cp .vimrc ~/.vimrc

# Uncomment to install OneDrive client from AppStore
#mas install 823766827
# Install WhatsApp Desktop from App Store
mas install 1147396723


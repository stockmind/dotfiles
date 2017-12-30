#!/usr/bin/env bash

# Prompt for developers tools install (git, etc...)
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew update
brew install $(< brewfile)
brew tap caskroom/cask
brew cask install $(< brewcaskfile)

# Complete install of python3 for pip
brew postinstall python3

# Download scotch-box-pro vagrant file
git clone https://github.com/scotch-io/scotch-box-pro.git ~/scotch-box-pro

# Install nerd fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
cd ..
rm -dfr nerd-fonts/

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


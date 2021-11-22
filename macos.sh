#!/usr/bin/env bash

# Prompt for developers tools install (git, etc...)
xcode-select --install

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages
brew update
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Install: $line"
    brew install $line
done < brewfile

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Install cask: $line"
    brew install --cask $line
done < brewcaskfile

pip3 install Pygments

# Install nerd fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Install oh-my-zsh
echo "##### TYPE 'exit' IN ZSH SHELL TO CONTINUE INSTALL ######"
read -p "Press any key..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy .zshrc
cp .zshrc ~/.zshrc

# Install Vundle for Vim plugin management
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vimrc
#cp .vimrc ~/.vimrc

# Uncomment to install OneDrive client from AppStore
# mas install 823766827
# Install WhatsApp Desktop from App Store
mas install 1147396723
# Amphetamine
mas install 937984704
# Magnet
# mas install 441258766

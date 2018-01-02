#!/usr/bin/env bash

# Install essential tools
sudo apt update 
sudo apt -y install git curl wget build-essential python3 python3-pip zsh

pip3 install thefuck

# Install multimedia tools/plugin and utilities
sudo apt -y install va-driver-all libva1 gstreamer1.0-libav gstreamer1.0-vaapi
sudo apt -y install vlc virtualbox

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:atareao/telegram

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update 

sudo apt -y install google-chrome-stable
sudo apt -y install sublime-text-installer
sudo apt -y install telegram-desktop

# Install nerd fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
cd ..
rm -drf nerd-fonts/

# Install oh-my-zsh
chsh -s $(which zsh)
echo "##### TYPE 'exit' IN ZSH SHELL TO CONTINUE INSTALL ######"
read -p "Press any key..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Copy .zshrc
echo "Alias and oh my zsh config folder need to be fixed"
cp .zshrc ~/.zshrc

# Install Vundle for Vim plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vimrc
cp .vimrc ~/.vimrc

echo "REMEMBER TO FIX PATH IN .zshrc"

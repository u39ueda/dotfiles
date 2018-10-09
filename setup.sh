#!/bin/bash

DOTFILES_DIR_DIR=$(pwd)

# setup anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
exec $SHELL -l
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

anyenv install ndenv
anyenv install pyenv
anyenv install rbenv
exec $SHELL -l

ndenv install v10.11.0
ndenv global v10.11.0
ndenv rehash
rbenv install 2.3.7
rbenv global 2.3.7
rbenv rehash

# setup homebrew
brew install carthage
brew install gawk
brew install gnu-sed
brew install httpie
brew install jq
brew install mono0926/license-plist/license-plist
brew install nkf
brew install nodebrew
brew install rsync
brew install swiftlint
brew install terminal-notifier
brew install tig
brew install trash
brew install unrar

brew cask install atom
brew cask install cooviewer
brew cask install dropbox
brew cask install freshback
brew cask install google-chrome
brew cask install hetimazipql
brew cask install keepassx
brew cask install libreoffice
brew cask install macwinzipper
brew cask install osxfuse
brew cask install qlstephen
brew cask install slack
brew cask install sourcetree
brew cask install stackroom
brew cask install steam
brew cask install xquartz

# setup atom
apm install --packages-file atomfile

# setup profiles
ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc
ln -sf ${DOTFILES_DIR}/.zshrc ~/.zshrc
ln -sf ${DOTFILES_DIR}/.gitignore ~/.gitignore
ln -sf ${DOTFILES_DIR}/.gitconfig ~/.gitconfig
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc
ln -sf ${DOTFILES_DIR}/.gvimrc ~/.gvimrc

# setup LaunchCtl
if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi
chmod 700 ~/bin
if [ ! -d ~/Library/LaunchAgents/ ]; then
  mkdir -p ~/Library/LaunchAgents/
fi
ln -sf ${DOTFILES_DIR}/bin/update.sh ~/bin/update.sh
ln -sf ${DOTFILES_DIR}/launchctl/localhost.auto-upgrade.plist ~/Library/LaunchAgents/localhost.auto-upgrade.plist
launchctl load -w ~/Library/LaunchAgents/localhost.auto-upgrade.plist

# setup Xcode templates
ln -sf ${DOTFILES_DIR}/Xcode/Templates ~/Library/Developer/Xcode/Templates
ln -sf ${DOTFILES_DIR}/Xcode/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets

# disable generate .DS_Store in network drive
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
# disable shadow at screen-capture
defaults write com.apple.screencapture disable-shadow -boolean true


#! /bin/bash

set -eu

DOTFILES_DIR=$(pwd)
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_AUTO_UPDATE=1

GREEN='\033[32m'
RED='\033[31m'
CLEAR='\033[m'
function notify() {
  echo -e "${GREEN}$*${CLEAR}"
}

# setup homebrew
if ! type brew > /dev/null 2>&1; then
  notify Install homebrew.
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  notify Skip Install homebrew.
fi
brew update
# setup homebrew end

# setup anyenv
if ! type anyenv > /dev/null 2>&1; then
  notify Install anyenv.
  brew install anyenv
  eval "$(anyenv init -)"
  exec $SHELL -l
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

  notify Install xxxenv
  #anyenv install ndenv
  anyenv install pyenv
  anyenv install rbenv
  exec $SHELL -l

  NODE_VERSION=v10.11.0
  PYTHON_VERSION=3.11.12
  RUBY_VERSION=3.3.3
  #ndenv install ${NODE_VERSION}
  #ndenv global ${NODE_VERSION}
  #ndenv rehash
  pyenv install ${PYTHON_VERSION}
  pyenv global ${PYTHON_VERSION}
  pyenv rehash
  rbenv install ${RUBY_VERSION}
  rbenv global ${RUBY_VERSION}
  rbenv rehash
else
  notify Skip Install anyenv.
fi
# setup anyenv end

# setup homebrew
notify Install homebrew formulaes.
#brew install carthage
brew install gawk
brew install gnu-sed
#brew install httpie
brew install jq
#brew install mono0926/license-plist/license-plist
brew install nkf
#brew install nodebrew
#brew install rsync
#brew install swiftlint
brew install terminal-notifier
brew install tig
brew install trash
#brew install unrar

#brew install dropbox
brew install google-chrome
brew install keepassxc
#brew install slack
brew install steam
#brew install xquartz
# setup homebrew end

# setup profiles
notify Setup profiles.
ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc
ln -sf ${DOTFILES_DIR}/.zshrc ~/.zshrc
mkdir -p ~/.config/git
ln -sf ${DOTFILES_DIR}/.gitignore ~/.config/git/ignore
ln -sf ${DOTFILES_DIR}/.gitconfig ~/.gitconfig
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc
ln -sf ${DOTFILES_DIR}/.gvimrc ~/.gvimrc

# setup LaunchCtl
notify Setup LaunchCtl.
if [ ! -d ~/bin ]; then
  mkdir -p ~/bin
  chmod 700 ~/bin
fi
if [ ! -d "~/Library/LaunchAgents" ]; then
  mkdir -p "~/Library/LaunchAgents"
  chmod 700 "~/Library/LaunchAgents"
fi
ln -sf ${DOTFILES_DIR}/bin/update.sh ~/bin/update.sh
cp -f ${DOTFILES_DIR}/launchctl/localhost.auto-upgrade.plist ~/Library/LaunchAgents/localhost.auto-upgrade.plist
sed -i.bk "s#<HOME_DIR>#${HOME}#" ~/Library/LaunchAgents/localhost.auto-upgrade.plist
rm -f ~/Library/LaunchAgents/localhost.auto-upgrade.plist.bk
if ! launchctl list localhost.auto-upgrade > /dev/null; then
  notify bootstrap localhost.auto-upgrade.
  launchctl bootstrap gui/${UID} ${HOME}/Library/LaunchAgents/localhost.auto-upgrade.plist
else
  notify Skip bootstrap localhost.auto-upgrade.
fi
launchctl enable gui/${UID}/localhost.auto-upgrade
# setup LaunchCtl end

# setup Xcode templates
#ln -sf ${DOTFILES_DIR}/Xcode/Templates ~/Library/Developer/Xcode/Templates
#ln -sf ${DOTFILES_DIR}/Xcode/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets

# disable generate .DS_Store in network drive
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
# disable shadow at screen-capture
defaults write com.apple.screencapture disable-shadow -boolean true


#! /bin/bash
set -eu

export PATH=$PATH:/usr/local/bin
source ~/.bashrc

GREEN='\033[32m'
RED='\033[31m'
CLEAR='\033[m'
function fatalError() {
  echo -e "$RED[$(LC_ALL=C date '+%F %T')] Failure '$1'.$CLEAR"
  terminal-notifier -title 'Auto Upgrader' -message 'Auto upgrade failed!'
  exit 1
}
function execute() {
  echo -e "$GREEN[$(date '+%F %T')] Start '$1'.$CLEAR"
  eval $1 || fatalError $1
  echo -e "$GREEN[$(date '+%F %T')] Finish '$1'.$CLEAR"
}

execute "anyenv update"
HOMEBREW_NO_EMOJI=1 execute "brew upgrade --cleanup"
execute "brew cask upgrade"
execute "gem update --system"
execute "gem update"
execute "gem clean"
terminal-notifier -title 'Auto Upgrader' -message 'Auto upgraded!'


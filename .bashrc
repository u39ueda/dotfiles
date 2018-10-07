# import from .bash_profile
export PS1="[\u \W]\$ "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export PATH=$PATH:~/bin

source ~/.dotfiles/git-completion.bash

# setup anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


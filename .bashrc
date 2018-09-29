# import from .bash_profile
export PS1="[\u \W]\$ "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export PATH=$PATH:~/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH

source ~/.dotfiles/git-completion.bash

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


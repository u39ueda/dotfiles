# import from .bash_profile
export PS1="[\u \W]\$ "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export PATH=$PATH:~/bin

# setup homebrew
case "$(arch)" in
"arm64")
  if [ -e "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  ;;
"i386")
  if [ -e "/usr/local/bin/brew" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  ;;
*) echo Unknown arch. $(arch) >&2
esac

# setup anyenv
if command -v anyenv > /dev/null 2>&1; then
  eval "$(anyenv init -)"
fi


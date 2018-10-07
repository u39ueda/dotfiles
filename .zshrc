# プロンプト(左) 
PROMPT='%F{green}[%n%F{blue}@%F{green}%m %F{yellow}%~%F{green}] $?%f
%F{green}%B%(!.#.$) %b%f'
 
# プロンプト(右) 
autoload -Uz vcs_info
setopt prompt_subst
 
# trueで作業ブランチの状態に応じて表示を変える
zstyle ':vcs_info:*' check-for-changes true
# addしてない場合の表示
zstyle ':vcs_info:*' unstagedstr "%F{red}%B+%b"
# commitしてない場合の表示
zstyle ':vcs_info:*' stagedstr "%F{yellow}!"
# デフォルトの状態の表示
zstyle ':vcs_info:*' formats "%F{green}%c%u [%b]%f"
# コンフリクトが起きたり特別な状態になるとformatsの代わりに表示
zstyle ':vcs_info:*' actionformats '[%b|%a]'
 
precmd () { vcs_info }
 
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
 
# gitコマンド補完機能セット
# autoloadの文より前に記述
fpath=(~/.zsh/completion $fpath)
 
# コマンド入力補完
# 補完機能有効にする
autoload -U compinit
compinit -u
 
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors di=36 ln=35 ex=31
 
# 単語の入力途中でもTab補完を有効化
#setopt complete_in_word
# 補完候補を矢印キーで選択
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
#setopt list_packed
 
# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [yes/no/abort/edit] => "
 
# cdを使わずにディレクトリを移動できる
#setopt auto_cd
# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
 

# ヒストリーに重複を表示しない
setopt histignorealldups
 
# 他のターミナルとヒストリーを共有
#setopt share_history
# シェルの終了を待たずにヒストリーを書き込み
setopt inc_append_history

HISTFILE=~/.zsh_history
#HISTSIZE=10000
#SAVEHIST=10000

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

# エイリアス
alias ls="ls -GF"
alias la="ls -a"
alias ll="ls -l"
alias rm="rm -i"
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | less"
 
# bindkey
 
# backspace,deleteキーを使えるように
bindkey "^[[3~" delete-char

# lsに色をつける
export LSCOLORS=gxfxcxdxbxegedabagacad

export PATH=$PATH:~/bin

# setup anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


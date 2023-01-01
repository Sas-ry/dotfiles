# Created by newuser for 5.8
# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000

# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# ディレクトリスタック
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# =================
#  prompt
# =================
__ps_git_br() {
  local exit=$?
  echo $(git current-branch 2>/dev/null)
  return $exit
}
nl=$'\n'
PROMPT="${nl}%c %{${fg[green]}%}$(__ps_git_br)%{${reset_color}%}${nl}%{%(?.${fg[cyan]}.${fg[red]})%}%#%{${reset_color}%} "

# =================
# window Title変更
# =================
precmd () {print -Pn "\e]0;%~\a"}

# cdを使わずにディレクトリを移動
setopt auto_cd

# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

# =================
# PATH設定
# =================
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"

eval "$(pyenv init -)"

export PATH=$HOME/.npm-global/lib/node_modules/n/bin:$PATH

# TypeScript
export PATH="/Users/sasamotoryoki/.npm-global/bin$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ====================
# 環境変数
# ====================
export LANG=ja_JP.UTF-8

# ====================
# PATH Setting
# ====================
#export PATH=$HOME/.mpm-global/lib/node_modules/n/bin:$PATH

# TypeScript
#export PATH=$HOME/.npm-global/bin:$PATH

# NeoVim
export NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
  export PATH="${NEOVIM_HOME}/bin:$PATH"
fi

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
# llvmデバッグ用記載
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# ====================
# Alias
# ====================
alias ll='ls -l'

# ====================
# Zsh History Setting
# ====================
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000

# ====================
# 直前のコマンドの重複を削除
# ====================
setopt hist_ignore_dups

# ====================
# 同じコマンドをヒストリに残さない
# ====================
setopt hist_ignore_all_dups

# ====================
# 同時に起動しているZshの間でヒストリを共有
# ====================
setopt share_history

# ====================
# 補完機能を有効化
# ====================
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# ====================
# 補完時小文字大文字を区別しない
# ====================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ====================
# 補完候補を詰めて表示
# ====================
setopt list_packed

# ====================
# 補完候補一覧をカラー表示
# ====================
autoload colors
zstyle ':completion:*' list-colors ''

# ====================
# コマンドのスペルを訂正
# ====================
setopt correct

# ====================
# ビープ音を鳴らさない
# ====================
setopt no_beep

# ====================
# ディレクトリスタック
# ====================
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# ====================
# git
# ====================
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b[%a]'
precmd () { vcs_info }

# ====================
# prompt
# ====================
eval "$(starship init zsh)"

# ====================
# window Title変更
# ====================
precmd () {print -Pn "\e]0;%~\a"}

# cdを使わずにディレクトリを移動
setopt auto_cd

# cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

# ====================
# peco
# ====================
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

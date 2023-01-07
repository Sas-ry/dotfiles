#!/usr/bin/env zsh
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

# nerd_fontsインストール後Windows Terminalの場合はダウンロードしたフォントをインストールする必要がある
nerd_fonts() {
  git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh  # install all fonts
  cd ..
  rm -rf nerd-fonts
  command echo -e "\e[1;36m Installation of nerd_fonts completed!! \e[m"
}

powerline_fonts() {
  git clone --branch=master --depth 1 https://github.com/powerline/fonts.git
  cd fonts
  ./install.sh # install all fonts
  cd ..
  rm -fr fonts
  command echo -e "\e[1;36m Installation of powerline_fonts completed!! \e[m"
}

node_install() {
  if [ "$(uname)" == "Darwin" ]; then
    command echo "Mac"
  elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    command echo "Windows"
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    command echo "Linux"
    sudo apt -y install nodejs
  else
    command echo "Unknown OS"
  fi
}

link_to_homedir
nerd_fonts
powerline_fonts
node_install
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"

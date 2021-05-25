#!/usr/bin/env bash

source install_helpers.sh

function add_zsh_to_profile() {
  zsh_path=$(which zsh)

  echo "" >> ~/.profile
  echo "# Added by ${USER} for zsh" >> ~/.profile
  echo 'export SHELL=$(which zsh)' >> ~/.profile
  echo '[ -z "$ZSH_VERSION" ] && exec $SHELL -l' >> ~/.profile

  source ~/.profile
}

function change_shell() {
  [ "$SHELL" == "$(which zsh)" ] && echo -e "zsh is already the default shell" && return
  echo "User shell is not zsh. Changing..."
  if ! chsh -s $(which zsh); then
    echo "Failed with chsh. Setting .profile"
    add_zsh_to_profile
  fi
}

function install_antigen() {
  [[ -f ~/antigen.zsh ]] && echo -e "antigen is already installed" && return
  echo -e "\nInstalling antigen"
  curl -L git.io/antigen > ~/antigen.zsh
}

function update_zshrc() {
  if [[ -f ~/.zshrc ]]; then
    echo -e "zshrc file already exists. Find old file as /tmp/zshrc_old"
    mv ~/.zshrc /tmp/zshrc_old
  fi
  echo -e "\nCopying zshrc and zshenv"
  cp zshrc ${HOME}/.zshrc
  cp zshenv ${HOME}/.zshenv
}


install_tool zsh
install_antigen
update_zshrc
change_shell

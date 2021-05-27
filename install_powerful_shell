#!/usr/bin/env bash

source install_helpers.sh

function add_zsh_to_profile() {
  zsh_path=$(which zsh)

  echo "" >> $HOME/.profile
  echo "# Added by ${USER} for zsh" >> $HOME/.profile
  echo 'export SHELL=$(which zsh)' >> $HOME/.profile
  echo '[ -z "$ZSH_VERSION" ] && exec $SHELL -l' >> $HOME/.profile

  source $HOME/.profile
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
  [[ -f $HOME/antigen.zsh ]] && echo -e "antigen is already installed" && return
  echo -e "\nInstalling antigen"
  curl -L git.io/antigen > $HOME/antigen.zsh
}


update_file zshrc ${HOME}/.zshrc
update_file zshenv ${HOME}/.zshenv
update_file aliases ${HOME}/.aliases

install_tool zsh
install_antigen
change_shell

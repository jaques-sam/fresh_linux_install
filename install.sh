#!/usr/bin/env bash

function add_zsh_to_profile() {
  zsh_path=$(which zsh)

  echo "" >> ~/.profile
  echo "# Added by SAMJA for zsh" >> ~/.profile
  echo 'export SHELL=$(which zsh)' >> ~/.profile
  echo '[ -z "$ZSH_VERSION" ] && exec $SHELL -l' >> ~/.profile

  source ~/.profile
}

function change_shell() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo "User shell is not zsh. Changing..."
    if ! chsh -s $(which zsh); then
      echo "Failed with chsh. Setting .profile"
      add_zsh_to_profile
    fi
  fi
}

function install_antigen() {
  echo -e "\nInstalling antigen"
  curl -L git.io/antigen > ~/antigen.zsh
}

function update_zshrc() {
  echo -e "\nCopying zshrc"
  cp zshrc ~/.zshrc
}

if ! which zsh > /dev/null; then
  echo "The zsh is not installed on the system. Aborting."
  exit 1
fi

install_antigen
update_zshrc
change_shell

#!/usr/bin/env bash

function add_zsh_to_profile() {
  zsh_path=$(which zsh)

  echo "" >> ~/.profile
  echo "# Added by ${USER} for zsh" >> ~/.profile
  echo 'export SHELL=$(which zsh)' >> ~/.profile
  echo '[ -z "$ZSH_VERSION" ] && exec $SHELL -l' >> ~/.profile

  source ~/.profile
}

function change_shell() {
  [ "$SHELL" == "$(which zsh)" ] && return
  echo "User shell is not zsh. Changing..."
  if ! chsh -s $(which zsh); then
    echo "Failed with chsh. Setting .profile"
    add_zsh_to_profile
  fi
}

function install_antigen() {
  [[ -f ~/antigen.zsh ]] && return
  echo -e "\nInstalling antigen"
  curl -L git.io/antigen > ~/antigen.zsh
}

function update_zshrc() {
  if [[ -f ~/.zshrc ]]; then
    echo -e "\nzshrc file already exists. Find old file as /tmp/zshrc_old"
    mv ~/.zshrc /tmp/zshrc_old
  fi
  echo -e "\nCopying zshrc"
  cp zshrc ~/.zshrc
}

function install_rust() {
  command -v cargo > /dev/null && return
  curl https://sh.rustup.rs -sSf | sh
}

function install_ripgrep() {
  command -v rg > /dev/null && return
  sudo apt install build-essential
  echo -e "\nInstalling ripgrep"
  ## Replace block below by `sudo apt-get install ripgrep` since Ubuntu 18.10
  git clone https://github.com/BurntSushi/ripgrep /tmp/ripgrep
  cd /tmp/ripgrep
  cargo build --release
  mkdir -p ${HOME}/.cargo/bin/ && cp /tmp/ripgrep/target/release/rg ${HOME}/.cargo/bin/
  rm -rf /tmp/ripgrep
  cd - > /dev/null
  echo -e "\nInstalled ripgrep version $(${HOME}/.cargo/bin/rg --version)"
}

function install_fastmod() {
  command -v fastmod > /dev/null && return
  echo -e "\nInstalling fastmod"
  cargo install fastmod
}

if ! which zsh > /dev/null; then
  echo -e "\nInstalling zsh"
  sudo apt-get install zsh
fi

# Install powerful shell
install_antigen
update_zshrc
change_shell

# Install powerful tools
install_rust
install_ripgrep
install_fastmod
export PATH="$HOME/.cargo/bin:$PATH"

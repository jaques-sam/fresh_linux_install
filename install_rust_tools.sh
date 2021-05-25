#!/usr/bin/env bash

source install_helpers.sh

function install_rust() {
  command -v cargo > /dev/null && echo -e "rust is already installed" && return
  curl https://sh.rustup.rs -sSf | sh
  source $HOME/.cargo/env
}

function install_ripgrep() {
  command -v rg > /dev/null && echo -e "ripgrep is already installed" && return
  cargo install ripgrep
}

function install_ripgrep_old() {
  command -v rg > /dev/null && echo -e "ripgrep is already installed" && return
  install_tool build-essential
  echo -e "\nInstalling ripgrep"
  ## Replace block below by `install ripgrep` since Ubuntu 18.10
  git clone https://github.com/BurntSushi/ripgrep /tmp/ripgrep
  cd /tmp/ripgrep
  cargo build --release
  mkdir -p ${HOME}/.cargo/bin/ && cp /tmp/ripgrep/target/release/rg ${HOME}/.cargo/bin/
  rm -rf /tmp/ripgrep
  cd - > /dev/null
  echo -e "\nInstalled ripgrep version $(${HOME}/.cargo/bin/rg --version)"
}

function install_fastmod() {
  command -v fastmod > /dev/null && echo -e "fastmod is already installed" && return
  echo -e "\nInstalling fastmod"
  cargo install fastmod
}


install_rust
install_ripgrep
install_fastmod

cp zshenv ${HOME}/.zshenv

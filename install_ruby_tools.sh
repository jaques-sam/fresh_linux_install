#!/usr/bin/env bash

source install_helpers.sh

function install_ruby() {
  command -v ruby > /dev/null && echo -e "ruby is already installed" && return
  echo -e "\nInstalling ruby"

  cd /tmp/
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo '[[ -d $HOME/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'command -v rbenv && eval "$(rbenv init -)"' >> ~/.zshrc
  exec $SHELL

  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo '[[ -d $HOME/.rbenv/plugins/ruby-build/bin ]] && export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  exec $SHELL

  rbenv install 3.0.1
  rbenv global 3.0.1
  ruby -v

  command -v ruby > /dev/null || echo -e "ruby is not installed correctly!"
  cd -
}

function install_colorls() {
  command -v colorls > /dev/null && echo -e "colorls is already installed" && return
  gem install colorls
}


install_ruby
install_colorls


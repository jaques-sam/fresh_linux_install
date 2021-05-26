#!/usr/bin/env bash

source install_helpers.sh

install_tool git
update_file gitconfig $HOME/.gitconfig

install_tool rsync
install_tool vim
install_tool screen
install_tool jq
install_tool cmake
install_tool python3
install_tool python3-pip
install_tool sshpass


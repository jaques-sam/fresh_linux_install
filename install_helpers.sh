#!/usr/bin/env bash

function os_env() {
  unameOut="$(uname -s)"
  case "${unameOut}" in
  Linux*) machine=Linux ;;
  Darwin*) machine=Mac ;;
  CYGWIN*) machine=Cygwin ;;
  MINGW*) machine=MinGw ;;
  *) machine="UNKNOWN:${unameOut}" ;;
  esac
  echo "${machine}"
}

function distro_installer() {
  local machine
  machine="$(cat /etc/*-release | grep ID | head -n1 | cut -d '=' -f2)"
  case "${machine}" in
  debian | ubuntu*)
    installer="apt-get"
    ;;
  fedora*)
    installer="dnf"
    ;;
  *)
    installer="echo \'no \'"
    ;;
  esac
  echo "sudo ${installer}"
}

function os_installer() {
  local machine
  machine="$(os_env)"
  case "${machine}" in
  Linux*)
    installer=$(distro_installer)
    ;;
  Mac*)
    installer="brew"
    ;;
  Cygwin* | MinGw*)
    installer="choco"
    ;;
  *)
    installer="echo \'no \'"
    ;;
  esac
  echo "${installer}"
}

function print_commence() {
  local line
  local script_name="$1"

  line=$(printf "\n      %-30s%-s\n" "${script_name:0:30}" " ") # last string is used to fill
  echo -e "${line// /_}"
}

function is_installed() {
  local tool_name="$1"

  command -v "${tool_name}" >/dev/null && echo -e "${tool_name} is already installed"
}

function install_tool() {
  local tool_name="$1"

  is_installed "${tool_name}" && return
  echo -e "-------------------------"
  echo -e "\nInstalling ${tool_name}"

  $(os_installer) install "${tool_name}" -y
}

function update_dot_file() {
  local src_basename="$1"           # only name of the file
  local src_filename="dot_files/$1" # only name of the file
  local dest_filename="$2"          # filename (relative or absolute path)
  local difference

  if [[ ! -f ${dest_filename} ]]; then
    cp "${src_filename}" "${dest_filename}"
    return
  fi

  difference=$(diff "${dest_filename}" "${src_filename}" -u)
  if [[ -n "${difference}" ]]; then
    echo -e "${src_basename} file already exists, difference is:"
    echo -e "${difference}"
    echo -e "Find old file as /tmp/${src_basename}_old"
    mv "${dest_filename}" "/tmp/${src_basename}_old"
    cp "${src_filename}" "${dest_filename}"
  fi
}

function git_repo_update() {
  local git_repo_dir="$1"

  git -C "${git_repo_dir}" checkout master -f
  git -C "${git_repo_dir}" pull -f
}

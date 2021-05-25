
#!/usr/bin/env bash

function os_env()
{
  unameOut="$(uname -s)"
  case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
  esac
  echo ${machine}
}

function install_tool()
{
  tool_name="$1"

  machine="$(os_env)"
  case "${machine}" in
    Linux*)
        installer="sudo apt-get";;
    Mac*)
        installer="brew";;
    Cygwin* | MinGw*)
        installer="choco";;
    *)
        installer="echo \'no \'"
  esac
  
  command -v ${tool_name} > /dev/null && echo -e "${tool_name} is already installed" && return
  echo -e "\nInstalling ${tool_name}"
  eval "${installer} install ${tool_name}"
}


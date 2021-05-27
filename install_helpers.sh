
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

function os_installer()
{
  local machine="$(os_env)"
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
  echo ${installer}
}

function install_tool()
{
  local tool_name="$1"
  local installer=$(os_installer)

  command -v ${tool_name} > /dev/null && echo -e "${tool_name} is already installed" && return
  echo -e "\nInstalling ${tool_name}"
  eval "${installer} install ${tool_name} -y"
}

function update_file()
{
  local src_basename=$1  # only name of the file
  local dest_filename=$2  # filename (relative or absolute path)

  if [[ ! -f ${dest_filename} ]]; then
    cp ${src_basename} ${dest_filename}
    return
  fi

  local difference=$(diff ${dest_filename} ${src_basename})
  if [[ -n "${difference}" ]]; then
    echo -e "${src_basename} file already exists, difference is:"
    echo -e "${difference}"
    echo -e "Find old file as /tmp/${src_basename}_old"
    mv ${dest_filename} /tmp/${src_basename}_old
    cp ${src_basename} ${dest_filename}
  fi
}

function git_repo_update()
{
  local git_repo_dir=${1}
  git -C ${git_repo_dir} checkout master -f
  git -C ${git_repo_dir} pull -f
}
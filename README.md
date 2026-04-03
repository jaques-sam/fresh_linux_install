# My favorite zsh config & tools

## Actions

Update the dot files in ./dot_files from your existing dot files in ~/HOME:
`update_dot_files_here.sh`

Installation of the following tools:

Via `install_rust_tools.sh`:
At least:

  - full rust package
  - bat: better cat
  - du-dust (dust): better du with dir tree, graphs & %
  - exa: better ls
  - fastmod: refactor better and faster
  - fd-find: much easier find
  - ripgrep (rg): better and faster search to replace `grep`, `ag`, etc
  - procs: better ps
  - rm-improved: better rm with bin
  - sd: better sed
  - starship: fast prompt
  - tokei: code statistics
  - topgrade: upgrade everything
  - xcp: better 'cp'
  - zoxide: better 'cd' which does auto completion for paths

Via `install_common_tools.sh`
At least:

  - cmake
  - curl
  - diff-so-fancy
  - git
  - jq
  - python3
  - python3-pip
  - rsync
  - screen
  - sshpass
  - vim

Via `install_powerful_shell.sh`:

  - ~~zsh: our old default shell~~
  - fish: our new default shell
  - ~~powerlevel10k fast powerful shell prompt, this will start config wizard~~
  - starship: more powerful shell prompt written in rust

Common dot files under `./dot_files`:

  - `~/.aliases`
  - `~/.gitconfig`: **change your name & email!**
  - `~/.gitattributes`
  - `~/.bashrc`
  - `~/.zshrc`
  - `~/.zshenv`
  - `~/.ssh_agent.sh`: can be used for SSL

Full directories
  - `~/.config/fish...`: fish config and aliases, under `./fish_config`

## Installation

Just run `./install.sh`, this will call all install scripts.
You can also choose to run them individually.

if status is-interactive
    # Commands to run in interactive sessions can go here
end

test -d "$HOME/.aliases"; and source "$HOME/.aliases"
source $fish_function_path/aliases_functions.fish

test -d "$HOME/.local/bin"; and fish_add_path "$HOME/.local/bin"
test -d "$HOME/.modular/bin"; and fish_add_path "$HOME/.modular/bin"
test -f "$HOME/.aliases"; and source "$HOME/.aliases"
test -f "$HOME/.cargo/env"; and source "$HOME/.cargo/env.fish"
test -d "$HOME/bin"; and fish_add_path "$HOME/bin"
test -d "$HOME/local/valgrind"; and fish_add_path "$HOME/local/valgrind/bin/"
test -d "/usr/lib64/ccache/"; and fish_add_path "/usr/lib64/ccache/"

zoxide init fish | source
starship init fish | source
fish_add_path /home/sam/.pixi/bin

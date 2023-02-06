### FOR WSL
if [[ -n $(uname -r | rg "$WSL") ]] then;
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
    export LIBGL_ALWAYS_INDIRECT=1
    source "$HOME/.ssh_agent.sh"
fi

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

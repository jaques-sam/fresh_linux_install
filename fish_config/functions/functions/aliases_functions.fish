#!/usr/bin/env fish

function ,cargo-login
    az account get-access-token --query "join(' ', ['Bearer', accessToken])" --output tsv | cargo login --registry General
end

function ,cargo-test-count
    cargo test -- --list | awk '/[0-9]+ tests/{sum+=$1}END{print sum}'
end

function warn
    $argv
    zenity --info --text="Finished: $argv" or true
end

function mk
    echo "*** STARTING BUILD ***"
    nice ionice -n7 make -j (math (nproc) - 4) --load-average=10 $argv
    set error $status
    rs-notify "Build finished: $argv"
    notify-send "Build finished: $argv"
    return $error
end

function s
    set SKIP /target/ /build/ /test/ /unit/ /unittests/ /stub/ /js/ /svg/
    set skip_args
    for pattern in $SKIP
        set skip_args $skip_args -g!"*$pattern*"
    end
    nice ionice -n7 rg --vimgrep --color=always $skip_args $argv
end

function ,replace
    find ./ -type f -not -path "*/\.*" -exec sed -i -e "s/$argv[1]/$argv[2]/g" \{\} \;
end # use fastmod instead

function ,timediff
    set START (date +%s%6N)
    ./$argv[1]
    set END (date +%s%6N)
    echo "___________________"
    echo
    echo "Total time (in ns): "(math $END - $START)
end

function ,mv_to_subfolder
    find . -mindepth 1 -maxdepth 1 ! -name "$argv[1]" -exec mv \{\} "$argv[1]" \;
end

function ,size
    if command -v dust >/dev/null
        dust $argv
    else
        du -h --max-depth=1 $argv | sort -hr
    end
end

function define_ls_aliases
    if command -v exa >/dev/null
        alias ls='exa'
        alias ll='exa -lbh --icons --color=auto --group-directories-first'
        alias tree='exa --tree'
    else
        alias ll='ls -halt --color=auto'
    end

    alias l.='ls -d .*'
end

define_ls_aliases

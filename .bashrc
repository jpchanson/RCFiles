#colours
export PS1='\[\e[92m\u@\h:\] \[\e[31m\W\e[0m\]\$ '
export LS_COLORS='rs=0:di=01;32:ln=01;36:mh=00:pi=40;33'
export TERM=xterm-256color

 #some more ls aliases
alias ll='ls -Flrt --color --group-directories-first'
alias la='ls -AF --color --group-directories-first'
alias lla='ls -FAlrt --color --group-directories-first'
alias l='ls -CF --color --group-directories-first'
alias ls='ls -F --color --group-directories-first '
#ls commaands for retarded hosts
alias lsc='command ls -F'
alias llc='command ls -Flrt'
alias lac='command ls -AF'
alias llac='command ls -FAlrt'
#cd aliases
alias cd='cdl'
alias cdc='command cd'
#generic aliases
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias grep='grep --colour=auto'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias weather='wtr'

function tz
{
    HEAD="date --date="
    TAIL=""
    if [ "$1" = "krk"  ]; then
        TAIL='TZ="Poland/Krakow" now'
    fi
    if [ "$1" = "blr"  ]; then
        echo test
    fi
    if [ "$1" = "cgo"  ]; then
        echo test
    fi
   ${$HEAD$TAIL}
}

#fetch weather function
function wtr
{
    base='curl -4 -s wttr.in/'
    length='head -n 7'
    set command
    while getopts ":fl:" opt; do
        case ${opt} in
            f)
                `$base$location`
                echo "balls"
                ;;
            l)
                location=$OPTARG
                ;;
            \?)
                ;;
            :)
                $base | $length
                ;;
        esac
    done
$base
}

function cdl
{
    builtin cd "$1" && ls
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH=$PATH:/home/hansonj/Scripts
PATH=$PATH:/home/hansonj/Tools
export PATH
export IGWORK=/var/IGWork
export IGROOT=/opt/IGRoot
export IGDOMAIN=preprod #change as appropriate
export IGBUSAREA=fin

export winhome='/mnt/c/Users/hansonj/'
export windows='/mnt/c/'
export DOCKER_HOST='tcp://0.0.0.0:2375'

alias attach="ide -attach"
alias detach="ide -detach"
alias ps="ps -x"
alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

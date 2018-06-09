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
alias attach="ide -attach"
alias detach="ide -detach"
alias ps="ps -x"
alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'



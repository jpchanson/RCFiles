#required dependencies
source ~/RCFiles/.bash_aliases
source ~/RCFiles/.bash_functions

#PATH
PATH=$PATH:/home/hansonj/Scripts
PATH=$PATH:/home/hansonj/Tools
export PATH

#colours
export PS1='\[\e[92m\]\u@\h: \[\e[31m\]\W\[\e[0m\]> '
export LS_COLORS='rs=0:di=01;32:ln=01;36:mh=00:pi=40;33'
export TERM=xterm-256color

#General Environment Variables
export IGWORK=/var/IGWork
export IGROOT=/opt/IGRoot
export IGDOMAIN=preprod #change as appropriate
export IGBUSAREA=fin

export winhome='/mnt/c/Users/hansonj/'
export windows='/mnt/c/'
export DOCKER_HOST='tcp://0.0.0.0:2375'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    ifExistsSource /usr/share/bash-completion/bash_completion
    ifExistsSource /etc/bash_completion
fi



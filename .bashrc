#PATH
PATH=$PATH:~/Scripts/
PATH=$PATH:~/Tools/
PATH=$PATH:~/.local/bin/
export PATH

#colours
export PS1='\[\e[92m\]\u@\h: \[\e[31m\]\W\[\e[0m\]> '
export LS_COLORS='rs=00:no=33:fi=93:di=92:ln=01;36:pi=30;43:ex=95:or=91:tw=35:ow=01;35:st=103:su=00:sg=00'
export TERM=xterm-256color
export GIT_EDITOR=nvim

#required dependencies
source $HOME/RCFiles/bash/.bash_colours
source $HOME/RCFiles/bash/.bash_functions
source $HOME/RCFiles/bash/.bash_ps1
source $HOME/RCFiles/bash/.bash_aliases

# conditional includes for non standard tools
if type "fzf" > /dev/null; then
    source $HOME/RCFiles/bash/.bash_fzf
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    ifExistsSource /usr/share/bash-completion/bash_completion
    ifExistsSource /etc/bash_completion
fi


export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1,33m'
export LESS_TERMCAP_so=$'\e[01;40;95m'
export LESS_TERMCAP_us=$'\e[01;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export GROFF_NO_SGR=1
export MANPAGER='less -s -M +Gg'

umask 022
#export PS1="$(prompter)"
PROMPT_COMMAND=prompter

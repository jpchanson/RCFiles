##
#
#
function ifExistsSource
{
    if [ -f "$1"  ]; then
        source $1
    fi
}

##
#
#
function cdl
{
    builtin cd "$1" && ls
}

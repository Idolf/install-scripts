#!/bin/bash

# Bail on any error
set -e

# Simulate?
if [ "$BOOTSTRAP_IS_SIMUATION" == "yes" ] ; then
    function run () {
        echo "+ $@"
    }
else
    function run () {
        echo "+ $@"
        eval "$@"
    }
fi

# Utility functions
function promptyn () {
    if [ $# -eq 2 ] ; then
        if [ $2 == "y" ] ; then
            p="[Y/n]"
        else
            p="[y/N]"
        fi
    else
        p="[y/n]"
    fi
    while true; do
        read -p "$1 $p " yn
        if [ "x$yn" == "xy" ] || \
               [ "x$yn" == "xyes" ] || \
               [ "x$yn" == "xY" ] || \
               [ "x$yn" == "xYes" ] || \
               [ "x$yn" == "xYES" ] || \
               [[ "x$yn" == "x" && $# -eq 2 && $2 == "y" ]] ; then
            return 0
        fi
        if [ "x$yn" == "xn" ] || \
               [ "x$yn" == "xno" ] || \
               [ "x$yn" == "xN" ] || \
               [ "x$yn" == "xNo" ] || \
               [ "x$yn" == "xNO" ] || \
               [[ "x$yn" == "x" && $# -eq 2 && $2 == "n" ]] ; then
            return 1
        fi
        echo "Please answer yes or no" > /dev/stderr
    done
}

function promptoptions () {
    while true ; do
        read -p "$1 " opt
        if [ "x${opt}" == "x" ] ; then
            echo "$3"
            return
        fi
        if [[ "$2" =~ (^| )${opt}($| ) ]] ; then
            echo "${opt}"
            return
        fi
        echo "Invalid option" > /dev/stderr
    done
}

function strstr () {
    x="${1%%$2*}"
    [[ "$x" = "$1" ]] && echo -1 || echo ${#x}
}

function promptlist () {
    PROMPT="[$(echo "$1" | sed "s/\($2\)/\U\1/" | sed "s/./\0\\//g" | \
               head -c -2)] "
    while true ; do
        read -p "$PROMPT" opt
        if [ ${#opt} -eq 0 ] ; then
            opt=$2
        fi
        if [ ${#opt} -eq 1 ] ; then
            # downcase
            opt=${opt,,}
            if [[ $1 == *"$opt"* ]] ; then
                echo $opt
                return
            fi
        fi
        echo "?" > /dev/stderr
    done
}

function plural () {
    echo -n "$1"
    if [ $2 -ne 1 ] ; then
        echo -n s
    fi
}

function require () {
    echo "Checking for needed packages"
    for pkg in $@ ; do
        if dpkg --status $pkg >/dev/null 2>&1 ; then
            echo "OK $pkg"
        else
            echo "Missing $pkg"
            run sudo apt-get -y install --no-install-recommends $pkg
        fi
    done
}

function installed () {
    for x in $@ ; do
        if ! which $x >/dev/null ; then
            return 1
        fi
    done
    return 0
}

function should_install () {
    prog=$1
    if installed $prog ; then
        echo "OK $prog"
        return 1
    fi
    promptyn "\`$prog' is not installed; Install now?" "y"
    return $?
}

function __assert () {
    lineno=$1
    shift
    if ! eval "$@" ; then
        echo "ASSERTION FAILED <$0:$lineno>:"
        echo "  $@"
        exit 1
    fi
}

shopt -s expand_aliases
alias assert="__assert $LINENO"

function prologue () {
    set -e
    set -x
    NAME=$(basename "${0%.*}")
    DIR="/tmp/install-$NAME"
    rm -rf $DIR 2>/dev/null || sudo rm -rf $DIR
    mkdir $DIR
    cd $DIR
}

function epilogue () {
    rm -rf $DIR 2>/dev/null || sudo rm -rf $DIR
}

# Invariant:  we're in home for each script
[ -f ~/.environment ] && . ~/.environment
cd

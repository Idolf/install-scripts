#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

mkdir $HOME/git || true
if ! [ -e $HOME/git/net ]; then
  git clone git@github.com:Idolf/net.git $HOME/git/net
fi
if ! [ -e $HOME/git/check-pkgs ]; then
  git clone git@github.com:Idolf/check-pkgs $HOME/git/check-pkgs
fi

REPOS="bash emacs firefox gdb git ipython misc pkgs sakura screen vim xconfig xmonad"
PRIVREPOS="autorandr gpg password-store ssh net"
DOASKPULL=0
for repo in $REPOS $PRIVREPOS ; do
    if vcsh status $repo >/dev/null 2>&1 ; then
        if [ $DOASKPULL -eq 0 ] ; then
            if promptyn "Do \`pull' for existing repositories?" "y" ; then
                DOPULL=0
            else
                DOPULL=1
            fi
            DOASKPULL=1
        fi
        if [ $DOPULL -eq 0 ] ; then
            run vcsh $repo pull || true
            run vcsh $repo checkout -f master
        fi
    else
        if echo $PRIVREPOS | egrep -q -e "^$repo " -e " $repo$" -e " $repo "; then
          run vcsh clone odroid-home:vcsh/$repo $repo || true
        else
          run vcsh clone git@git.pwnies.dk:IdolfHatler/vcsh-$repo.git $repo || true
        fi
        run vcsh $repo checkout -f master
    fi
    assert [ -d "~/.config/vcsh/repo.d/$repo.git" ]
done

epilogue

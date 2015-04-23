#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

echo "Checking VCSH repositories"
REPOS="bash emacs gdb git ipython misc packages sakura screen vim wifi xconfig xmonad"
PRIVREPOS="gpg password-store ssh wifi-private"
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
        echo "OK $repo"
        if [ $DOPULL -eq 0 ] ; then
            run vcsh $repo pull || true
            run vcsh $repo reset --hard
        fi
    else
        echo "Missing $repo"
        # Special casing, yuck
        if echo $PRIVREPOS | egrep -q -e "^$repo " -e " $repo$" -e " $repo "; then
          run vcsh clone odroid-home:vcsh/$repo $repo || true
        else
          run vcsh clone git@git.pwnies.dk:IdolfHatler/vcsh-$repo.git $repo || true
        fi
        run vcsh $repo checkout -f master
    fi
    assert [ -d "~/.config/vcsh/repo.d/$repo.git" ]
done
echo "DONE"
echo


epilogue

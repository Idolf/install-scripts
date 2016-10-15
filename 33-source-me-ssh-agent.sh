#!/bin/sh

eval `ssh-agent`
ssh-add `ls ~/.ssh/keys/* | grep -v 'pub$'`

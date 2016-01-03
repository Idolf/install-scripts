#!/bin/bash
. "$(dirname "$0")/util.sh"

while ! [ -s .ssh/id_ed25519_odroid ] ; do
    mkdir -p .ssh || true
    chmod 0700 .ssh
    (base64 -d | gpg > .ssh/id_ed25519_odroid) <<_EOF
jA0EAwMC6s/GltHaDbZgycC0ef7YYVm8Nobw0OtfxzP++exhBDAbUTG0FSsN8gp736/F2S5fijge
OVbTxxrrR2OnJIawxuhd1spd02c6ec9meRlUkJhnfp7BWM7Ac+18//Fukk+G+HybMFTDbX9p8WCP
cHrtDK9TNNmK9wD48urPn1AVDYf4iMkpicg4whHNLcYW9etRRStKbMzHFQhuxNiZhZcCmWeTE7tB
+F/pGKOvdakhM3XreavMJNHU9329DFDphI7e7QV8tKFH/mz5YBX3/woyxoAeuhTcWSeHvZ8tJenY
507IKnaXQ9/+Hinx97t8YqiLQCz7vb5U+pSwpOOk1yT+JQ5NaYBAJWWL1yI8m57ZBW9nfvP0BJ0d
HiyFIVJrJkqNo7BFtefbOnFFNWLGMYTj1tfSSeqmdNoyUUuY+wvKQPvMOcJt2DDx1C4vvgtgBBAq
OHX6pp+EZWgzURdQ03PWfUd6iKYlSEd99KbjRmoiNjKPdoRaWD6/hXp41uwmSumD
_EOF
    chmod og-rwx -R .ssh
done

if ! [ -s .ssh/config ] ; then
    cat > ~/.ssh/config << EOF
Host odroid-home
    User freaken
    Hostname 82.180.25.186
    Port 22
    IdentityFile ~/.ssh/id_ed25519_odroid
    KexAlgorithms curve25519-sha256@libssh.org
    Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
    MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160,umac-128@openssh.com
    IdentitiesOnly yes

EOF
fi

ssh-add ~/.ssh/id_ed25519_odroid

#!/bin/bash
. "$(dirname "$0")/util.sh"

while ! [ -s ~/.ssh/keys/odroid ] ; do
    mkdir -p ~/.ssh/keys || true
    chmod og-rwx -R .ssh 
    cp /keybase/private/idolfhatler/odroid-ssh-key.gpg /tmp
    chmod og-rwx /tmp/odroid-ssh-key.gpg
    gpg -d /tmp/odroid-ssh-key.gpg > ~/.ssh/keys/odroid
    shred -u /tmp/odroid-ssh-key.gpg
    chmod og-rwx -R .ssh
done

if ! [ -s .ssh/config ] ; then
    cat > ~/.ssh/config << EOF
Host odroid
    User freaken
    Hostname odroid.lan
    Port 22
    IdentityFile ~/.ssh/keys/odroid
    KexAlgorithms curve25519-sha256@libssh.org
    Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
    MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160,umac-128@openssh.com
    IdentitiesOnly yes

EOF
fi

ssh-add ~/.ssh/keys/odroid

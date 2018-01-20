#!/bin/bash
. "$(dirname "$0")/util.sh"

while ! [ -s ~/.ssh/keys/odroidu3 ] ; do
    mkdir -p ~/.ssh/keys || true
    chmod og-rwx -R .ssh 
    cp /keybase/private/idolfhatler/odroidu3.gpg /tmp
    cp /keybase/private/idolfhatler/odroidu3.pub ~/.ssh/keys/odroidu3.pub
    chmod og-rwx /tmp/odroidu3.gpg
    gpg -d /tmp/odroidu3.gpg > ~/.ssh/keys/odroidu3
    shred -u /tmp/odroidu3.gpg
    chmod og-rwx -R .ssh
done

if ! [ -s .ssh/config ] ; then
    cat > ~/.ssh/config << EOF
Host odroidu3
    User idolf
    Hostname 192.168.8.15
    Port 22
    IdentityFile ~/.ssh/keys/odroidu3
    KexAlgorithms curve25519-sha256@libssh.org
    Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
    MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160,umac-128@openssh.com
    IdentitiesOnly yes

EOF
fi


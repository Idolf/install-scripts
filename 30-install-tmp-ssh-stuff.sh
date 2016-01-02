#!/bin/bash
. "$(dirname "$0")/util.sh"

while ! [ -s .ssh/id_ed25519_odroid ] ; do
    mkdir -p .ssh || true
    chmod 0700 .ssh
    (base64 -d | gpg > .ssh/id_ed25519_odroid) <<_EOF
jA0EAwMCfkcZmUI+9B1gycC1wVi/RUu6Iij5KEgGDqMmGgufTLOFwbDmiJRzKdPA77Ctam6IiFcu
hrcmBgPxnC3l+7Dmnzqggd3tFvtfqeLolDr37PYv+RXvY645dUcEZ3OMq/yTe/RrczLVAghfaZx5
d+hCUcBqxiuHJi2tiUoy0qC8fLLn5FCnwqHzTCQ6ex60P4LdBKWiyx9afv1LBfxSfAJ9106oT2GB
XJd6ZISwTyih7fn5svjvrA73n+eo85tGa7SH8xkvX+K2YE2W4rQ/vSN5P8i0ANtaYJN935L7Tg/a
GkWVryXNjwQcZVAhwS60wAyI4W+0rAwrAJEgW13f/zW5JgNYye8fVji13I8RuV9F5kLoz9Z0v6PZ
Rm6jc8KZL5ygVKss6zrQezu/sghac2nGKZZKSlUF6cISY/JXcQkFjTvr4zkLJa70yex/sERU0vm8
VpdDfRBT9Bpi1WF1L9ABP5EgMDETzvS2X3czOflqT6mrTVsGDrAB32h2jKXv1ohROQ==
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

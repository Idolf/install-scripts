#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

curl https://download.docker.com/linux/debian/gpg > docker-ce-key.gpg
sha256sum docker-ce-key.gpg | grep -q 1500c1f56fa9e26b9b8f42452a553675796ade0807cdce11975eb98170b3a570
sudo apt-key add - < docker-ce-key.gpg
echo "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list
sudo apt-get update && sudo apt-get install docker-ce

epilogue

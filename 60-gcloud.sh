#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

CLOUD_SDK_REPO="cloud-sdk-jessie"
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg > gcloud-key.gpg
sha256sum gcloud-key.gpg | grep -q 00bd7b1fbff8cbb74f4cab874624ee36db81373b0ca891c1c35b13e762437401
sudo apt-key add - < gcloud-key.gpg
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-sdk kubectl

epilogue

#!/bin/sh
sudo mkdir -p /etc/chromium/policies/managed/
echo '{ "EnableMediaRouter": false }' | sudo tee /etc/chromium/policies/managed/name_your_policy.json

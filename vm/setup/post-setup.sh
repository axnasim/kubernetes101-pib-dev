#!/bin/bash

### runs as pib user

# this runs after flux-setup.sh

echo "$(date +'%Y-%m-%d %H:%M:%S')  post start" >> "$HOME/status"

docker pull ghcr.io/cse-labs/pib-webv:latest
docker pull ghcr.io/cse-labs/pib-webv:beta

kubectl run jumpbox --image=ghcr.io/cse-labs/jumpbox --restart=Always

cli/kivm sync

kubectl get pods -A

echo "$(date +'%Y-%m-%d %H:%M:%S')  post complete" >> "$HOME/status"

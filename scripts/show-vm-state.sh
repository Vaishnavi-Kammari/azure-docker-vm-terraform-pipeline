#!/usr/bin/env bash
# Usage: ./scripts/show-vm-state.sh <vm_public_ip> [path_to_vm_key.pem]
set -euo pipefail
IP="${1:?vm public ip}"; KEY="${2:-terraform/vm_key.pem}"
ssh -i "$KEY" -o StrictHostKeyChecking=accept-new azureuser@"$IP" '
  echo "== /opt/app/compose.yaml =="; cat /opt/app/compose.yaml
  echo; echo "== docker ps =="; docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"
'

#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

CURRENT_PATH="${BASH_SOURCE%/*}"
INVENTORY_FILE="${CURRENT_PATH}/ansible/inventory.yml"
DEPLOYMENT_FILE="${CURRENT_PATH}/ansible/deploy.yml"

ansible-playbook -i ${INVENTORY_FILE} ${DEPLOYMENT_FILE}

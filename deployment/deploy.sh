#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

CURRENT_PATH="${BASH_SOURCE%/*}"
INVENTORY_FILE="${CURRENT_PATH}/ansible/inventory.yml"

ansible virtual_machines -m ping -i ${INVENTORY_FILE}

#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

CURRENT_PATH="${BASH_SOURCE%/*}"
ANSIBLE_PATH="$CURRENT_PATH/ansible"
TARGET="${ANSIBLE_PATH}/production"
MASTER_PLAYBOOK="${ANSIBLE_PATH}/site.yml"

ansible-playbook -i ${TARGET} ${MASTER_PLAYBOOK} -u "${ANSIBLE_USER}" -e "ansible_host=${ANSIBLE_HOST}"

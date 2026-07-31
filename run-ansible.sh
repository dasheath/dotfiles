#!/bin/bash

if ! command -v ansible > /dev/null ; then
  echo "❗ Ansible is not installed. Exiting."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ANSIBLE_DIR="${SCRIPT_DIR}/ansible"

if [[ ! -d "$ANSIBLE_DIR" ]]; then
  echo "❗ Ansible directory not present. Exiting."
  exit 1
fi

pushd "$ANSIBLE_DIR" > /dev/null
ansible-playbook site.yml
popd > /dev/null


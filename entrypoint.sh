#!/bin/bash

set -euo pipefail

# Check if any arguments are passed
if [ "$#" -eq 0 ]; then
    exec /bin/bash
else
    # Determine which Ansible command to execute
    case "$1" in
        playbook)
            shift
            exec ansible-playbook "$@"
            ;;
        config)
            shift
            exec ansible-config "$@"
            ;;
        galaxy)
            shift
            exec ansible-galaxy "$@"
            ;;
        vault)
            shift
            exec ansible-vault "$@"
            ;;
        console)
            shift
            exec ansible-console "$@"
            ;;
        *)
			shift
            # Default to the 'ansible' command
            exec ansible "$@"
            ;;
    esac
fi

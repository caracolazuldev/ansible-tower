#!/bin/bash

set -euo pipefail

# /usr/bin/ansible-community
# /usr/bin/ansible-config
# /usr/bin/ansible-console
# /usr/bin/ansible-doc
# /usr/bin/ansible-galaxy
# /usr/bin/ansible-inventory
# /usr/bin/ansible-lint
# /usr/bin/ansible-playbook
# /usr/bin/ansible-pull
# /usr/bin/ansible-test
# /usr/bin/ansible-vault
    
# Check if any arguments are passed
if [ "$#" -eq 0 ]; then
    exec /bin/bash
else
    # Determine which Ansible command to execute
    case "$1" in
        community)
            shift
            exec ansible-community "$@"
            ;;
        config)
            shift
            exec ansible-config "$@"
            ;;
        console)
            shift
            exec ansible-console "$@"
            ;;
        doc)
            shift
            exec ansible-doc "$@"
            ;;
        galaxy)
            shift
            exec ansible-galaxy "$@"
            ;;
        inventory)
            shift
            exec ansible-inventory "$@"
            ;;
        lint)
            shift
            exec ansible-lint "$@"
            ;;
        playbook)
            shift
            exec ansible-playbook "$@"
            ;;
        pull)
            shift
            exec ansible-pull "$@"
            ;;
        test)
            shift
            exec ansible-test "$@"
            ;;
        vault)
            shift
            exec ansible-vault "$@"
            ;;
        *)
			shift
            # Default to the 'ansible' command
            exec ansible "$@"
            ;;
    esac
fi

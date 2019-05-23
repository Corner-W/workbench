#!/bin/bash
# Install dotfiles into $HOME
#

function get_all_components
{
    /bin/ls -1d */install.sh 2>/dev/null | sed 's|/install\.sh$||'
}

function usage
{
    echo "Usage: $0 [component]"
    echo "List of components:" $(get_all_components)
}

function install_component
{
    local component=${1:?}

    echo "Installing component '$component' ..."

    [[ -d $component ]] || {
        echo "Component dir $component does not exist" >&2
        return 1
    }
    [[ -x $component/install.sh ]] || {
        echo "Installer for $component is not implemented yet, skipping" >&2
        return 0
    }

    (cd $component && ./install.sh)
}

function main
{
    local components
    local component

    if [[ ${1:-} == "-h" ]] || [[ ${1:-} == "--help" ]]; then
        usage
        return 0
    fi

    components=${@:-$(get_all_components)}

    for component in $components; do
        install_component $component
    done
}

main "$@"

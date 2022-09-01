#!/bin/bash

# Creates a set of symbolic links for a dotfiles repository.
#
# This script is meant to be a "quick start":
#   1. Clone your dotfiles repository
#   2. Run this script

DOTFILES_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
SCRIPT_NAME="$(basename "$0")"

declare -a EXCEPTIONS=(
    "README.md"
    "${SCRIPT_NAME}"
    "setup"
    ".gitignore"
)

main() {
    cd "$DOTFILES_DIRECTORY"

    link_files $(list_files_to_symlink)
    setup_oh_my_zsh
    setup_vim_plug
}

join_by() {
    local delimiter=$1
    shift
    echo -n "$1"
    shift
    printf "%s" "${@/#/$delimiter}"
}

list_files_to_symlink() {
    files_to_ignore=$(join_by "\\|" "${EXCEPTIONS[@]}")
    git ls-files | grep -v "^$files_to_ignore$"
}

link_files() {
    for file in "$@" ; do
        home_file="$HOME/$file"
        if [[ -e "$home_file" ]] ; then
            echo "Link for ${home_file} already exists - not doing anything"
        else
            home_file_directory="$(dirname "$home_file")"
            if ! [[ -d "$home_file_directory" ]] ; then
                mkdir -p "$home_file_directory"
            fi
            ln -vs "$DOTFILES_DIRECTORY/$file" "$home_file"
        fi
    done
}

setup_oh_my_zsh() {
    install_oh_my_zsh
}

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ] ; then
        echo "oh-my-zsh isn't installed - cloning from git"
        git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    fi
}

setup_vim_plug() {
    if ! [[ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]] ; then
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
}

main

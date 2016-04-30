#!/usr/bin/env bash

# cd "$(dirname "${BASH_SOURCE}")";
#
# git pull origin master;
#
# function doIt() {
# 	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
# 		--exclude "README.md" -avh --no-perms . ~;
# 	source ~/.bash_profile;
# }
#
# if [ "$1" == "--force" -o "$1" == "-f" ]; then
# 	doIt;
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
# 	echo "";
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		doIt;
# 	fi;
# fi;
# unset doIt;


cd "$(dirname "$BASH_SOURCE")" \
    && source "utils.sh"

declare -a FILES_TO_SYMLINK=(

    "shell/aliases"
    "shell/bash_profile"
    "shell/bash_prompt"
    "shell/bashrc"
    "shell/exports"
    "shell/functions"
    "shell/inputrc"

    "git/gitconfig"
    "git/gitignore"

    # "shell/bash_aliases"
    # "shell/bash_autocomplete"
    # "shell/bash_exports"
    # "shell/bash_functions"
    # "shell/bash_logout"
    # "shell/bash_options"
    # "shell/bash_profile"
    # "shell/bash_prompt"
    # "shell/bashrc"
    # "shell/curlrc"
    # "shell/inputrc"
    # "shell/screenrc"
    # "shell/tmux.conf"
    #
    # "git/gitattributes"
    # "git/gitconfig"
    # "git/gitignore"
    #
    # "vim/vim"
    # "vim/vimrc"
    # "vim/gvimrc"

)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in ${FILES_TO_SYMLINK[@]}; do

        # sourceFile="$(cd .. && pwd)/$i"
        sourceFile="$(pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ]; then
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                rm -rf "$targetFile"
                execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
            else
                print_error "$targetFile → $sourceFile"
            fi
        fi

    done

}

main

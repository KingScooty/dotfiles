#!/bin/bash

declare skipQuestions=false

main() {

    # Ensure that the following actions
    # are made relative to this file's path.

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Load utils

    if [ -x "utils.sh" ]; then
        . "utils.sh" || exit 1
    else
        echo "Error with utils. Do they exist/executable?"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    echo "what the fuck is in this @?!?!"
    echo $@
    echo $*
    echo "It should be set to y on CI"

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    # Install deps
    # ./brew.sh
    # ./brew-cash.sh
    # ./npm.sh
    # ./zsh.sh

    ./bootstrap.sh "$@"

}

main "$@"

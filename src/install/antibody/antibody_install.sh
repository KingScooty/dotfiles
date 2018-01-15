#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

brew install getantibody/tap/antibody

antibody bundle < ./bundles.txt > ~/.zsh_plugins.sh

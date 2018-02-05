#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./homebrew/homebrew_utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode/xcode_cmdlt.sh
./homebrew/homebrew.sh
./homebrew/packages.sh
./homebrew/apps.sh
./antibody/antibody_install.sh
./npm/npm.sh
# ./../nvm.sh

# ./browsers.sh
# ./compression_tools.sh
# ./git.sh
# ./gpg.sh
# ./image_tools.sh
# ./misc.sh
# ./misc_tools.sh
# ./../npm.sh
# ./tmux.sh
# ./video_tools.sh
# ./../vim.sh
# ./web_font_tools.sh


print_in_purple "\n   Cleanup\n\n"
brew_cleanup
# ./cleanup.sh

./prezto/zsh_prezto.sh

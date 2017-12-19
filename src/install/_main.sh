#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./homebrew_utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode_cmdlt.sh
./homebrew.sh
./packages.sh
./apps.sh
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

./zsh_prezto.sh

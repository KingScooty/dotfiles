#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
[ -e "/usr/local/bin/sha256sum" ] && rm -rf /usr/local/bin/sha256sum
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils --with-default-names

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
brew install gnu-which --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`. (The step below takes care of this)
brew install bash
brew install bash-completion2
brew install gawk

# Install `wget` with IRI support.
brew install wget --with-iri

# Install tools for shell syntax highlighting
brew install python

brew install python3
brew postinstall python3

pip install --upgrade pip
pip install Pygments

# Install more recent versions of some OS X tools.
brew install vim --with-override-system-vi
brew install grep --with-default-names
brew install openssh --with-libressl


# Install other useful binaries.
brew install ack #faster than grep
brew install z

brew install git
brew install git-lfs
# Install gpg to sign git commits
brew install gpg

brew install yarn
brew install flow

brew install speedtest_cli
brew install ssh-copy-id #installs public key on remote via ssh
brew install tree
brew install webkit2png #screenshot webpage

brew install dark-mode
dark-mode on #enable dark mode

# Remove outdated versions from the cellar.
brew cleanup

# Add bash4 to /etc/shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Bash completion notes made during brew install?
# if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
#   . $(brew --prefix)/share/bash-completion/bash_completion
# fi

#!/usr/bin/env bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2
brew install zsh
brew install zsh-syntax-highlighting


# Install some more Lanaguages - probably need to add in Ruby, Elixr, and a couple of other languages
brew install go
brew install python
brew install clojure/tools/clojure
brew install elixir


brew install protobuf

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install pandoc
brew install screen
brew install tmux


# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install graphviz
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install Java - it never installs the correct
# version of java so I will probably need to update this in the future
brew cask install java

# Install Applications
brew cask install 1password
brew cask install alfred
brew cask install bartender
brew install --cask google-chrome
brew cask install dash
brew cask install evernote
brew cask install flux
brew cask install firefox
brew cask install insomnia
brew cask install insomnia-designer
brew cask install iterm2
brew cask install macdown
brew cask install microsoft-word
brew cask install microsoft-excel
brew cask install microsoft-powerpoint
brew cask install nordvpn
brew cask install postman
brew cask install proxyman
brew cask install sketch
brew cask install skitch
brew cask install spectacle
brew cask install sublime-text
brew cask install tableplus
brew cask install transmit
brew cask install vlc

# Install Cloud Storage Providers
brew cask install dropbox
brew cask install onedrive

# Install AWS cli
brew install awscli

# Install Azure CLI
brew install azure-cli

# Install Google SDK when the time comes
brew install --cask google-cloud-sdk

#Remove all the stuff and cleanup
brew cleanup
